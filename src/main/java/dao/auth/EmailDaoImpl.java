package dao.auth;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.EmailAuthDto;
import dto.MemberDto;
import util.MybatisSqlSessionFactory;

public class EmailDaoImpl implements EmailDao {


	@Override
	public void saveEmailCode(EmailAuthDto emailAuthDto) {
		
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			String email = emailAuthDto.getEmail();
			EmailAuthDto emailDto = session.selectOne("checkEmail", email);
			
			if(emailDto == null) { // 처음 인증 받는 회원일 때
				session.insert("insertEmail", emailAuthDto);
			}else { // 이전에 인증 받았던 회원일 때
				session.update("updateEmail", emailAuthDto);
			}
			
			session.commit();
		}
		
		
	}

	@Override
	public EmailAuthDto checkEmailCode(String email) {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			
			return session.selectOne("checkEmailCode", email);
		}
		
	}

	@Override
	public MemberDto useEmail(String email) {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			
			return session.selectOne("useEmail", email);
		}
	}

	@Override
	public Map<String, Object> CheckIdAndEmail(Map<String, Object> pwMail) {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			
			return session.selectOne("CheckIdAndEmail", pwMail);
		}
	}


	@Override
	public void saveHosCode(Map<String, Object> hosMap) {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			session.update("saveHosCode", hosMap);
			session.commit();
		}
		
	}

}
