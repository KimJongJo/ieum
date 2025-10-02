package service.auth;

import dto.EmailAuthDto;

public interface EmailService {
	void sendEmail(String email, String type) throws Exception;

	int checkEmail(String email, String code);

	boolean useEmail(String email);

	boolean pwToEmail(String userId, String email);

	void sendHosKey(Integer hNo, String email);

}
