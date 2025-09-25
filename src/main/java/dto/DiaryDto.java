package dto;

import java.sql.Date;

public class DiaryDto {
	Integer diaryNo;
	Integer uNo;
	Date dCreated;
	Date dUpdated;
	String title;
	String content;
	Integer mood;
	
	
	public DiaryDto() {
		super();
	}
	
	
	public DiaryDto(Integer diaryNo, Integer uNo, Date dCreated, Date dUpdated, String title, String content,
			Integer mood) {
		super();
		this.diaryNo = diaryNo;
		this.uNo = uNo;
		this.dCreated = dCreated;
		this.dUpdated = dUpdated;
		this.title = title;
		this.content = content;
		this.mood = mood;
	}

	

	@Override
	public String toString() {
		return "diary [diaryNo=" + diaryNo + ", uNo=" + uNo + ", dCreated=" + dCreated + ", dUpdated=" + dUpdated
				+ ", title=" + title + ", content=" + content + ", mood=" + mood + "]";
	}


	public Integer getDiaryNo() {
		return diaryNo;
	}


	public void setDiaryNo(Integer diaryNo) {
		this.diaryNo = diaryNo;
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


	public Integer getMood() {
		return mood;
	}


	public void setMood(Integer mood) {
		this.mood = mood;
	}
	
	
	
}
