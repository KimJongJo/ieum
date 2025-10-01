package dto.otherDto;

import java.sql.Date;

public class HosDetailDto {
	
	Integer hNo; // 병원 번호
	String hNm; // 병원 이름
	Integer categoryNo; // 카테고리
	String hAddress; // 병원 주소
	String transferInfo; // 근거리 교통 정보
	String holidayInfo; // 휴무 정보
	String hTel; // 전화번호
	String hLink; // 홈페이지 링크
	String introduceNote; // 소개글
	Integer hosImgFileNo; // 병원 썸네일 파일
	String services; // 제공하는 편의 시설
	boolean silson; // 실손 24 서비스 제공 여부

	String username; // 이름
	String major; // 전공
	String introduction; // 자기소개
	Integer fileNo; // 프로필 사진
	
	HosDetailDto(){
		super();
	}

	public HosDetailDto(Integer hNo, String hNm, Integer categoryNo, String hAddress, String transferInfo,
			String holidayInfo, String hTel, String hLink, String introduceNote, Integer hosImgFileNo, String services,
			boolean silson, String username, String major, String introduction, Integer fileNo) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.categoryNo = categoryNo;
		this.hAddress = hAddress;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
		this.hTel = hTel;
		this.hLink = hLink;
		this.introduceNote = introduceNote;
		this.hosImgFileNo = hosImgFileNo;
		this.services = services;
		this.silson = silson;
		this.username = username;
		this.major = major;
		this.introduction = introduction;
		this.fileNo = fileNo;
	}
	

	@Override
	public String toString() {
		return "HosDetailDto [hNo=" + hNo + ", hNm=" + hNm + ", categoryNo=" + categoryNo + ", hAddress=" + hAddress
				+ ", transferInfo=" + transferInfo + ", holidayInfo=" + holidayInfo + ", hTel=" + hTel + ", hLink="
				+ hLink + ", introduceNote=" + introduceNote + ", hosImgFileNo=" + hosImgFileNo + ", services="
				+ services + ", silson=" + silson + ", username=" + username + ", major=" + major + ", introduction="
				+ introduction + ", fileNo=" + fileNo + "]";
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}

	

}
