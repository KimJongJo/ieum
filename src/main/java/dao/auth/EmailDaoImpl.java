package dao.auth;

import org.apache.ibatis.session.SqlSession;

import dto.EmailAuthDto;
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
	public EmailAuthDto checkEmailCode(EmailAuthDto emailDto) {
		
		return session.selectOne("checkEmailCode", emailDto);
	}

}
