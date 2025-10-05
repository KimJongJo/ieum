package dto;

import java.sql.Date;

public class MemberDto {
	
	Integer uNo;	// 회원번호
	String id;	// 아이디
	String username;	// 이름
	Date birthDate;	// 생년월일
	String password;	// 비밀번호
	String gender;	//성별
	String uTel; //전화번호
	String email;	//이메일
	Date createdAt;	// 가입일
	String userType;	// 회원분류 -> 
	String major; //전공
	String introduction; //자기소개
	String nickname; //닉네임
	String uAddress; //주소
	Boolean diaryPrivate; //다이어리 공개여부
	Integer warningCount; //경고수
	String socialId; //소셜로그인
	Integer hNo; //소속 병원 번호
	Integer stateCode;	//상태코드
	Integer fileNo;
	
	
	public MemberDto() {
		super();
	}
	
	
	// 일반 유저 회원가입
	public MemberDto(String id, String username, Date birthDate, String password, String gender, String uTel,
			String email, String nickName, String uAddress, Boolean diaryPrivate) {
		super();
		this.id = id;
		this.username = username;
		this.birthDate = birthDate;
		this.password = password;
		this.gender = gender;
		this.uTel = uTel;
		this.email = email;
		this.nickname = nickName;
		this.uAddress = uAddress;
		this.diaryPrivate = diaryPrivate;
	}

	// 병원관리자 회원가입
	public MemberDto(String id, String username, Date birthDate, String password, String gender, String uTel,
			String email, String userType, String major, Integer hNo) {
		super();
		this.id = id;
		this.username = username;
		this.birthDate = birthDate;
		this.password = password;
		this.gender = gender;
		this.uTel = uTel;
		this.email = email;
		this.userType = userType;
		this.major = major;
		this.hNo = hNo;
	}
	
	// 소셜 회원가입
	public MemberDto(String id, String username, Date birthDate, String gender, String uTel, String email,
			String nickname, String uAddress, Boolean diaryPrivate, Integer fileNo) {
		super();
		this.id = id;
		this.username = username;
		this.birthDate = birthDate;
		this.gender = gender;
		this.uTel = uTel;
		this.email = email;
		this.nickname = nickname;
		this.uAddress = uAddress;
		this.diaryPrivate = diaryPrivate;
		this.fileNo = fileNo;
	}
	
	

	public MemberDto(Integer uNo, String password) {
		super();
		this.uNo = uNo;
		this.password = password;
	}

	

	public MemberDto(Integer uNo, String id, String username, Date birthDate, String password, String gender,
			String uTel, String email, Date createdAt, String userType, String major, String introduction,
			String nickName, String uAddress, Boolean diaryPrivate, Integer warningCount, String socialId,
			Integer hNo, Integer stateCode, Integer fileNo) {
		super();
		this.uNo = uNo;
		this.id = id;
		this.username = username;
		this.birthDate = birthDate;
		this.password = password;
		this.gender = gender;
		this.uTel = uTel;
		this.email = email;
		this.createdAt = createdAt;
		this.userType = userType;
		this.major = major;
		this.introduction = introduction;
		this.nickname = nickName;
		this.uAddress = uAddress;
		this.diaryPrivate = diaryPrivate;
		this.warningCount = warningCount;
		this.socialId = socialId;
		this.hNo = hNo;
		this.stateCode = stateCode;
		this.fileNo = fileNo;
	}
	
	
	
	
	
	@Override
	public String toString() {
		return "MemberDto [uNo=" + uNo + ", id=" + id + ", username=" + username + ", birthDate=" + birthDate
				+ ", password=" + password + ", gender=" + gender + ", uTel=" + uTel + ", email=" + email
				+ ", createdAt=" + createdAt + ", userType=" + userType + ", major=" + major + ", introduction="
				+ introduction + ", nickname=" + nickname + ", uAddress=" + uAddress + ", diaryPrivate=" + diaryPrivate
				+ ", warningCount=" + warningCount + ", socialId=" + socialId + ", hNo=" + hNo + ", stateCode=" + stateCode
				+ ", fileNo=" + fileNo + "]";
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
	public String getuTel() {
		return uTel;
	}
	public void setuTel(String uTel) {
		this.uTel = uTel;
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
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public Boolean getDiaryPrivate() {
		return diaryPrivate;
	}
	public void setDiaryPrivate(Boolean diaryPrivate) {
		this.diaryPrivate = diaryPrivate;
	}
	public Integer getWarningCount() {
		return warningCount;
	}
	public void setWarningCount(Integer warningCount) {
		this.warningCount = warningCount;
	}
	public String getSocialId() {
		return socialId;
	}
	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}
	public Integer gethNo() {
		return hNo;
	}
	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}
	public Integer getStateCode() {
		return stateCode;
	}
	public void setStateCode(Integer stateCode) {
		this.stateCode = stateCode;
	}	
	
	public String getNickName() {
		return nickname;
	}

	public void setNickName(String nickName) {
		this.nickname = nickName;
	}


	public Integer getFileNo() {
		return fileNo;
	}


	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}


}
