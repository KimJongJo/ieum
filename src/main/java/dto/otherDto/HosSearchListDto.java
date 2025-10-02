package dto.otherDto;

public class HosSearchListDto {
	
	String hNm;	// 병원 이름
	String transferInfo;	// 근거리 교통 정보
	Integer fileNo;	// 병원 썸네일 파일
	String categoryName;
	Integer hNo; //병원 번호
	
	public HosSearchListDto(String hNm, String transferInfo, Integer fileNo, String categoryName, Integer hNo) {
		super();
		this.hNm = hNm;
		this.transferInfo = transferInfo;
		this.fileNo = fileNo;
		this.categoryName = categoryName;
		this.hNo = hNo;
	}

	HosSearchListDto() {
		super();
	}

	public HosSearchListDto(String hNm, String transferInfo, Integer fileNo, String categoryName) {
		super();
		this.hNm = hNm;
		this.transferInfo = transferInfo;
		this.fileNo = fileNo;
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "HosSearchListDto [hNm=" + hNm + ", transferInfo=" + transferInfo + ", fileNo=" + fileNo
				+ ", categoryName=" + categoryName + "]";
	}

	public String gethNm() {
		return hNm;
	}

	public void sethNm(String hNm) {
		this.hNm = hNm;
	}

	public String getTransferInfo() {
		return transferInfo;
	}

	public void setTransferInfo(String transferInfo) {
		this.transferInfo = transferInfo;
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer gethNo() {
		return hNo;
	}

	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}
	
	
	
}
