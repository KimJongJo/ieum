package dto.otherDto;

import java.sql.Date;

public class ManagerInfoDto {
	
	private Integer uNo; // 매니저 번호
	private String userType; // 회원 타입('HOSMANAGER', 'DOCTOR')
	private String username; // 회원 이름
	private Integer hNo; // 병원 번호
	private String hNm; // 병원 이름
	private String email; // 이메일
	private Date createdAt; // 가입일
	private Integer stateCode; // 상태 코드
	private String major; // 전공
	private String prifileImg; // 이미지 경로
	
	public ManagerInfoDto(Integer uNo, String userType, String username, Integer hNo, String hNm, String email,
			Date createdAt, Integer stateCode, String major, String prifileImg) {
		super();
		this.uNo = uNo;
		this.userType = userType;
		this.username = username;
		this.hNo = hNo;
		this.hNm = hNm;
		this.email = email;
		this.createdAt = createdAt;
		this.stateCode = stateCode;
		this.major = major;
		this.prifileImg = prifileImg;
	}
	
	
	
	

	public ManagerInfoDto(Integer uNo, String userType, String username, Integer hNo, String hNm, String email,
			Date createdAt, Integer stateCode, String major) {
		super();
		this.uNo = uNo;
		this.userType = userType;
		this.username = username;
		this.hNo = hNo;
		this.hNm = hNm;
		this.email = email;
		this.createdAt = createdAt;
		this.stateCode = stateCode;
		this.major = major;
	}





	@Override
	public String toString() {
		return "ManagerInfoDto [uNo=" + uNo + ", userType=" + userType + ", username=" + username + ", hNo=" + hNo
				+ ", hNm=" + hNm + ", email=" + email + ", createdAt=" + createdAt + ", stateCode=" + stateCode
				+ "major=" + major + "prifileImg" + prifileImg + "]";
	}



	public String getPrifileImg() {
		return prifileImg;
	}



	public void setPrifileImg(String prifileImg) {
		this.prifileImg = prifileImg;
	}



	public Integer getuNo() {
		return uNo;
	}

	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer gethNo() {
		return hNo;
	}

	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}

	public String gethNm() {
		return hNm;
	}

	public void sethNm(String hNm) {
		this.hNm = hNm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Integer getStateCode() {
		return stateCode;
	}

	public void setStateCode(Integer stateCode) {
		this.stateCode = stateCode;
	}



	public String getMajor() {
		return major;
	}



	public void setMajor(String major) {
		this.major = major;
	}
	
	

}
