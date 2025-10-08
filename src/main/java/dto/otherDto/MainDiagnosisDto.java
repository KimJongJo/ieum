package dto.otherDto;

public class MainDiagnosisDto {
	Integer examNo;
	String examCate;
	Integer examImgNo;
	String examImgPath;
	String examImgNm;
	public MainDiagnosisDto() {

	}
	public MainDiagnosisDto(Integer examNo, String examCate, Integer examImgNo, String examImgPath) {
		super();
		this.examNo = examNo;
		this.examCate = examCate;
		this.examImgNo = examImgNo;
		this.examImgPath = examImgPath;
	}
	public MainDiagnosisDto(Integer examNo, String examCate, Integer examImgNo, String examImgPath, String examImgNm) {
		super();
		this.examNo = examNo;
		this.examCate = examCate;
		this.examImgNo = examImgNo;
		this.examImgPath = examImgPath;
		this.examImgNm = examImgNm;
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
	public String getExamImgNm() {
		return examImgNm;
	}
	public void setExamImgNm(String examImgNm) {
		this.examImgNm = examImgNm;
	}
	@Override
	public String toString() {
		return "MainDiagnosisDto [examNo=" + examNo + ", examCate=" + examCate + ", examImgNo=" + examImgNo
				+ ", examImgPath=" + examImgPath + ", examImgNm=" + examImgNm + "]";
	}
	
	
	
	
	
	
	

}
