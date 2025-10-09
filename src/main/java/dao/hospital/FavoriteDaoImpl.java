package dao.hospital;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import util.MybatisSqlSessionFactory;

public class FavoriteDaoImpl implements FavoriteDao {
	
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public void insertFav(Map<String, Object> favInfo) throws Exception {
		try ( SqlSession sqlsession = sqlSessionFactory.openSession()){
			sqlsession.insert("insertFav",favInfo);
			sqlsession.commit();
		}
	}

	@Override
	public void deleteFav(Map<String, Object> favInfo) throws Exception {
		try ( SqlSession sqlsession = sqlSessionFactory.openSession()){
			sqlsession.delete("deleteFav",favInfo);
			sqlsession.commit();
		}
		
	}

	@Override
	public Integer Favorite(Map<String, Object> favInfo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()){
			return sqlsession.selectOne("existsFav", favInfo);
		}
	}

}
