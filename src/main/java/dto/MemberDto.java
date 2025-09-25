package dto;

import java.sql.Date;

public class MemberDto {
	
	Integer uNo;	// 회원번호
	String id;	// 아이디
	String username;	// 이름
	Date birthDate;	// 생년월일
	String password;	// 비밀번호
	String gender;	//성별
	String email;	//이메일
	Integer state;	//상태코드
	Integer fileNo;	//파일번호(프로필사진)
	Date createdAt;	// 가입일
	String userType;	// 회원분류
	
	
	public MemberDto() {}
	
	public MemberDto(Integer uNo, String id, String username, Date birthDate, String password, String gender,
			String email, Integer state, Integer fileNo, Date createdAt, String userType) {
		super();
		this.uNo = uNo;
		this.id = id;
		this.username = username;
		this.birthDate = birthDate;
		this.password = password;
		this.gender = gender;
		this.email = email;
		this.state = state;
		this.fileNo = fileNo;
		this.createdAt = createdAt;
		this.userType = userType;
	}
	
	@Override
	public String toString() {
		return "memberDto [uNo=" + uNo + ", id=" + id + ", username=" + username + ", birthDate=" + birthDate
				+ ", password=" + password + ", gender=" + gender + ", email=" + email + ", state=" + state
				+ ", fileNo=" + fileNo + ", createdAt=" + createdAt + ", userType=" + userType + "]";
	}


	public Integer getuNo() {
		return uNo;
	}
	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getFileNo() {
		return fileNo;
	}
	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
	

}
