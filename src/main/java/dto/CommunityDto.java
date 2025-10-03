package dto;

import java.sql.Date;

public class CommunityDto {
	Integer commuNo;
	Integer uNo;
	String commuTitle;
	String commuContent;
	Integer commuViews;
	Integer empathy;
	Date commuCreated;
	Integer commuDeclaration;
	Integer categoryNo;
	Integer commuComment;

	boolean likedByUser;
	

	public boolean isLikedByUser() { // boolean 타입은 isXxx()
        return likedByUser;
    }

    public void setLikedByUser(boolean likedByUser) {
        this.likedByUser = likedByUser;
    }

	public CommunityDto() {
		super();
	}
	
	public CommunityDto(Integer uNo, String commuTitle, String commuContent, Integer categoryNo) {
		super();
		this.uNo = uNo;
		this.commuTitle = commuTitle;
		this.commuContent = commuContent;
		this.categoryNo = categoryNo;
	}


	public CommunityDto(Integer commuNo, Integer uNo, String commuTitle, String commuContent, Integer commuViews,
			Integer empathy, Date commuCreated, Integer commuDeclaration, Integer categoryNo, Integer commuComment) {
		super();
		this.commuNo = commuNo;
		this.uNo = uNo;
		this.commuTitle = commuTitle;
		this.commuContent = commuContent;
		this.commuViews = commuViews;
		this.empathy = empathy;
		this.commuCreated = commuCreated;
		this.commuDeclaration = commuDeclaration;
		this.categoryNo = categoryNo;
		this.commuComment = commuComment;
	}
	

	public Integer getCommuNo() { 
		return commuNo; 
	}

	public void setCommuNo(Integer commuNO) { this.commuNo = commuNO; }

	public Integer getuNo() {
		return uNo;
	}

	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}

	public String getCommuTitle() {
		return commuTitle;
	}

	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}

	public String getCommuContent() {
		return commuContent;
	}

	public void setCommuContent(String commuContent) {
		this.commuContent = commuContent;
	}

	public Integer getCommuViews() {
		return commuViews;
	}

	public void setCommuViews(Integer commuViews) {
		this.commuViews = commuViews;
	}

	public Integer getEmpathy() {
		return empathy;
	}

	public void setEmpathy(Integer empathy) {
		this.empathy = empathy;
	}

	public Date getCommuCreated() {
		return commuCreated;
	}

	public void setCommuCreated(Date commuCreated) {
		this.commuCreated = commuCreated;
	}

	public Integer getCommuDeclaration() {
		return commuDeclaration;
	}

	public void setCommuDeclaration(Integer commuDeclaration) {
		this.commuDeclaration = commuDeclaration;
	}

	public Integer getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Integer getCommuComment() {
		return commuComment;
	}

	public void setCommuComment(Integer commuComment) {
		this.commuComment = commuComment;
	}
}
