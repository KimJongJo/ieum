package dao.auth;

import java.util.Map;

import dto.EmailAuthDto;
import dto.MemberDto;

public interface EmailDao {

	void saveEmailCode(EmailAuthDto emailAuthDto);

	EmailAuthDto checkEmailCode(String email);

	MemberDto useEmail(String email);

	Map<String, Object> CheckIdAndEmail(Map<String, Object> pwMail);

	void saveHosCode(Map<String, Object> hosMap);

}
