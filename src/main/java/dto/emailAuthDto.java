package dto;

import java.util.Date;

public class emailAuthDto {
	
	String email;	// 이메일
	String code;	// 인증코드
	Date expiredAt;	// 만료시간
	
	
	public emailAuthDto() {
		super();
	}

	public emailAuthDto(String email, String code, Date expiredAt) {
		super();
		this.email = email;
		this.code = code;
		this.expiredAt = expiredAt;
	}
	
	

	@Override
	public String toString() {
		return "emailAuthDto [email=" + email + ", code=" + code + ", expiredAt=" + expiredAt + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getExpiredAt() {
		return expiredAt;
	}

	public void setExpiredAt(Date expiredAt) {
		this.expiredAt = expiredAt;
	}
	
	
	
	

}
