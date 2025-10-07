package dto.otherDto;

public class HospitalDocDto {
	
	Integer uNo;	// 회원번호
	String username;	// 이름
	String gender;	//성별
	String uTel; //전화번호
	String email;	//이메일
	String userType;	// 회원분류 -> 
	String major; //전공
	String introduction; //자기소개
	Integer stateCode;	//상태코드
	Integer fileNo;	//회원 프로필
	
	String fileName; //파일명
	String filePath; // 경로
	
	HospitalDocDto(){
		super();
	}

	public HospitalDocDto(Integer uNo, String username, String gender, String uTel, String email, String userType,
			String major, String introduction, Integer stateCode, Integer fileNo, String fileName, String filePath) {
		super();
		this.uNo = uNo;
		this.username = username;
		this.gender = gender;
		this.uTel = uTel;
		this.email = email;
		this.userType = userType;
		this.major = major;
		this.introduction = introduction;
		this.stateCode = stateCode;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.filePath = filePath;
	}
	

	@Override
	public String toString() {
		return "HospitalDocDto [uNo=" + uNo + ", username=" + username + ", gender=" + gender + ", uTel=" + uTel
				+ ", email=" + email + ", userType=" + userType + ", major=" + major + ", introduction=" + introduction
				+ ", stateCode=" + stateCode + ", fileNo=" + fileNo + ", fileName=" + fileName + ", filePath="
				+ filePath + "]";
	}

	public Integer getuNo() {
		return uNo;
	}

	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public Integer getStateCode() {
		return stateCode;
	}

	public void setStateCode(Integer stateCode) {
		this.stateCode = stateCode;
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	
	
	

}
