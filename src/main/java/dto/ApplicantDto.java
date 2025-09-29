package dto;

import java.sql.Date;

// 병원 등록 신청자
public class ApplicantDto {
	
	Integer applicantNo; // 신청자 번호 
	Integer hNo; // 병원 번호
	String applicantName; // 신청자 이름
	String applicantEmail; // 신청자 이메일
	String applicantTel; // 신청자 전화번호
	Date createdAt; // 신청 일자
	
	public ApplicantDto() {}

	public ApplicantDto(Integer applicantNo, Integer hNo, String applicantName, String applicantEmail, String applicantTel,
			Date createdAt) {
		super();
		this.applicantNo = applicantNo;
		this.hNo = hNo;
		this.applicantName = applicantName;
		this.applicantEmail = applicantEmail;
		this.applicantTel = applicantTel;
		this.createdAt = createdAt;
	}
	
	

	public ApplicantDto(String applicantName, String applicantEmail, String applicantTel) {
		super();
		this.applicantName = applicantName;
		this.applicantEmail = applicantEmail;
		this.applicantTel = applicantTel;
	}

	@Override
	public String toString() {
		return "Applicant [applicantNo=" + applicantNo + ", hNo=" + hNo + ", applicantName=" + applicantName
				+ ", applicantEmail=" + applicantEmail + ", applicantTel=" + applicantTel + ", createdAt=" + createdAt
				+ "]";
	}

	public Integer getApplicantNo() {
		return applicantNo;
	}

	public void setApplicantNo(Integer applicantNo) {
		this.applicantNo = applicantNo;
	}

	public Integer gethNo() {
		return hNo;
	}

	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}

	public String getApplicantName() {
		return applicantName;
	}

	public void setApplicantName(String applicantName) {
		this.applicantName = applicantName;
	}

	public String getApplicantEmail() {
		return applicantEmail;
	}

	public void setApplicantEmail(String applicantEmail) {
		this.applicantEmail = applicantEmail;
	}

	public String getApplicantTel() {
		return applicantTel;
	}

	public void setApplicantTel(String applicantTel) {
		this.applicantTel = applicantTel;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
	

}
