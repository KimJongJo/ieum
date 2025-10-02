package service.allCommunity;

import java.util.List;

import dao.allCommunity.CommentWithMemberDao;
import dao.allCommunity.CommentWithMemberDaoImpl;
import dto.CommentWithMemberDto;

public class CommentWithMemberServiceImpl implements CommentWithMemberService{
	
	private CommentWithMemberDao commentWithMemberDao;
	
	public CommentWithMemberServiceImpl() {
		commentWithMemberDao = new CommentWithMemberDaoImpl(); 
	}
	@Override
	public List<CommentWithMemberDto> getMemWithCom(Integer uNo) throws Exception {
		return commentWithMemberDao.selectMemberWithComment(uNo);
	}
	
}
