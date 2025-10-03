package dto;

import java.sql.Date;

public class CommentWithMemberDto {
	 String nickname;   
	 Integer commeNo;     
	 Integer uNo;        
	 Integer commuNo;    
	 String comContent;  
	 Integer comEmpathy;  
	 Date comCreated;
	 
	 
	 boolean likedByUserCom; // 댓글 하트 상태
	 
	public CommentWithMemberDto() {
		super();
	}




	public CommentWithMemberDto(String nickname, Integer commeNo, Integer uNo, Integer commuNo, String comContent,
			Integer comEmpathy, Date comCreated) {
		super();
		this.nickname = nickname;
		this.commeNo = commeNo;
		this.uNo = uNo;
		this.commuNo = commuNo;
		this.comContent = comContent;
		this.comEmpathy = comEmpathy;
		this.comCreated = comCreated;
	}

	public boolean isLikedByUserCom() {
		return likedByUserCom;
	}

	public void setLikedByUserCom(boolean likedByUserCom) {
		this.likedByUserCom = likedByUserCom;
	}


	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public Integer getCommeNo() {
		return commeNo;
	}




	public void setCommeNo(Integer commeNo) {
		this.commeNo = commeNo;
	}




	public Integer getuNo() {
		return uNo;
	}




	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}




	public Integer getCommuNo() {
		return commuNo;
	}




	public void setCommuNo(Integer commuNo) {
		this.commuNo = commuNo;
	}




	public String getComContent() {
		return comContent;
	}




	public void setComContent(String comContent) {
		this.comContent = comContent;
	}




	public Integer getComEmpathy() {
		return comEmpathy;
	}




	public void setComEmpathy(Integer comEmpathy) {
		this.comEmpathy = comEmpathy;
	}




	public Date getComCreated() {
		return comCreated;
	}




	public void setComCreated(Date comCreated) {
		this.comCreated = comCreated;
	}
	 
	 
}
