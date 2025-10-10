package dao.diagnosis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.DiagnosisHistoryDto;
import dto.otherDto.DiagnosisInfoDto;
import dto.otherDto.ShowDIaListToUser;
import util.MybatisSqlSessionFactory;

public class DiagnosisDaoImpl implements DiagnosisDao {
	
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public void createDia(DiagnosisHistoryDto diagnosisHistoryDto) {
		try(SqlSession session = sqlSessionFactory.openSession()){

			System.out.println("dao>>>>"+diagnosisHistoryDto.getReservationNo());
			session.insert("createDia", diagnosisHistoryDto);
			session.commit();
		}
	}

	// 임시저장
	@Override
	public void tempSave(DiagnosisHistoryDto diagnosisHistoryDto) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			System.out.println(diagnosisHistoryDto);
			session.update("tempSave", diagnosisHistoryDto);
			session.commit();
		}
	}

	// 저장
	@Override
	public void writeCompleted(DiagnosisHistoryDto diagnosisHistoryDto) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			session.update("writeCompleted", diagnosisHistoryDto);
			session.commit();
		}
	}

	@Override
	public void diaCompleted(Integer dNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			session.update("diaCompleted", dNo);
			session.commit();
		}
	}

	// 로그인한 의사의 과거 진단 기록수
	@Override
	public int diaCount(Integer uNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("PastDiagnosesCount", uNo);
		}
	}
	
	@Override
	public int diaDateCount(Map<String, Object> datePage) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("diaDateCount", datePage);
		}
	}

	// 로그인한 의사의 과거 진단 기록들
	@Override
	public List<DiagnosisInfoDto> pastDia(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("selectPastDiagnoses", page);
		}
	}
	
	@Override
	public List<DiagnosisInfoDto> pastDateDia(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("pastDateDia", page);
		}
	}

	@Override
	public Map<String, Object> getDiaInfo(Integer dNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("getDiaInfo", dNo);
		}
	}

	@Override
	public int diaKeywordCount(Map<String, Object> keywordPage) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("diaKeywordCount", keywordPage);
		}
	}
	
	@Override
	public int diaKeywordAndDateCount(Map<String, Object> keywordPage) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("diaKeywordAndDateCount", keywordPage);
		}
	}

	@Override
	public List<DiagnosisInfoDto> pastKeywordDia(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("pastKeywordDia", page);
		}
	}

	@Override
	public List<DiagnosisInfoDto> pastKeywordAndDateDia(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("pastKeywordAndDateDia", page);
		}
	}

	@Override
	public Map<String, Object> selectUserInfo(Integer diaNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("selectUserInfo", diaNo);
		}
	}

	@Override
	public List<DiagnosisInfoDto> getDiaList(Integer diaNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("getDiaList", diaNo);
		}
	}

	@Override
	public List<DiagnosisInfoDto> getDiaAllList(Integer diaNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("getDiaAllList", diaNo);
		}
	}
	
	@Override
	public ShowDIaListToUser getUserDiaDetail(Integer diaNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("getUserDiaDetail", diaNo);
		}
	}

	@Override
	public List<ShowDIaListToUser> getUserDiaList(Integer uNo, int offset, int limit) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("uNo", uNo);
			map.put("offset", offset);
			map.put("limit", limit);
			return session.selectList("getUserDiaList", map);
		}
	}

	// 날짜에 맞는 진단서 리스트
	@Override
	public List<ShowDIaListToUser> getUserDiaListByDate(Map<String, Object> map) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("getUserDiaListByDate", map);
		}
	}

	// 총 진단서 개수 반환
	@Override
	public int getTotalCount(Integer uNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("getTotalCount", uNo);
		}
	}

	@Override
	public int getTotalCountByDate(Map<String, Object> paramMap) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("getTotalCountByDate", paramMap);
		}
	}

	@Override
	public List<Map<String, Object>> selectAll(Integer uNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("selectAllDiaList", uNo);
		}
	}

	@Override
	public ShowDIaListToUser selectDiaByNo(Integer diaNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("selectDiaByNo", diaNo);
		}
	}

	@Override
	public ShowDIaListToUser selectLatestDiagnosisByUser(int uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("mapper.diagnosis_history.getLatestDiagnosisByUser", uNo);
		}
	}







}
