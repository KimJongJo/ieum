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
	 // 해당 게시글 댓글 삭제
	@Override
	public int deleteCommentsByCommuNo(Integer commuNo) throws Exception {
		int result = session.delete("mapper.comment.deleteCommentsByCommuNo", commuNo);
	    session.commit();
	    return result;
	}

	// 댓글 조회 (참고)
	@Override
	public List<CommentDto> getCommentsByCommuNo(int commuNo) throws Exception {
		return session.selectList("mapper.comment.selectCommentsByCommuNo", commuNo);
	}
}
