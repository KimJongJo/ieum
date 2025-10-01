package dao.auth;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.EmailAuthDto;
import dto.MemberDto;
import util.MybatisSqlSessionFactory;

public class EmailDaoImpl implements EmailDao {

	SqlSession session;
	public EmailDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public void saveEmailCode(EmailAuthDto emailAuthDto) {
		
		String email = emailAuthDto.getEmail();
		EmailAuthDto emailDto = session.selectOne("checkEmail", email);
		
		if(emailDto == null) { // 처음 인증 받는 회원일 때
			session.insert("insertEmail", emailAuthDto);
		}else { // 이전에 인증 받았던 회원일 때
			session.update("updateEmail", emailAuthDto);
		}
		
		session.commit();
		
	}

	@Override
	public EmailAuthDto checkEmailCode(String email) {
		
		return session.selectOne("checkEmailCode", email);
	}

	@Override
	public MemberDto useEmail(String email) {
		return session.selectOne("useEmail", email);
	}

	@Override
	public Map<String, Object> CheckIdAndEmail(Map<String, Object> pwMail) {
		
		return session.selectOne("CheckIdAndEmail", pwMail);
	}


	@Override
	public void saveHosCode(Map<String, Object> hosMap) {
		session.update("saveHosCode", hosMap);
		session.commit();
		
	}

}
