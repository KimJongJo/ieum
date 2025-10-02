package service.allCommunity;

import java.util.List;

import dao.allCommunity.CommentDao;
import dao.allCommunity.CommentDaoImpl;
import dao.allCommunity.CommunityDao;
import dao.allCommunity.CommunityDaoImpl;
import dto.CommentDto;

public class CommentServiceImpl implements CommentService{
	private CommentDao commentDao;
	
	public CommentServiceImpl() {
		commentDao = new CommentDaoImpl();
	}
	
	
	@Override
	public void insertComment(CommentDto commentDto) throws Exception {
		commentDao.insert(commentDto);
		// 2. 해당 게시글 댓글 수 조회
        int count = commentDao.countCommentsByCommuNo(commentDto.getCommuNo());

        // 3. community 테이블 commu_comment 갱신
        commentDao.updateCommentCount(commentDto.getCommuNo(), count);
	}


	@Override
	public List<CommentDto> getCommentsByCommuNo(Integer commuNo) throws Exception {
		return commentDao.selectCommentWithNick(commuNo);
	}	

}
