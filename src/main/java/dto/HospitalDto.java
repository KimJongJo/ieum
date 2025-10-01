package dto;

import java.sql.Date;

public class HospitalDto {
	Integer hNo; // 병원 번호
	String hNm; // 병원 이름
	Integer categoryNo; // 카테고리
	String hAddress; // 병원 주소
	String hLocationY; // 병원 위치 위도
	String hLocationX; // 병원 위치 경도
	String transferInfo; // 근거리 교통 정보
	String holidayInfo; // 휴무 정보
	String hTel; // 전화번호
	String hLink; // 홈페이지 링크
	String introduceNote; // 소개글
	Integer hosImgFileNo; // 병원 썸네일 파일
	Integer hosReFileNo; // 사업자등록증 파일 번호
	String hosReNo; // 사업자등록증 파일 번호
	Date hCreated; // 등록일
	Date hUpdated; // 수정일
	String status; // 활동 상태
	String hCode; // 병원코드
	String city; // 시도
	String gungu; // 시군구
	String services; // 제공하는 편의 시설
	boolean silson; // 실손 24 서비스 제공 여부

	public HospitalDto() {
		super();
	}
	public HospitalDto(Integer hNo, String hNm, Integer categoryNo, String hAddress, String hLocationY,
			String hLocationX, String transferInfo, String holidayInfo, String hTel, String hLink, String introduceNote,
			Integer hosImgFileNo, Integer hosReFileNo, String hosReNo, Date hCreated, Date hUpdated, String status,
			String hCode, String city, String gungu, String services, boolean silson) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.categoryNo = categoryNo;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
		this.hTel = hTel;
		this.hLink = hLink;
		this.introduceNote = introduceNote;
		this.hosImgFileNo = hosImgFileNo;
		this.hosReFileNo = hosReFileNo;
		this.hosReNo = hosReNo;
		this.hCreated = hCreated;
		this.hUpdated = hUpdated;
		this.status = status;
		this.hCode = hCode;
		this.city = city;
		this.gungu = gungu;
		this.services = services;
		this.silson = silson;
	}
	@Override
	public String toString() {
		return "HospitalDto [hNo=" + hNo + ", hNm=" + hNm + ", categoryNo=" + categoryNo + ", hAddress=" + hAddress
				+ ", hLocationY=" + hLocationY + ", hLocationX=" + hLocationX + ", transferInfo=" + transferInfo
				+ ", holidayInfo=" + holidayInfo + ", hTel=" + hTel + ", hLink=" + hLink + ", introduceNote="
				+ introduceNote + ", hosImgFileNo=" + hosImgFileNo + ", hosReFileNo=" + hosReFileNo + ", hosReNo="
				+ hosReNo + ", hCreated=" + hCreated + ", hUpdated=" + hUpdated + ", status=" + status + ", hCode="
				+ hCode + ", city=" + city + ", gungu=" + gungu + ", services=" + services + ", silson=" + silson + "]";
	}



	public String getIntroduceNote() {
		return introduceNote;
	}

	public void setIntroduceNote(String introduceNote) {
		this.introduceNote = introduceNote;
	}


	public String getServices() {
		return services;
	}


	public void setServices(String services) {
		this.services = services;
	}



	public Integer getHosImgFileNo() {
		return hosImgFileNo;
	}


	public void setHosImgFileNo(Integer hosImgFileNo) {
		this.hosImgFileNo = hosImgFileNo;
	}


	public Integer getHosReFileNo() {
		return hosReFileNo;
	}



	public void setHosReFileNo(Integer hosReFileNo) {
		this.hosReFileNo = hosReFileNo;
	}

	public String getHosReNo() {
		return hosReNo;
	}

	public void setHosReNo(String hosReNo) {
		this.hosReNo = hosReNo;
	}

	public boolean isSilson() {
		return silson;
	}


	public void setSilson(boolean silson) {
		this.silson = silson;
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

	public Integer getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
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

	public String gethLink() {
		return hLink;
	}

	public void sethLink(String hLink) {
		this.hLink = hLink;
	}

	public String getIntroduceNote() {
		return introduceNote;
	}

	public void setIntroduceNote(String introduceNote) {
		this.introduceNote = introduceNote;
	}

	public Integer getHosImgFileNo() {
		return hosImgFileNo;
	}


	public void setHosImgFileNo(Integer hosImgFileNo) {
		this.hosImgFileNo = hosImgFileNo;
	}

	public Integer getHosReFileNo() {
		return hosReFileNo;
	}

	public void setHosReFileNo(Integer hosReFileNo) {
		this.hosReFileNo = hosReFileNo;
	}

	public String getHosReNo() {
		return hosReNo;
	}

	public void setHosReNo(String hosReNo) {
		this.hosReNo = hosReNo;
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

	public String gethCode() {
		return hCode;
	}

	public void sethCode(String hCode) {
		this.hCode = hCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGungu() {
		return gungu;
	}

	public void setGungu(String gungu) {
		this.gungu = gungu;
	}

	public String getServices() {
		return services;
	}

	public void setServices(String services) {
		this.services = services;
	}

	public boolean isSilson() {
		return silson;
	}

	public void setSilson(boolean silson) {
		this.silson = silson;
	}

}
