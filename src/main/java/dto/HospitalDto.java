package dto;

import java.sql.Date;

public class HospitalDto {
	
	Integer hNo;	// 병원 번호
	String hNm;	// 병원 이름
	String category;	// 카테고리
	String info1;	// 기타병원정보1
	String info2;	// 기타병원정보2
	String hAddress;	// 병원 주소
	String hLocationY;	// 병원 위치 위도
	String hLocationX;	// 병원 위치 경도
	String transferInfo;	// 근거리 교통 정보
	String holidayInfo;	// 휴무 정보
	String hTel;	// 전화번호
	String link;	// 홈페이지 링크
	String introcudeNote;	// 소개글
	Integer fileNo;	// 병원 썸네일 파일
	Date hCreated;	// 등록일
	Date hUpdated;	// 수정일
	String status;	// 활동 상태
	
	
	public HospitalDto() {
		super();
	}


	public HospitalDto(Integer hNo, String hNm, String category, String info1, String info2, String hAddress,
			String hLocationY, String hLocationX, String transferInfo, String holidayInfo, String hTel, String link,
			String introcudeNote, Integer fileNo, Date hCreated, Date hUpdated, String status) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.category = category;
		this.info1 = info1;
		this.info2 = info2;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
		this.hTel = hTel;
		this.link = link;
		this.introcudeNote = introcudeNote;
		this.fileNo = fileNo;
		this.hCreated = hCreated;
		this.hUpdated = hUpdated;
		this.status = status;
	}


	@Override
	public String toString() {
		return "hospitalDto [hNo=" + hNo + ", hNm=" + hNm + ", category=" + category + ", info1=" + info1 + ", info2="
				+ info2 + ", hAddress=" + hAddress + ", hLocationY=" + hLocationY + ", hLocationX=" + hLocationX
				+ ", transferInfo=" + transferInfo + ", holidayInfo=" + holidayInfo + ", hTel=" + hTel + ", link="
				+ link + ", introcudeNote=" + introcudeNote + ", fileNo=" + fileNo + ", hCreated=" + hCreated
				+ ", hUpdated=" + hUpdated + ", status=" + status + "]";
	}


	public Integer gethNo() {
		return hNo;
	}


	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}


	public String gethNm() {
		return hNm;
	}


	public void sethNm(String hNm) {
		this.hNm = hNm;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getInfo1() {
		return info1;
	}


	public void setInfo1(String info1) {
		this.info1 = info1;
	}


	public String getInfo2() {
		return info2;
	}


	public void setInfo2(String info2) {
		this.info2 = info2;
	}


	public String gethAddress() {
		return hAddress;
	}


	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}


	public String gethLocationY() {
		return hLocationY;
	}


	public void sethLocationY(String hLocationY) {
		this.hLocationY = hLocationY;
	}


	public String gethLocationX() {
		return hLocationX;
	}


	public void sethLocationX(String hLocationX) {
		this.hLocationX = hLocationX;
	}


	public String getTransferInfo() {
		return transferInfo;
	}


	public void setTransferInfo(String transferInfo) {
		this.transferInfo = transferInfo;
	}


	public String getHolidayInfo() {
		return holidayInfo;
	}


	public void setHolidayInfo(String holidayInfo) {
		this.holidayInfo = holidayInfo;
	}


	public String gethTel() {
		return hTel;
	}


	public void sethTel(String hTel) {
		this.hTel = hTel;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	public String getIntrocudeNote() {
		return introcudeNote;
	}


	public void setIntrocudeNote(String introcudeNote) {
		this.introcudeNote = introcudeNote;
	}


	public Integer getFileNo() {
		return fileNo;
	}


	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}


	public Date gethCreated() {
		return hCreated;
	}


	public void sethCreated(Date hCreated) {
		this.hCreated = hCreated;
	}


	public Date gethUpdated() {
		return hUpdated;
	}


	public void sethUpdated(Date hUpdated) {
		this.hUpdated = hUpdated;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	
	

}
