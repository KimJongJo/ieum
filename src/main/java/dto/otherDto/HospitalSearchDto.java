package dto.otherDto;

import java.util.List;

public class HospitalSearchDto {
	
	String keyword; //검색키워드
	List<String> categoryName; //카테고리 이름
	String city; //시도
	String gungu; //시군구
	int offset; //몇번째 row부터 가져올지
	int limit; //몇개 가져올지
	
	Integer uNo;
	boolean favorite;
	
	public HospitalSearchDto() {
		super();
	}

	

	public HospitalSearchDto(String keyword, List<String> categoryName, String city, String gungu, int offset,
			int limit, Integer uNo, boolean favorite) {
		super();
		this.keyword = keyword;
		this.categoryName = categoryName;
		this.city = city;
		this.gungu = gungu;
		this.offset = offset;
		this.limit = limit;
		this.uNo = uNo;
		this.favorite = favorite;
	}
	

	@Override
	public String toString() {
		return "HospitalSearchDto [keyword=" + keyword + ", categoryName=" + categoryName + ", city=" + city
				+ ", gungu=" + gungu + ", offset=" + offset + ", limit=" + limit + ", uNo=" + uNo + ", favorite="
				+ favorite + "]";
	}



	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<String> getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(List<String> categoryName) {
		this.categoryName = categoryName;
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

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}



	public Integer getuNo() {
		return uNo;
	}



	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}



	public boolean isFavorite() {
		return favorite;
	}



	public void setFavorite(boolean favorite) {
		this.favorite = favorite;
	}


	
}
