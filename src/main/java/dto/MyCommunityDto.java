package dto;

import java.sql.Date;

public class MyCommunityDto {
	int commuNo;
    String commuTitle;
    String commuContent;
    Date commuCreated;
    int empathy;
    int commuComment;
    int commuViews;
    String categoryName;
    String nickName;
    
	public MyCommunityDto() {
		super();
	}

	public MyCommunityDto(int commuNo, String commuTitle, String commuContent, Date commuCreated, int empathy,
			int commuComment, int commuViews, String categoryName, String nickName) {
		super();
		this.commuNo = commuNo;
		this.commuTitle = commuTitle;
		this.commuContent = commuContent;
		this.commuCreated = commuCreated;
		this.empathy = empathy;
		this.commuComment = commuComment;
		this.commuViews = commuViews;
		this.categoryName = categoryName;
		this.nickName = nickName;
	}

	public int getCommuNo() {
		return commuNo;
	}

	public void setCommuNo(int commuNo) {
		this.commuNo = commuNo;
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

	public Date getCommuCreated() {
		return commuCreated;
	}

	public void setCommuCreated(Date commuCreated) {
		this.commuCreated = commuCreated;
	}

	public int getEmpathy() {
		return empathy;
	}

	public void setEmpathy(int empathy) {
		this.empathy = empathy;
	}

	public int getCommuComment() {
		return commuComment;
	}

	public void setCommuComment(int commuComment) {
		this.commuComment = commuComment;
	}

	public int getCommuViews() {
		return commuViews;
	}

	public void setCommuViews(int commuViews) {
		this.commuViews = commuViews;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
    
    
}
