package dao.applicant;

import org.apache.ibatis.session.SqlSession;

import dto.ApplicantDto;
import util.MybatisSqlSessionFactory;

public class ApplicantDaoImpl implements ApplicantDao {

	SqlSession session;
	public ApplicantDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public void addApplicant(ApplicantDto appDto) {
		
		session.insert("addApplicant", appDto);
		session.commit();
		
	}

}
