package dto;

import java.sql.Date;

public class commentDto {
	Integer commentNo;
	Integer commuNo;
	Integer uNo;
	String comComtent;
	Integer comEmpathy;
	Date comCreated;
	Integer comDeclaration; //신고수
	public commentDto() {
		super();
	}
	public commentDto(Integer commentNo, Integer commuNo, Integer uNo, String comComtent, Integer comEmpathy,
			Date comCreated, Integer comDeclaration) {
		super();
		this.commentNo = commentNo;
		this.commuNo = commuNo;
		this.uNo = uNo;
		this.comComtent = comComtent;
		this.comEmpathy = comEmpathy;
		this.comCreated = comCreated;
		this.comDeclaration = comDeclaration;
	}
	@Override
	public String toString() {
		return "comment [commentNo=" + commentNo + ", commuNo=" + commuNo + ", uNo=" + uNo + ", comComtent="
				+ comComtent + ", comEmpathy=" + comEmpathy + ", comCreated=" + comCreated + ", comDeclaration="
				+ comDeclaration + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public Integer getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
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
	public String getComComtent() {
		return comComtent;
	}
	public void setComComtent(String comComtent) {
		this.comComtent = comComtent;
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
