package dto;

public class HospitalCategoryDto {
	Integer categoryNo;
	String categoryName;
	
	HospitalCategoryDto() {
		super();
	}

	public HospitalCategoryDto(Integer categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "HospitalCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
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
	};
	
	

}
