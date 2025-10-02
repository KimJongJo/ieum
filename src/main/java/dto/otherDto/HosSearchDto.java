package dto.otherDto;

import java.util.List;

public class HosSearchDto {
	
	String keyword; //검색키워드
	List<String> categoryName; //카테고리 이름
	String city; //시도
	String gungu; //시군구
	int offset; //몇번째 row부터 가져올지
	int limit; //몇개 가져올지
	
	public HosSearchDto() {
		super();
	}

	public HosSearchDto(String keyword, List<String> categoryName, String city, String gungu, int offset, int limit) {
		super();
		this.keyword = keyword;
		this.categoryName = categoryName;
		this.city = city;
		this.gungu = gungu;
		this.offset = offset;
		this.limit = limit;
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

	
	
	

	
}
