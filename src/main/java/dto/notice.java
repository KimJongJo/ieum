package dto;

import java.sql.Date;

public class notice {
	Integer nNo;
	Date nCreated;
	Date nUpdated;
	Integer uNo;
	String title;
	String content;
	Boolean isPinned;
	Integer fileId;
	
	
	public notice() {}
	
	
	public notice(Integer nNo, Date nCreated, Date nUpdated, Integer uNo, String title, String content,
			Boolean isPinned, Integer fileId) {
		super();
		this.nNo = nNo;
		this.nCreated = nCreated;
		this.nUpdated = nUpdated;
		this.uNo = uNo;
		this.title = title;
		this.content = content;
		this.isPinned = isPinned;
		this.fileId = fileId;
	}
	
	@Override
	public String toString() {
		return "notice [nNo=" + nNo + ", nCreated=" + nCreated + ", nUpdated=" + nUpdated + ", uNo=" + uNo + ", title="
				+ title + ", content=" + content + ", isPinned=" + isPinned + ", fileId=" + fileId + "]";
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


	public Integer getFileId() {
		return fileId;
	}


	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	
}
