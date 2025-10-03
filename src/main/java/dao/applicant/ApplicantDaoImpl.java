package dao.applicant;

import org.apache.ibatis.session.SqlSession;

import dto.ApplicantDto;
import dto.otherDto.RequestInfoDto;
import util.MybatisSqlSessionFactory;

public class ApplicantDaoImpl implements ApplicantDao {

	
	@Override
	public void addApplicant(ApplicantDto appDto){
		try(SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			session.insert("addApplicant", appDto);
			session.commit();
		}
	}

	@Override
	public ApplicantDto select(Integer hNo) {
		try(SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			return session.selectOne("selectRequestInfo", hNo);
		}
		
	}

}
