package dto;

import java.sql.Date;

public class HospitalDto {
	
	Integer hNo;	// 병원 번호
	String hNm;	// 병원 이름
	String categoryNo;	// 카테고리
	String info1;	// 기타병원정보1
	String info2;	// 기타병원정보2
	String hAddress;	// 병원 주소
	String hLocationY;	// 병원 위치 위도
	String hLocationX;	// 병원 위치 경도
	String transferInfo;	// 근거리 교통 정보
	String holidayInfo;	// 휴무 정보
	String hTel;	// 전화번호
	String hLink;	// 홈페이지 링크
	String introcudeNote;	// 소개글
	Integer fileNo;	// 병원 썸네일 파일
	Integer reNoFileNo; // 사업자등록증 파일 번호
	String reNo; // 사업자등록증 파일 번호
	Date hCreated;	// 등록일
	Date hUpdated;	// 수정일
	String status;	// 활동 상태
	String hCode; //병원코드
	String city; //시도
	String gungu; //시군구
	String hosService; // 제공하는 편의 시설
	boolean silson; // 실손 24 서비스 제공 여부
	
	
	public HospitalDto() {
		super();
	}
	
	





	public HospitalDto(String hNm, String categoryNo, String hAddress, String hLocationY, String hLocationX,
			String holidayInfo, String hTel, Integer fileNo, Integer reNoFileNo, String reNo, String city, String gungu,
			String hosService, boolean silson) {
		super();
		this.hNm = hNm;
		this.categoryNo = categoryNo;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.holidayInfo = holidayInfo;
		this.hTel = hTel;
		this.fileNo = fileNo;
		this.reNoFileNo = reNoFileNo;
		this.reNo = reNo;
		this.city = city;
		this.gungu = gungu;
		this.hosService = hosService;
		this.silson = silson;
	}





	public HospitalDto(Integer hNo, String hNm, String categoryNo, String info1, String info2, String hAddress,
			String hLocationY, String hLocationX, String transferInfo, String holidayInfo, String hTel, String hLink,
			String introcudeNote, Integer fileNo, Integer reNoFileNo, String reNo, Date hCreated, Date hUpdated,
			String status, String hCode, String city, String gungu, String hosService, boolean silson) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.categoryNo = categoryNo;
		this.info1 = info1;
		this.info2 = info2;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
		this.hTel = hTel;
		this.hLink = hLink;
		this.introcudeNote = introcudeNote;
		this.fileNo = fileNo;
		this.reNoFileNo = reNoFileNo;
		this.reNo = reNo;
		this.hCreated = hCreated;
		this.hUpdated = hUpdated;
		this.status = status;
		this.hCode = hCode;
		this.city = city;
		this.gungu = gungu;
		this.hosService = hosService;
		this.silson = silson;
	}







	@Override
	public String toString() {
		return "HospitalDto [hNo=" + hNo + ", hNm=" + hNm + ", categoryNo=" + categoryNo + ", info1=" + info1
				+ ", info2=" + info2 + ", hAddress=" + hAddress + ", hLocationY=" + hLocationY + ", hLocationX="
				+ hLocationX + ", transferInfo=" + transferInfo + ", holidayInfo=" + holidayInfo + ", hTel=" + hTel
				+ ", hLink=" + hLink + ", introcudeNote=" + introcudeNote + ", fileNo=" + fileNo + ", reNoFileNo="
				+ reNoFileNo + ", reNo=" + reNo + ", hCreated=" + hCreated + ", hUpdated=" + hUpdated + ", status="
				+ status + ", hCode=" + hCode + ", city=" + city + ", gungu=" + gungu + ", hosService=" + hosService
				+ ", silson=" + silson + "]";
	}

	public Integer getReNoFileNo() {
		return reNoFileNo;
	}


	public void setReNoFileNo(Integer reNoFileNo) {
		this.reNoFileNo = reNoFileNo;
	}


	public String getHosService() {
		return hosService;
	}

	public void setHosService(String hosService) {
		this.hosService = hosService;
	}

	public boolean isSilson() {
		return silson;
	}


	public void setSilson(boolean silson) {
		this.silson = silson;
	}


	public String getReNo() {
		return reNo;
	}


	public void setReNo(String reNo) {
		this.reNo = reNo;
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


	public String getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
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


	public String gethLink() {
		return hLink;
	}


	public void sethLink(String hLink) {
		this.hLink = hLink;
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

	
	
	

}
