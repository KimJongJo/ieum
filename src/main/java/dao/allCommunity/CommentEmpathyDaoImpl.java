package dao.allCommunity;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class CommentEmpathyDaoImpl implements CommentEmpathyDao{
	private SqlSession session;
	
	public CommentEmpathyDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}

	@Override
	public boolean ckeckCommeEmpathy(int uNo, int commeNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("uNo", uNo);
		map.put("commeNo", commeNo);
		Integer count = session.selectOne("mapper.comme_like.selectCommeEmpathy", map);
		session.commit();
		return count != null && count > 0; 
	}

	@Override
	public void insertCommeEmpathy(int uNo, int commeNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("uNo", uNo);
		map.put("commeNo", commeNo);
		
		session.insert("mapper.comme_like.insertCommeEmpathy", map);
		session.commit();
	}

	@Override
	public void deleteCommeEmpathy(int uNo, int commeNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("uNo", uNo);
		map.put("commeNo", commeNo);
		session.delete("mapper.comme_like.deleteCommeEmpathy", map);
		session.commit();
		
	}

	@Override
	public void updateCommeEmpathy(int commeNo, int delta) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("commeNo", commeNo);
		map.put("delta", delta);
		session.update("mapper.comme_like.updateCommentEmpathy", map);
		session.commit();
	}

	@Override
	public int getCommeEmpathyCount(int commeNo) throws Exception {
		return session.selectOne("mapper.comme_like.selectComentEmpathy", commeNo);
	}
}


