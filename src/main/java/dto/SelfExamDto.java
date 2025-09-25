package dto;

public class SelfExamDto {
	
	Integer examNo;	// 자가진단 번호
	String examCategory;	// 자가진단명
	Integer fileNo;	// 파일 번호(썸네일)
	String examInfo;	// 자가검진 설명
	public SelfExamDto() {
		super();
	}
	public SelfExamDto(Integer examNo, String examCategory, Integer fileNo, String examInfo) {
		super();
		this.examNo = examNo;
		this.examCategory = examCategory;
		this.fileNo = fileNo;
		this.examInfo = examInfo;
	}
	@Override
	public String toString() {
		return "SelfExamDto [examNo=" + examNo + ", examCategory=" + examCategory + ", fileNo=" + fileNo + ", examInfo="
				+ examInfo + "]";
	}
	public Integer getExamNo() {
		return examNo;
	}
	public void setExamNo(Integer examNo) {
		this.examNo = examNo;
	}
	public String getExamCategory() {
		return examCategory;
	}
	public void setExamCategory(String examCategory) {
		this.examCategory = examCategory;
	}
	public Integer getFileNo() {
		return fileNo;
	}
	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}
	public String getExamInfo() {
		return examInfo;
	}
	public void setExamInfo(String examInfo) {
		this.examInfo = examInfo;
	}
	
	

}
