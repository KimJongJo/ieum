package dao.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.AllCommunityDto;
import util.MybatisSqlSessionFactory;
import util.PageInfo;

public class AllCommunityDaoImpl implements AllCommunityDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public List<AllCommunityDto> selectAllCommunityList() {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			List<AllCommunityDto> list = session.selectList("mapper.community.selectAllCommunityList");
			return list;
		}
	}
	// 페이징
	@Override
	public List<AllCommunityDto> selectList(Integer row, String sort, String category) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
	        Map<String, Object> param = new HashMap<>();
	        param.put("row", row);
	        param.put("sort", sort);
	        param.put("category", category);
	        return session.selectList("mapper.community.selectList", param);
	    }
	}
	//페이징
	@Override
	public Integer selectCount(String category) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> param = new HashMap<>();
	        param.put("category", category);
			return session.selectOne("mapper.community.selectCount",param);
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
