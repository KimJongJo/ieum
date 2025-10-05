package dto.otherDto;

import java.sql.Date;

public class MainHosDto {
	Integer hNo; // 병원 번호
	String hNm; // 병원 이름
	String hAddress; // 병원 주소
	Integer hosImgFileNo; // 병원 썸네일 파일 번호
	String hosImgPath; // 병원 썸네일 파일 경로

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

	public String gethAddress() {
		return hAddress;
	}

	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
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

	@Override
	public String toString() {
		return "MainHosDto [hNo=" + hNo + ", hNm=" + hNm + ", hAdress=" + hAddress + ", hosImgFileNo=" + hosImgFileNo
				+ ", hosImgPath=" + hosImgPath + "]";
	}

}
