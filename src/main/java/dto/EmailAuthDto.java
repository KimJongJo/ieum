package dto;

import java.sql.Timestamp;

public class EmailAuthDto {
	Integer authNo;
	String email;	// 이메일
	String code;	// 인증코드
	Timestamp expiredAt;	// 만료시간
	
	
	public EmailAuthDto() {
		super();
	}
	
	
	

	public EmailAuthDto(String email, String code) {
		super();
		this.email = email;
		this.code = code;
	}




	public EmailAuthDto(Integer authNo, String email, String code, Timestamp expiredAt) {
		super();
		this.authNo = authNo;
		this.email = email;
		this.code = code;
		this.expiredAt = expiredAt;
	}


	@Override
	public String toString() {
		return "EmailAuthDto [authNo=" + authNo + ", email=" + email + ", code=" + code + ", expiredAt=" + expiredAt
				+ "]";
	}


	public Integer getAuthNo() {
		return authNo;
	}


	public void setAuthNo(Integer authNo) {
		this.authNo = authNo;
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

	public Timestamp getExpiredAt() {
		return expiredAt;
	}

	public void setExpiredAt(Timestamp expiredAt) {
		this.expiredAt = expiredAt;
	}
	
	
	
	

}
