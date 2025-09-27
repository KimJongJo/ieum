package service.auth;

import org.mindrot.jbcrypt.BCrypt;

public class PassAuthServiceImpl implements PassAuthService {

	// 비밀번호 암호화
	@Override
	public String securityPw(String userPw) {
		
		return BCrypt.hashpw(userPw, BCrypt.gensalt());
	}

}
