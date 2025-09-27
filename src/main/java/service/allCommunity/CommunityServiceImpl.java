package service.allCommunity;

import org.apache.ibatis.session.SqlSession;

import dao.allCommunity.CommunityDao;
import dao.allCommunity.CommunityDaoImpl;
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
		session.commit();
		return community.getCommuNO();
	}

	@Override
	public CommunityDto selectByNo(Integer commuNo) throws Exception {
		return session.selectOne("mapper.community.selectByNo", commuNo);
	} 
}
