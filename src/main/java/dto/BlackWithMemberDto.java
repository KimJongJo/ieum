package dto;

import java.sql.Date;

public class BlackWithMemberDto {
	String nickname;
	String email;
	Date blackCreated;
	Integer uNo;
	Integer blockedNo;	// 블랙리스트 번호
	
	
	
	public BlackWithMemberDto() {
		super();
	}

	public BlackWithMemberDto(String nickname, String email, Date blackCreated, Integer uNo, Integer blockedNo) {
		super();
		this.nickname = nickname;
		this.email = email;
		this.blackCreated = blackCreated;
		this.blockedNo = blockedNo;
		this.uNo = uNo;
	}
	
	public Integer getBlockedNo() {
		return blockedNo;
	}
	public void setBlockNo(Integer blockedNo) {
		this.blockedNo = blockedNo;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBlackCreated() {
		return blackCreated;
	}
	public void setBlackCreated(Date blackCreated) {
		this.blackCreated = blackCreated;
	}
	@Override
	public String toString() {
		return "BlackWithMemberDto [username=" + nickname + ", email=" + email + ", blackCreated=" + blackCreated + "]";
	}
	
}
