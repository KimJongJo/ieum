package dto.otherDto;

import java.sql.Date;

public class OtherNoticeDto {
	Integer nNo; // 공지사항 번호
	String title; // 제목

	public OtherNoticeDto() {
	}

	public OtherNoticeDto(Integer nNo, String title) {
		super();
		this.nNo = nNo;
		this.title = title;
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

	@Override
	public String toString() {
		return "OtherNoticeDto [nNo=" + nNo + ", title=" + title + "]";
	}

	
	


}
