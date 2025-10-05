package dto.otherDto;

public class MainDiagnosisDto {
	Integer examNo;
	String examCate;
	Integer examImgNo;
	String examImgPath;
	public MainDiagnosisDto() {

	}
	public MainDiagnosisDto(Integer examNo, String examCate, Integer examImgNo, String examImgPath) {
		super();
		this.examNo = examNo;
		this.examCate = examCate;
		this.examImgNo = examImgNo;
		this.examImgPath = examImgPath;
	}
	public Integer getExamNo() {
		return examNo;
	}
	public void setExamNo(Integer examNo) {
		this.examNo = examNo;
	}
	public String getExamCate() {
		return examCate;
	}
	public void setExamCate(String examCate) {
		this.examCate = examCate;
	}
	public Integer getExamImgNo() {
		return examImgNo;
	}
	public void setExamImgNo(Integer examImgNo) {
		this.examImgNo = examImgNo;
	}
	public String getExamImgPath() {
		return examImgPath;
	}
	public void setExamImgPath(String examImgPath) {
		this.examImgPath = examImgPath;
	}
	@Override
	public String toString() {
		return "MainDiagnosisDto [examNo=" + examNo + ", examCate=" + examCate + ", examImgNo=" + examImgNo
				+ ", examImgPath=" + examImgPath + "]";
	}
	
	
	
	
	
	

}
