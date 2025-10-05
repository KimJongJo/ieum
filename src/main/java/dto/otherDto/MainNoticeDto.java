package dto.otherDto;

import java.sql.Date;

public class MainNoticeDto {
	Integer nNo;
	String title;
	Integer isPinned;
	Date nCreated;

	public MainNoticeDto() {

	}

	public MainNoticeDto(Integer nNo, String title, Integer isPinned, Date nCreated) {
		super();
		this.nNo = nNo;
		this.title = title;
		this.isPinned = isPinned;
		this.nCreated = nCreated;
	}

	public Integer getnNo() {
		return nNo;
	}

	public void setnNo(Integer nNo) {
		this.nNo = nNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getIsPinned() {
		return isPinned;
	}

	public void setIsPinned(Integer isPinned) {
		this.isPinned = isPinned;
	}

	public Date getnCreated() {
		return nCreated;
	}

	public void setnCreated(Date nCreated) {
		this.nCreated = nCreated;
	}

	@Override
	public String toString() {
		return "MainNoticeDto [nNo=" + nNo + ", title=" + title + ", isPinned=" + isPinned + ", nCreated=" + nCreated
				+ "]";
	}	

}
