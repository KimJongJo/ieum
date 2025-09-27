package service.auth;

import dto.EmailAuthDto;

public interface EmailService {
	void sendEmail(String email) throws Exception;

	int checkEmail(EmailAuthDto emailDto);
}
