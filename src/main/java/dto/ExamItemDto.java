package dto;

public class ExamItemDto {
	
	Integer examNo; // 자가진단 번호
	String examQues; // 질문
	
	public ExamItemDto() {
		super();
	}

	public ExamItemDto(Integer examNo, String examQues) {
		super();
		this.examNo = examNo;
		this.examQues = examQues;
	}

	@Override
	public String toString() {
		return "examItem [examNo=" + examNo + ", examQues=" + examQues + "]";
	}

	public Integer getExamNo() {
		return examNo;
	}

	public void setExamNo(Integer examNo) {
		this.examNo = examNo;
	}

	public String getExamQues() {
		return examQues;
	}

	public void setExamQues(String examQues) {
		this.examQues = examQues;
	}
	
	
	

}
