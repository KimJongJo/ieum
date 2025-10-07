package dto.otherDto;

import java.sql.Date;
import java.sql.Timestamp;

public class HosInfoDto {
	
	// 일반 HospitalDto와 똑같은데 join해서 받아올 병원 유형이 추가됨
	private Integer hNo; // 병원 번호
	private String hNm; // 병원 이름
	private String category; // 병원 유형
	private String hAddress; // 병원 주소
	private String hLocationY; // 병원 위치 위도
	private String hLocationX; // 병원 위치 경도
	private String hTel; // 병원 전화번호
	private String hCreated; // 등록일
	private String hUpdated; // 수정일
	private String hosReNo; // 사업자등록번호
	
	public HosInfoDto(Integer hNo, String hNm, String category, String hAddress, String hLocationY, String hLocationX,
			String hTel, String hCreated, String hUpdated, String hosReNo) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.category = category;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.hTel = hTel;
		this.hCreated = hCreated;
		this.hUpdated = hUpdated;
		this.hosReNo = hosReNo;
	}
	

	public HosInfoDto(Integer hNo, String hNm, String category, String hAddress, String hLocationY, String hLocationX,
			String hTel, String hosReNo) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.category = category;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.hTel = hTel;
		this.hosReNo = hosReNo;
	}




	@Override
	public String toString() {
		return "HosInfoDto [hNo=" + hNo + ", hNm=" + hNm + ", category=" + category + ", hAddress=" + hAddress
				+ ", hLocationY=" + hLocationY + ", hLocationX=" + hLocationX + ", hTel=" + hTel + ", hCreated="
				+ hCreated + ", hUpdated=" + hUpdated + ", hosReNo=" + hosReNo + ", gethNo()=" + gethNo()
				+ ", gethNm()=" + gethNm() + ", getCategory()=" + getCategory() + ", gethAddress()=" + gethAddress()
				+ ", gethLocationY()=" + gethLocationY() + ", gethLocationX()=" + gethLocationX() + ", gethTel()="
				+ gethTel() + ", gethCreated()=" + gethCreated() + ", gethUpdated()=" + gethUpdated()
				+ ", getHosReNo()=" + getHosReNo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
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

	public String gethTel() {
		return hTel;
	}

	public void sethTel(String hTel) {
		this.hTel = hTel;
	}

	public String gethCreated() {
		return hCreated;
	}

	public void sethCreated(String hCreated) {
		this.hCreated = hCreated;
	}

	public String gethUpdated() {
		return hUpdated;
	}

	public void sethUpdated(String hUpdated) {
		this.hUpdated = hUpdated;
	}

	public String getHosReNo() {
		return hosReNo;
	}

	public void setHosReNo(String hosReNo) {
		this.hosReNo = hosReNo;
	}
	
	
	
	
	
	

}
