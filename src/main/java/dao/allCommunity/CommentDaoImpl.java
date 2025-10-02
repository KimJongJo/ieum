package dao.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.CommentDto;
import util.MybatisSqlSessionFactory;

public class CommentDaoImpl implements CommentDao{
	private SqlSession session;
	
	public CommentDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	// 댓글 등록
	@Override
	public void insert(CommentDto commentDto) throws Exception {
		session.insert("mapper.comment.insertComment", commentDto);
		session.commit();
	}
	
	//댓글 리스트
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

	// 댓글 조회 
	@Override
	public List<CommentDto> getCommentsByCommuNo(int commuNo) throws Exception {
		return session.selectList("mapper.comment.selectCommentsByCommuNo", commuNo);
	}
	
	
	
	// 댓글 갯수 가져오기
	@Override
	public int countCommentsByCommuNo(int commuNo) throws Exception {
		return session.selectOne("mapper.comment.countCommentsByCommuNo", commuNo);
	}
	
	
	
	// community의 commu_comment 갱신하기
	@Override
	public void updateCommentCount(int commuNo, int count) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("commuNo", commuNo);
		map.put("count", count);
		session.update("mapper.comment.updateCommentCount", map);
		session.commit();
	}
	@Override
	public CommentDto selectByNo(int commeNo) throws Exception {
		
		return session.selectOne("mapper.comment.selectByNo", commeNo);
	}

}
