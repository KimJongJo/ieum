package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;

public class MyCommunityDaoImpl implements MyCommunityDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public List<MyCommunityDto> selectMyCommunityList(int uNo) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.community.selectMyCommunityList", uNo);
		}
	}

}
