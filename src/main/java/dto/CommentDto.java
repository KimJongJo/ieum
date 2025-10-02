package dto;

import java.sql.Date;

public class CommentDto {
	Integer commeNo;
	Integer commuNo;
	String nickName;
	Integer uNo;
	String comContent;
	Integer comEmpathy;
	Date comCreated;
	Integer comDeclaration; //신고수
	
	boolean likedByUser;
	
	public boolean isLikedByUser() { // boolean 타입은 isXxx()
        return likedByUser;
    }

    public void setLikedByUser(boolean likedByUser) {
        this.likedByUser = likedByUser;
    }
	
	
	boolean blocked = false;
	
	
	
	public CommentDto() {
		super();
	}
	
	
	
	
	public CommentDto(Integer uNo, Integer commuNo,  String comContent) {
		super();
	    this.uNo = uNo;
	    this.commuNo = commuNo;
	    this.comContent = comContent;
	}




	public CommentDto(Integer commeNo, Integer commuNo, String nickName, Integer uNo, String comContent,
			Integer comEmpathy, Date comCreated, Integer comDeclaration) {
		super();
		this.commeNo = commeNo;
		this.commuNo = commuNo;
		this.nickName = nickName;
		this.uNo = uNo;
		this.comContent = comContent;
		this.comEmpathy = comEmpathy;
		this.comCreated = comCreated;
		this.comDeclaration = comDeclaration;
	}
	public Integer getCommeNo() {
		return commeNo;
	}
	public void setCommeNo(Integer commeNo) {
		this.commeNo = commeNo;
	}
	public Integer getCommuNo() {
		return commuNo;
	}
	public void setCommuNo(Integer commuNo) {
		this.commuNo = commuNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Integer getuNo() {
		return uNo;
	}
	public void setuNo(Integer uNo) {
		this.uNo = uNo;
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
	public Integer getComDeclaration() {
		return comDeclaration;
	}
	public void setComDeclaration(Integer comDeclaration) {
		this.comDeclaration = comDeclaration;
	}
	@Override
	public String toString() {
		return "CommentDto [commeNo=" + commeNo + ", commuNo=" + commuNo + ", nickName=" + nickName + ", uNo=" + uNo
				+ ", comContent=" + comContent + ", comEmpathy=" + comEmpathy + ", comCreated=" + comCreated
				+ ", comDeclaration=" + comDeclaration + "]";
	}
	
	
	 public boolean isBlocked() { return blocked; }
	    public void setBlocked(boolean blocked) { this.blocked = blocked; }
}
