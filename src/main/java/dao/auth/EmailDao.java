package dao.auth;

import dto.EmailAuthDto;

public interface EmailDao {

	void saveEmailCode(String email, String code);

	EmailAuthDto checkEmailCode(EmailAuthDto emailDto);

}
