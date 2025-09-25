package service;

import org.apache.ibatis.session.SqlSession;

import dao.CommunityDao;
import dao.CommunityDaoImpl;
import dto.CommunityDto;
import util.MybatisSqlSessionFactory;

public class CommunityServiceImpl implements CommunityService{
	private CommunityDao communityDao;
	private SqlSession session;
	
	public CommunityServiceImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
		communityDao = new CommunityDaoImpl();
	}

	@Override
	public Integer insertCommunity(CommunityDto community) throws Exception {
		communityDao.insert(community);
		return community.getCommuNO();
	} 
}
