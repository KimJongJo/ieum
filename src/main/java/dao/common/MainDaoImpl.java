package dao.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.otherDto.MainHosDto;
import util.MybatisSqlSessionFactory;

public class MainDaoImpl implements MainDao {
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public List<MainHosDto> selectMainHosList() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.main.selectMainHosList");
		}
	}
	
}

