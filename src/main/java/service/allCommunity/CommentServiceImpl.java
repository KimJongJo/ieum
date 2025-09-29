package service.allCommunity;

import java.util.List;

import dao.allCommunity.CommentDao;
import dao.allCommunity.CommentDaoImpl;
import dto.CommentDto;

public class CommentServiceImpl implements CommentService{
	private CommentDao commentDao;
	
	public CommentServiceImpl() {
		commentDao = new CommentDaoImpl();
	}
	
	
	@Override
	public void insertComment(CommentDto commentDto) throws Exception {
		commentDao.insert(commentDto);
	}


	@Override
	public List<CommentDto> getCommentsByCommuNo(Integer commuNo) throws Exception {
		return commentDao.selectCommentWithNick(commuNo);
	}

}
