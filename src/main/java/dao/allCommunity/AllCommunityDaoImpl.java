package dao.allCommunity;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import dto.AllCommunityDto;
import util.MybatisSqlSessionFactory;

public class AllCommunityDaoImpl implements AllCommunityDao{
private SqlSession session;
	
	public AllCommunityDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public List<AllCommunityDto> selectAllCommunityList() {
		List<AllCommunityDto> list = session.selectList("mapper.community.selectAllCommunityList");
		return list;
	}
	
	

}
