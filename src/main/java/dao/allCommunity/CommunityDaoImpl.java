package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.CommunityDto;
import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;

public class CommunityDaoImpl implements CommunityDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public void insert(CommunityDto community) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("mapper.community.insertCommunity", community);
			session.commit();
		}
	}
	
	// 게시글 삭제
	@Override
	public int deleteCommunity(int commuNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			int result = session.delete("mapper.community.deleteCommunity", commuNo);
			session.commit();
			return result;
		}
		
	}
	 // 게시글 조회
	@Override
	public CommunityDto selectByNo(int commuNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.community.selectByNo", commuNo);
		}
	}

	@Override
	public void updateCommu(MyCommunityDto myCommunityDto) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.update("mapper.community.updateCommunity", myCommunityDto);
			session.commit();
		}
	}

	@Override
	public void updateViewsCount(int commuNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.update("mapper.community.updateViews", commuNo);
			session.commit();
		}
	}
}
