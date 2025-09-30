package dao.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.DiagnosisHistoryDto;
import dto.DiaryDto;
import util.MybatisSqlSessionFactory;

public class DiaryDaoImpl implements DiaryDao {

	@Override
	public void insert(DiaryDto diary) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			session.insert("insert", diary);
			session.commit();
		}
	}

	@Override
	public DiaryDto select(Integer dNo) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			return session.selectOne("selectDetail", dNo);
		}
	}

	@Override
	public Integer cnt() throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			return session.selectOne("selectCnt");
		}
	}

	@Override
	public List<DiaryDto> selectDiaryList(Integer uNo, Integer row) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("uNo", uNo);
			params.put("row", row);
			return session.selectList("selectList", params);
		}
	}

	@Override
	public DiaryDto update(DiaryDto diary) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			session.update("update", diary);
			session.commit();
			return diary;
		}
	}

	@Override
	public void delete(Integer dNo) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			session.delete("delete", dNo);
			session.commit();
		}
	}

	@Override
	public List<DiagnosisHistoryDto> selectHisList(Integer uNo) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			return session.selectList("selectHisList", uNo);
		}
	}

	@Override
	public DiaryDto selectDate(Integer uNo, String date) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("uNo", uNo);
			params.put("date", date);
			return session.selectOne("selectDate", params);
		}
	}

	@Override
	public List<DiaryDto> selectCalList(Integer uNo, String sDate, String eDate) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("uNo", uNo);
			params.put("sDate", sDate);
			params.put("eDate", eDate);
			return session.selectList("selectCalList", params);
		}
	}
}
