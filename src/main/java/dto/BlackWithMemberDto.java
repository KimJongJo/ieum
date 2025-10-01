package dto;

import java.sql.Date;

public class BlackWithMemberDto {
	String nickname;
	String email;
	Date blackCreated;
	
	
	
	public BlackWithMemberDto() {
		super();
	}
	public BlackWithMemberDto(String nickname, String email, Date blackCreated) {
		super();
		this.nickname = nickname;
		this.email = email;
		this.blackCreated = blackCreated;
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
