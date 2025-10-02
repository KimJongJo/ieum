package dto;

import java.sql.Date;

public class NoticeDto {
	Integer nNo; // 공지사항 번호
	Date nCreated; // 작성일
	Date nUpdated; // 수정일
	Integer uNo; // 작성자 번호
	String title; // 제목
	String content; // 내용
	Boolean isPinned; // 상단고정여부
	Integer fileNo; // 파일 번호

	public NoticeDto() {
	}

	public NoticeDto(Integer uNo, String title, String content, Boolean isPinned) {
		super();
		this.uNo = uNo;
		this.title = title;
		this.content = content;
		this.isPinned = isPinned;
	}
	

	public NoticeDto(Integer uNo, String title, String content, Boolean isPinned, Integer fileNo) {
		super();
		this.uNo = uNo;
		this.title = title;
		this.content = content;
		this.isPinned = isPinned;
		this.fileNo = fileNo;
	}

	public NoticeDto(Date nUpdated, Integer uNo, String title, String content, Boolean isPinned, Integer fileNo) {
		super();
		this.nUpdated = nUpdated;
		this.uNo = uNo;
		this.title = title;
		this.content = content;
		this.isPinned = isPinned;
		this.fileNo = fileNo;
	}

	public NoticeDto(Integer nNo, Date nCreated, Date nUpdated, Integer uNo, String title, String content,
			Boolean isPinned, Integer fileNo) {
		super();
		this.nNo = nNo;
		this.nCreated = nCreated;
		this.nUpdated = nUpdated;
		this.uNo = uNo;
		this.title = title;
		this.content = content;
		this.isPinned = isPinned;
		this.fileNo = fileNo;
	}

	@Override
	public String toString() {
		return "notice [nNo=" + nNo + ", nCreated=" + nCreated + ", nUpdated=" + nUpdated + ", uNo=" + uNo + ", title="
				+ title + ", content=" + content + ", isPinned=" + isPinned + ", fileNo=" + fileNo + "]";
	}

	public Integer getnNo() {
		return nNo;
	}

	public void setnNo(Integer nNo) {
		this.nNo = nNo;
	}

	public Date getnCreated() {
		return nCreated;
	}

	public void setnCreated(Date nCreated) {
		this.nCreated = nCreated;
	}

	public Date getnUpdated() {
		return nUpdated;
	}

	public void setnUpdated(Date nUpdated) {
		this.nUpdated = nUpdated;
	}

	public Integer getuNo() {
		return uNo;
	}

	public void setuNo(Integer uNo) {
		this.uNo = uNo;
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

	public Boolean getIsPinned() {
		return isPinned;
	}

	public void setIsPinned(Boolean isPinned) {
		this.isPinned = isPinned;
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}


}
