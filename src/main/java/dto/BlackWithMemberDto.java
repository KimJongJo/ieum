package dto;

import java.sql.Date;

public class BlackWithMemberDto {
	String username;
	String email;
	Date blackCreated;
	
	
	
	public BlackWithMemberDto() {
		super();
	}
	public BlackWithMemberDto(String username, String email, Date blackCreated) {
		super();
		this.username = username;
		this.email = email;
		this.blackCreated = blackCreated;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
		return "BlackWithMemberDto [username=" + username + ", email=" + email + ", blackCreated=" + blackCreated + "]";
	}
	
}
