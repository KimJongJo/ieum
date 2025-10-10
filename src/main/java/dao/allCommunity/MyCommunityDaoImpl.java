package dao.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;

public class MyCommunityDaoImpl implements MyCommunityDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public List<MyCommunityDto> selectMyCommunityList(int uNo) throws Exception  {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.community.selectMyCommunityList", uNo);
		}
	}

	@Override
	public List<MyCommunityDto> selectLikedCommunityList(int uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.community.selectLikedCommunityList", uNo);
		}
	}

	@Override
	public boolean checkEmpathy(int uNo, int commuNo) throws Exception {
		 Map<String, Object> map = new HashMap<>();
		 map.put("uNo", uNo);
		 map.put("commuNo", commuNo);
		 try(SqlSession session = sqlSessionFactory.openSession()) {
			 return session.selectOne("mapper.comunity.selectEmpathy", map);
		 }
	}
	
	
	
	@Override
	public MyCommunityDto selectMyCommunityOne(int uNo) throws Exception {
	    try (SqlSession session = sqlSessionFactory.openSession()) {
	        return session.selectOne("mapper.community.selectMyCommunityOne", uNo);
	    }
	}

	@Override
	public MyCommunityDto selectLikedCommunityOne(int uNo) throws Exception {
	    try (SqlSession session = sqlSessionFactory.openSession()) {
	        return session.selectOne("mapper.community.selectLikedCommunityOne", uNo);
	    }
	}
	
	
	
	
	
	@Override
	public List<MyCommunityDto> selectMyList(Integer row) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
		return session.selectList("mapper.article.selectList", row);
	}
	}
	@Override
	public Integer selectMyConut() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
		return session.selectOne("mapper.article.selectCount");
	}
	}
}
