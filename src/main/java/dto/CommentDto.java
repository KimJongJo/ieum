package dto;

import java.sql.Date;

public class CommentDto {
	Integer commeNo;
	Integer commuNo;
	Integer uNo;
	String comContent;
	Integer comEmpathy;
	Date comCreated;
	Integer comDeclaration; //신고수
	public CommentDto() {
		super();
	}
	public CommentDto(Integer commeNo, Integer commuNo, Integer uNo, String comContent, Integer comEmpathy,
			Date comCreated, Integer comDeclaration) {
		super();
		this.commeNo = commeNo;
		this.commuNo = commuNo;
		this.uNo = uNo;
		this.comContent = comContent;
		this.comEmpathy = comEmpathy;
		this.comCreated = comCreated;
		this.comDeclaration = comDeclaration;
	}
	@Override
	public String toString() {
		return "comment [commentNo=" + commeNo + ", commuNo=" + commuNo + ", uNo=" + uNo + ", comComtent="
				+ comContent + ", comEmpathy=" + comEmpathy + ", comCreated=" + comCreated + ", comDeclaration="
				+ comDeclaration + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public Integer getCommentNo() {
		return commeNo;
	}
	public void setCommentNo(Integer commentNo) {
		this.commeNo = commentNo;
	}
	public Integer getCommuNo() {
		return commuNo;
	}
	public void setCommuNo(Integer commuNo) {
		this.commuNo = commuNo;
	}
	public Integer getuNo() {
		return uNo;
	}
	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}
	public String getConComtent() {
		return comContent;
	}
	public void setConComtent(String comComtent) {
		this.comContent = comComtent;
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
	
	
}
