package dto.otherDto;


public class MainCommuDto {
	Integer commuNo;
	String commuTitle;
	String commuContent;
	Integer categoryNo;
	String categoryName;

	public MainCommuDto() {

	}

	public MainCommuDto(Integer commuNo, String commuTitle, String commuContent, Integer categoryNo,
			String categoryName) {
		super();
		this.commuNo = commuNo;
		this.commuTitle = commuTitle;
		this.commuContent = commuContent;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	public Integer getCommuNo() {
		return commuNo;
	}

	public void setCommuNo(Integer commuNo) {
		this.commuNo = commuNo;
	}

	public String getCommuTitle() {
		return commuTitle;
	}

	public void setCommuTitle(String commuTitle) {
		this.commuTitle = commuTitle;
	}

	public String getCommuContent() {
		return commuContent;
	}

	public void setCommuContent(String commuContent) {
		this.commuContent = commuContent;
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

	@Override
	public String toString() {
		return "MainCommuDto [commuNo=" + commuNo + ", commuTitle=" + commuTitle + ", commuContent=" + commuContent
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
}
