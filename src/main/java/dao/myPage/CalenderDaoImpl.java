package dao.myPage;

import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.DiaryDto;
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

	@Override
	public List<DiaryDto> selectAllByUser(int uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
		return session.selectList("mapper.diary.selectAllByUser", uNo);
		}
	}
}
