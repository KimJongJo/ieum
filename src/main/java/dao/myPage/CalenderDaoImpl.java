package dao.myPage;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;

public class CalenderDaoImpl implements CalenderDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public MyCommunityDto selectMyRecentCommunity(int uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("mapper.community.selectMyCommunityOne", uNo);
		}
	}
	
	
}
