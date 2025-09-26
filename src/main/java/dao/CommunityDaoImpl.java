package dao;

import org.apache.ibatis.session.SqlSession;

import dto.CommunityDto;
import util.MybatisSqlSessionFactory;

public class CommunityDaoImpl implements CommunityDao{
	private SqlSession session;
	public CommunityDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public void insert(CommunityDto community) throws Exception {
		
		try {
			session.insert("mapper.community.insertCommunity", community);
			session.commit();
		}finally {
			session.close();
		}
	}

}
