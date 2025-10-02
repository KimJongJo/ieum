package dao.applicant;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ApplicantDto;
import dto.otherDto.RequestInfoDto;
import util.MybatisSqlSessionFactory;

public class ApplicantDaoImpl implements ApplicantDao {

	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public void addApplicant(ApplicantDto appDto) {
		try(SqlSession session = sqlSessionFactory.openSession()) {		
			session.insert("addApplicant", appDto);
			session.commit();
		}
		
	}

	@Override
	public ApplicantDto select(Integer hNo) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("selectRequestInfo", hNo);
		}
	}

}
