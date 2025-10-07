package dao.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.otherDto.MainCommuDto;
import dto.otherDto.MainDiagnosisDto;
import dto.otherDto.MainHosDto;
import dto.otherDto.MainNoticeDto;
import dto.otherDto.MainUserDto;
import util.MybatisSqlSessionFactory;

public class MainDaoImpl implements MainDao {
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public List<MainHosDto> selectMainHosList() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.main.selectMainHosList");
		}
	}

	@Override
	public MainUserDto selectLoginInfo(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.main.selectLoginInfo");
		}
	}

	@Override
	public List<MainDiagnosisDto> selectDiagnosis() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.main.selectDiagnosis");
		}
	}

	@Override
	public List<MainCommuDto> selectCommuList() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.main.selectCommu");
		}
	}

	@Override
	public List<MainNoticeDto> selectNoticeList(Integer isPinned) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.main.selectNotice", isPinned);
		}
	}

	@Override
	public List<MainHosDto> selectMapHosList(String userLocX, String userLocY) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("userLocX", userLocX);
			params.put("userLocY", userLocY);	
			return session.selectList("mapper.main.selectMapList", params);
		}
	}

	@Override
	public MainHosDto selectMapHosInfo(Integer hosNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.main.selectMap", hosNo);
		}
	}
	
}

