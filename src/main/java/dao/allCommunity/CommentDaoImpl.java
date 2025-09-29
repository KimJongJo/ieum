package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.CommentDto;
import util.MybatisSqlSessionFactory;

public class CommentDaoImpl implements CommentDao{
	private SqlSession session;
	
	public CommentDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}

	@Override
	public void insert(CommentDto commentDto) throws Exception {
		session.insert("mapper.comment.insertComment", commentDto);
		session.commit();
	}

	@Override
	public List<CommentDto> selectCommentWithNick(int commuNo) throws Exception {
		return session.selectList("mapper.comment.selectCommentWithNick", commuNo);
	}
}
