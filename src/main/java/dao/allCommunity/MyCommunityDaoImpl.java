package dao.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	@Override
	public boolean checkEmpathy(int uNo, int commuNo) throws Exception {
		 Map<String, Object> map = new HashMap<>();
		 map.put("uNo", uNo);
		 map.put("commuNo", commuNo);
         return session.selectOne("mapper.CommuEmpathyMapper.selectEmpathy", map);
    }

}
