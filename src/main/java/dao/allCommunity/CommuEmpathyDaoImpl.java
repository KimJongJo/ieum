package dao.allCommunity;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class CommuEmpathyDaoImpl implements CommuEmpathyDao{
	private SqlSession session;
	
	public CommuEmpathyDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public boolean checkEmpathy(int uNo, int commuNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("uNo", uNo);
		map.put("commuNo", commuNo);
		Integer count = session.selectOne("mapper.commu_like.selectEmpathy", map);
		return count != null && count > 0;
	}

	@Override
	public void insertEmpathy(int uNo, int commuNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("uNo", uNo);
		map.put("commuNo", commuNo);
		
		session.insert("mapper.commu_like.insertEmpathy", map);
		session.commit();
	}

	@Override
	public void deleteEmpathy(int uNo, int commuNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("uNo", uNo);
		map.put("commuNo", commuNo);
		
		session.delete("mapper.commu_like.deleteEmpathy", map);
		session.commit();
	}

	@Override
	public void updateCommuEmpathy(int commuNo, int delta) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("commuNo", commuNo);
		map.put("delta", delta);
		
		session.update("mapper.commu_like.updateCommunityEmpathy", map);
		session.commit();
	}

	@Override
	public int getEmpathyCount(int commuNo) throws Exception {
	    return session.selectOne("mapper.commu_like.selectCommunityEmpathy", commuNo);
	}

}
