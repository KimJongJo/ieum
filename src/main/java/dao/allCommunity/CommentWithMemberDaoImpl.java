package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.CommentWithMemberDto;
import util.MybatisSqlSessionFactory;

public class CommentWithMemberDaoImpl implements CommentWithMemberDao{
	private SqlSession session;
	
	public CommentWithMemberDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	
	@Override
	public List<CommentWithMemberDto> selectMemberWithComment(Integer uNo) throws Exception {
		return session.selectList("mapper.comment.selectMemberWithComment", uNo);
	}

}
