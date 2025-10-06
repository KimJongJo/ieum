package dao.diagnosis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.DiagnosisHistoryDto;
import util.MybatisSqlSessionFactory;

public class DiagnosisDaoImpl implements DiagnosisDao {
	
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public void createDia(DiagnosisHistoryDto diagnosisHistoryDto) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			session.insert("createDia", diagnosisHistoryDto);
			session.commit();
		}
	}

}
