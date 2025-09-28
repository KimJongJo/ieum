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
	public void saveEmailCode(String email, String code) {
		
		EmailAuthDto emailDto = session.selectOne("checkEmail", email);
		
		EmailAuthDto inputEmailDto = new EmailAuthDto(email, code);
		
		if(emailDto == null) { // 처음 인증 받는 회원일 때
			session.insert("insertEmail", inputEmailDto);
		}else { // 이전에 인증 받았던 회원일 때
			session.update("updateEmail", inputEmailDto);
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

}
