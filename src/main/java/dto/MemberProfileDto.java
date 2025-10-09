package dto;

public class MemberProfileDto {
	Integer uNo;
    String id;
    String username;
    String nickname;
    String uAddress;
    String email;
    String uTel;
    Boolean diaryPrivate;
    Integer stateCode;	//상태코드
    
    // file 테이블 컬럼 (profile)
    Integer fileNo;
    String fileName;    
    String filePath;
    String fileCategory;
    
    public MemberProfileDto() {}
    
	public MemberProfileDto(Integer uNo, String id, String username, String nickname, String uAddress, String email,
			String uTel, Boolean diaryPrivate, Integer stateCode, Integer fileNo, String fileName, String filePath,
			String fileCategory) {
		super();
		this.uNo = uNo;
		this.id = id;
		this.username = username;
		this.nickname = nickname;
		this.uAddress = uAddress;
		this.email = email;
		this.uTel = uTel;
		this.diaryPrivate = diaryPrivate;
		this.stateCode = stateCode;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileCategory = fileCategory;
	}



	@Override
	public String toString() {
		return "MemberProfileDto [uNo=" + uNo + ", id=" + id + ", username=" + username + ", nickname=" + nickname
				+ ", uAddress=" + uAddress + ", email=" + email + ", uTel=" + uTel + ", diaryPrivate=" + diaryPrivate
				+ ", stateCode=" + stateCode + ", fileNo=" + fileNo + ", fileName=" + fileName + ", filePath="
				+ filePath + ", fileCategory=" + fileCategory + "]";
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getuTel() {
		return uTel;
	}
	public void setuTel(String uTel) {
		this.uTel = uTel;
	}
	public Boolean getDiaryPrivate() {
		return diaryPrivate;
	}
	public void setDiaryPrivate(Boolean diaryPrivate) {
		this.diaryPrivate = diaryPrivate;
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
	public String getFileCategory() {
		return fileCategory;
	}
	public void setFileCategory(String fileCategory) {
		this.fileCategory = fileCategory;
	}

	public Integer getStateCode() {
		return stateCode;
	}

	public void setStateCode(Integer stateCode) {
		this.stateCode = stateCode;
	}
    
    
    
}
