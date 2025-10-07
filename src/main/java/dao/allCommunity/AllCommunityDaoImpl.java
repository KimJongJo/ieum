package dao.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<AllCommunityDto> selectList(Integer row) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
	        Map<String, Object> param = new HashMap<>();
	        param.put("row", row);
	        return session.selectList("mapper.community.selectList", param);
	    }
	}

	@Override
	public Integer selectCount() throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.community.selectCount");
		}
	}

	@Override
	public Integer getSearchCnt(String keyword) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> param = new HashMap<>();
	        param.put("keyword", keyword);
	        return session.selectOne("mapper.community.searchCommuCnt", param);
		}
	}

	@Override
	public List<AllCommunityDto> getSearchList(String keyword) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> param = new HashMap<>();
	        param.put("keyword", keyword);
	        return session.selectList("mapper.community.searchCommuity", param);
		}
	}

}
