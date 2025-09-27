package dao.auth;

import java.util.Map;

import dto.EmailAuthDto;
import dto.MemberDto;

public interface EmailDao {

	void saveEmailCode(String email, String code);

	EmailAuthDto checkEmailCode(EmailAuthDto emailDto);

	MemberDto useEmail(String email);

	Map<String, Object> CheckIdAndEmail(Map<String, Object> pwMail);

}
