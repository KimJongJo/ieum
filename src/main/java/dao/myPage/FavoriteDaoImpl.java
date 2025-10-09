package dao.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.FavoriteDto;
import util.MybatisSqlSessionFactory;

public class FavoriteDaoImpl implements FavoriteDao {
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public FavoriteDto select(Integer hFNo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("hFNo", hFNo);
			return sqlsession.selectOne("mapper.favorite.select", params );
		}
	}
	@Override
	public Integer cnt(Integer uNo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("selectFavCnt", uNo); 
		}
	}
	@Override
	public void delete(Integer hFNo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			sqlsession.selectOne("mapper.favorite.selectFavList", hFNo );
			sqlsession.commit();
		}
		
	}
	@Override
	public List<FavoriteDto> selectFavList(Integer row, Integer uNo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("uNo", uNo);
			return sqlsession.selectOne("mapper.favorite.selectFavList", params );
		}
	}
	
}
