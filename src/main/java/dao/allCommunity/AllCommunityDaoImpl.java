package dao.allCommunity;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.AllCommunityDto;
import util.MybatisSqlSessionFactory;

public class AllCommunityDaoImpl implements AllCommunityDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public List<AllCommunityDto> selectAllCommunityList() {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			List<AllCommunityDto> list = session.selectList("mapper.community.selectAllCommunityList");
			return list;
		}
	}
}
