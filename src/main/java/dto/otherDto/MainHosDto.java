package dto.otherDto;

import java.sql.Date;

public class MainHosDto {
	Integer hNo; // 병원 번호
	String hNm; // 병원 이름
	String hTel; // 병원 번호
	String hAddress; // 병원 주소
	String hLocationY; // 병원 위치 위도
	String hLocationX; // 병원 위치 경도
	String transferInfo; // 근거리 교통 정보
	String holidayInfo; // 휴무 정보
	Integer hosImgFileNo; // 병원 썸네일 파일 번호
	String hosImgPath; // 병원 썸네일 파일 경로
	String hosImgNm;
	public MainHosDto() {

	}
	
	public MainHosDto(Integer hNo, String hNm, String hAddress, Integer hosImgFileNo, String hosImgPath) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.hAddress = hAddress;
		this.hosImgFileNo = hosImgFileNo;
		this.hosImgPath = hosImgPath;
	}

	public MainHosDto(Integer hNo, String hNm, String hTel, String hAddress, String hLocationY, String hLocationX,
			String transferInfo, String holidayInfo) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.hTel = hTel;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
	}

	public MainHosDto(Integer hNo, String hNm, String hTel, String hAddress, String hLocationY, String hLocationX,
			String transferInfo, String holidayInfo, Integer hosImgFileNo, String hosImgPath, String hosImgNm) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.hTel = hTel;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
		this.hosImgFileNo = hosImgFileNo;
		this.hosImgPath = hosImgPath;
		this.hosImgNm = hosImgNm;
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

	public String gethTel() {
		return hTel;
	}

	public void sethTel(String hTel) {
		this.hTel = hTel;
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

	public Integer getHosImgFileNo() {
		return hosImgFileNo;
	}

	public void setHosImgFileNo(Integer hosImgFileNo) {
		this.hosImgFileNo = hosImgFileNo;
	}

	public String getHosImgPath() {
		return hosImgPath;
	}

	public void setHosImgPath(String hosImgPath) {
		this.hosImgPath = hosImgPath;
	}

	public String getHosImgNm() {
		return hosImgNm;
	}

	public void setHosImgNm(String hosImgNm) {
		this.hosImgNm = hosImgNm;
	}

	@Override
	public String toString() {
		return "MainHosDto [hNo=" + hNo + ", hNm=" + hNm + ", hTel=" + hTel + ", hAddress=" + hAddress + ", hLocationY="
				+ hLocationY + ", hLocationX=" + hLocationX + ", transferInfo=" + transferInfo + ", holidayInfo="
				+ holidayInfo + ", hosImgFileNo=" + hosImgFileNo + ", hosImgPath=" + hosImgPath + ", hosImgNm="
				+ hosImgNm + "]";
	}

	

}
