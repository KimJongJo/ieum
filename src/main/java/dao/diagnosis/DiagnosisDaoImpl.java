package dao.diagnosis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.DiagnosisHistoryDto;
import dto.otherDto.DiagnosisInfoDto;
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

	// 로그인한 의사의 과거 진단 기록들
	@Override
	public List<DiagnosisInfoDto> pastDia(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("selectPastDiagnoses", page);
		}
	}

	@Override
	public Map<String, Object> getDiaInfo(Integer dNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("getDiaInfo", dNo);
		}
	}

}
