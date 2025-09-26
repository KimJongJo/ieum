package dto;

public class CommuCategoryDto {
	Integer categoryNo;
	String categoryName;
	
	
	
	public CommuCategoryDto() {
		super();
	}



	public CommuCategoryDto(Integer categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}



	public Integer getCategoryNo() {
		return categoryNo;
	}



	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	
	
}
