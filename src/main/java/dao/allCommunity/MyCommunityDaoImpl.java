package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;

public class MyCommunityDaoImpl implements MyCommunityDao{
	private SqlSession session;
	
	public MyCommunityDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
		
	@Override
	public List<MyCommunityDto> selectMyCommunityList(int uNo) throws Exception  {
		return session.selectList("mapper.community.selectMyCommunityList", uNo);
	}

	@Override
	public List<MyCommunityDto> selectLikedCommunityList(int uNo) throws Exception {
		return session.selectList("mapper.community.selectLikedCommunityList", uNo);
	}

}
