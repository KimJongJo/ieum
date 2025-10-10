package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.CommentWithMemberDto;
import util.MybatisSqlSessionFactory;

public class CommentWithMemberDaoImpl implements CommentWithMemberDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	
	@Override
	public List<CommentWithMemberDto> selectMemberWithComment(Integer row) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
		return session.selectList("mapper.comment.selectMemberWithComment", row);
		}
	}
	
	public Integer selectCommentCount(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.comment.selectCommentCount", uNo);
		}
	}

	@Override
	public boolean checkEmpathy(int uNo, int commuNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
