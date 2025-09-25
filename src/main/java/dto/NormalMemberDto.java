package dto;

public class NormalMemberDto {
	
	Integer uNo;	// 회원번호
	String nickname;	// 닉네임
	String uAddress;	// 주소
	boolean diaryPrivate;	// 다이어리 공개여부
	Integer watingCount;	// 경고
	Integer socialNo;	// 소셜 로그인 유형
	
	public NormalMemberDto() {}
	
	public NormalMemberDto(Integer uNo, String nickname, String uAddress, boolean diaryPrivate, Integer watingCount,
			Integer socialNo) {
		super();
		this.uNo = uNo;
		this.nickname = nickname;
		this.uAddress = uAddress;
		this.diaryPrivate = diaryPrivate;
		this.watingCount = watingCount;
		this.socialNo = socialNo;
	}
	
	
	@Override
	public String toString() {
		return "normalMemberDto [uNo=" + uNo + ", nickname=" + nickname + ", uAddress=" + uAddress + ", diaryPrivate="
				+ diaryPrivate + ", watingCount=" + watingCount + ", socialNo=" + socialNo + "]";
	}


	public Integer getuNo() {
		return uNo;
	}
	public void setuNo(Integer uNo) {
		this.uNo = uNo;
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
	public boolean isDiaryPrivate() {
		return diaryPrivate;
	}
	public void setDiaryPrivate(boolean diaryPrivate) {
		this.diaryPrivate = diaryPrivate;
	}
	public Integer getWatingCount() {
		return watingCount;
	}
	public void setWatingCount(Integer watingCount) {
		this.watingCount = watingCount;
	}
	public Integer getSocialNo() {
		return socialNo;
	}
	public void setSocialNo(Integer socialNo) {
		this.socialNo = socialNo;
	}
	
	

}
