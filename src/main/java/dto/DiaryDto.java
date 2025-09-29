package dto;

import java.util.Date;

public class DiaryDto {
	Integer dNo;
	Integer uNo;
	Date dCreated;
	Date dUpdated;
	String title;
	String content;
	String mood;
	
	
	public DiaryDto() {
		super();
	}
	
	
	public DiaryDto(Integer dNo, Integer uNo, Date dCreated, Date dUpdated, String title, String content,
			String mood) {
		super();
		this.dNo = dNo;
		this.uNo = uNo;
		this.dCreated = dCreated;
		this.dUpdated = dUpdated;
		this.title = title;
		this.content = content;
		this.mood = mood;
	}
	

	public DiaryDto(Integer uNo, String title, String content, String mood) {
		super();
		this.uNo = uNo;
		this.title = title;
		this.content = content;
		this.mood = mood;
	}


	public DiaryDto(Integer uNo, Date dCreated, String title, String content, String mood) {
		super();
		this.uNo = uNo;
		this.dCreated = dCreated;
		this.title = title;
		this.content = content;
		this.mood = mood;
	}


	@Override
	public String toString() {
		return "diary [diaryNo=" + dNo + ", uNo=" + uNo + ", dCreated=" + dCreated + ", dUpdated=" + dUpdated
				+ ", title=" + title + ", content=" + content + ", mood=" + mood + "]";
	}

	public Integer getdNo() {
		return dNo;
	}


	public void setdNo(Integer dNo) {
		this.dNo = dNo;
	}


	public Integer getuNo() {
		return uNo;
	}


	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}


	public Date getdCreated() {
		return dCreated;
	}


	public void setdCreated(Date dCreated) {
		this.dCreated = dCreated;
	}


	public Date getdUpdated() {
		return dUpdated;
	}


	public void setdUpdated(Date dUpdated) {
		this.dUpdated = dUpdated;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getMood() {
		return mood;
	}


	public void setMood(String mood) {
		this.mood = mood;
	}
	
	
	
}
