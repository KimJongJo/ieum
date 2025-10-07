package dto.otherDto;

import java.sql.Date;

public class MemberFileDto {
	
	private Integer uNo;
	private String username;
	private String imgFile;
	private String email;
	private Date createdAt;
	private Integer warningCount;
	private Integer stateCode;
	
	public MemberFileDto(Integer uNo, String username, String imgFile, String email, Date createdAt,
			Integer warningCount, Integer stateCode) {
		super();
		this.uNo = uNo;
		this.username = username;
		this.imgFile = imgFile;
		this.email = email;
		this.createdAt = createdAt;
		this.warningCount = warningCount;
		this.stateCode = stateCode;
	}
	

	@Override
	public String toString() {
		return "MemberFileDto [uNo=" + uNo + ", username=" + username + ", imgFile=" + imgFile + ", email=" + email
				+ ", createdAt=" + createdAt + ", warningCount=" + warningCount + ", stateCode=" + stateCode
				+ ", getuNo()=" + getuNo() + ", getUsername()=" + getUsername() + ", getImgFile()=" + getImgFile()
				+ ", getEmail()=" + getEmail() + ", getCreatedAt()=" + getCreatedAt() + ", getWarningCount()="
				+ getWarningCount() + ", getStateCode()=" + getStateCode() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
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

	public String getImgFile() {
		return imgFile;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
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

	public Integer getWarningCount() {
		return warningCount;
	}

	public void setWarningCount(Integer warningCount) {
		this.warningCount = warningCount;
	}

	public Integer getStateCode() {
		return stateCode;
	}

	public void setStateCode(Integer stateCode) {
		this.stateCode = stateCode;
	}
	
	
	
	

}
