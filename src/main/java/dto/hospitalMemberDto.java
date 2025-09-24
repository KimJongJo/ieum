package dto;

public class hospitalMemberDto {
	
	Integer mNo;	// 병원 회원 번호
	Integer hNo;	// 병원 번호
	Integer roleId;	// 역할 번호
	String major;	// 전공
	String introduction;	// 자기소개
	
	public hospitalMemberDto() {}
	
	public hospitalMemberDto(Integer mNo, Integer hNo, Integer roleId, String major, String introduction) {
		super();
		this.mNo = mNo;
		this.hNo = hNo;
		this.roleId = roleId;
		this.major = major;
		this.introduction = introduction;
	}
	
	@Override
	public String toString() {
		return "hospitalMemberDto [mNo=" + mNo + ", hNo=" + hNo + ", roleId=" + roleId + ", major=" + major
				+ ", introduction=" + introduction + "]";
	}

	public Integer getmNo() {
		return mNo;
	}
	public void setmNo(Integer mNo) {
		this.mNo = mNo;
	}
	public Integer gethNo() {
		return hNo;
	}
	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
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
	
	

}
