package dto;

public class FavoriteDto {
	
	Integer hFavNo; // 즐겨찾기 번호
	Integer hosNo;	// 병원 번호
	Integer userNo;	// 유저 번호
	String hNm; // 병원 이름
	String categoryName; // 카테고리
	String hAddress; // 병원 주소
	Integer hosImgFileNo; // 병원 썸네일 파일
	String hosImgFilePath;
	String hosImgFileName;
	
	
	public FavoriteDto() {
		super();
	}


	public FavoriteDto(Integer hFavNo, Integer hosNo, Integer userNo) {
		super();
		this.hFavNo = hFavNo;
		this.hosNo = hosNo;
		this.userNo = userNo;
	}


	public FavoriteDto(Integer hFavNo, Integer hosNo, Integer userNo, String hNm, String categoryName, String hAddress,
			Integer hosImgFileNo, String hosImgFilePath, String hosImgFileName) {
		super();
		this.hFavNo = hFavNo;
		this.hosNo = hosNo;
		this.userNo = userNo;
		this.hNm = hNm;
		this.categoryName = categoryName;
		this.hAddress = hAddress;
		this.hosImgFileNo = hosImgFileNo;
		this.hosImgFilePath = hosImgFilePath;
		this.hosImgFileName = hosImgFileName;
	}


	public Integer gethFavNo() {
		return hFavNo;
	}


	public void sethFavNo(Integer hFavNo) {
		this.hFavNo = hFavNo;
	}


	public Integer getHosNo() {
		return hosNo;
	}


	public void setHosNo(Integer hosNo) {
		this.hosNo = hosNo;
	}


	public Integer getUserNo() {
		return userNo;
	}


	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}


	public String gethNm() {
		return hNm;
	}


	public void sethNm(String hNm) {
		this.hNm = hNm;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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


	public String getHosImgFilePath() {
		return hosImgFilePath;
	}


	public void setHosImgFilePath(String hosImgFilePath) {
		this.hosImgFilePath = hosImgFilePath;
	}


	public String getHosImgFileName() {
		return hosImgFileName;
	}


	public void setHosImgFileName(String hosImgFileName) {
		this.hosImgFileName = hosImgFileName;
	}


	@Override
	public String toString() {
		return "FavoriteDto [hFavNo=" + hFavNo + ", hosNo=" + hosNo + ", userNo=" + userNo + ", hNm=" + hNm
				+ ", categoryName=" + categoryName + ", hAddress=" + hAddress + ", hosImgFileNo=" + hosImgFileNo
				+ ", hosImgFilePath=" + hosImgFilePath + ", hosImgFileName=" + hosImgFileName + "]";
	}

	
	

}
