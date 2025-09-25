package dto;

public class ExamResultDto {
	
	Integer examNo;
	String maxScore;
	String minScore;
	String status;	// 활동 상태 
	
	public ExamResultDto() {
		super();
	}

	public ExamResultDto(Integer examNo, String maxScore, String minScore, String status) {
		super();
		this.examNo = examNo;
		this.maxScore = maxScore;
		this.minScore = minScore;
		this.status = status;
	}

	@Override
	public String toString() {
		return "ExamResultDto [examNo=" + examNo + ", maxScore=" + maxScore + ", minScore=" + minScore + ", status="
				+ status + "]";
	}

	public Integer getExamNo() {
		return examNo;
	}

	public void setExamNo(Integer examNo) {
		this.examNo = examNo;
	}

	public String getMaxScore() {
		return maxScore;
	}

	public void setMaxScore(String maxScore) {
		this.maxScore = maxScore;
	}

	public String getMinScore() {
		return minScore;
	}

	public void setMinScore(String minScore) {
		this.minScore = minScore;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
}
