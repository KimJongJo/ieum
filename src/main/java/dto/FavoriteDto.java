package dto;

public class FavoriteDto {
	
	Integer hFavNo; // 즐겨찾기 번호
	Integer hosNo;	// 병원 번호
	Integer userNo;	// 유저 번호
	String hNm; // 병원 이름
	Integer categoryName; // 카테고리
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


	@Override
	public String toString() {
		return "favoriteDto [hFavNo=" + hFavNo + ", hosNo=" + hosNo + ", userNo=" + userNo + "]";
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
	
	

}
