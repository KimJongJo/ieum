package dto;

import java.sql.Date;

public class DiagnosisHistoryDto {
	Integer diagnosisNo;
	Integer patientId;
	Integer doctorId;
	Integer hospitalId;
	String diagnosisName;
	String sympotoms;
	String testSummary;
	String treatment;
	String prescription;
	Date visitDatetime;
	String visitType;
	String doctorComment;
	String patientComment;
	String stats;
	public DiagnosisHistoryDto(Integer diagnosisNo, Integer patientId, Integer doctorId, Integer hospitalId,
			String diagnosisName, String sympotoms, String testSummary, String treatment, String prescription,
			Date visitDatetime, String visitType, String doctorComment, String patientComment, String stats) {
		super();
		this.diagnosisNo = diagnosisNo;
		this.patientId = patientId;
		this.doctorId = doctorId;
		this.hospitalId = hospitalId;
		this.diagnosisName = diagnosisName;
		this.sympotoms = sympotoms;
		this.testSummary = testSummary;
		this.treatment = treatment;
		this.prescription = prescription;
		this.visitDatetime = visitDatetime;
		this.visitType = visitType;
		this.doctorComment = doctorComment;
		this.patientComment = patientComment;
		this.stats = stats;
	}
	public DiagnosisHistoryDto() {
		super();
	}
	@Override
	public String toString() {
		return "diagnosisHistory [diagnosisNo=" + diagnosisNo + ", patientId=" + patientId + ", doctorId=" + doctorId
				+ ", hospitalId=" + hospitalId + ", diagnosisName=" + diagnosisName + ", sympotoms=" + sympotoms
				+ ", testSummary=" + testSummary + ", treatment=" + treatment + ", prescription=" + prescription
				+ ", visitDatetime=" + visitDatetime + ", visitType=" + visitType + ", doctorComment=" + doctorComment
				+ ", patientComment=" + patientComment + ", stats=" + stats + "]";
	}
	public Integer getDiagnosisNo() {
		return diagnosisNo;
	}
	public void setDiagnosisNo(Integer diagnosisNo) {
		this.diagnosisNo = diagnosisNo;
	}
	public Integer getPatientId() {
		return patientId;
	}
	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}
	public Integer getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}
	public Integer getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}
	public String getDiagnosisName() {
		return diagnosisName;
	}
	public void setDiagnosisName(String diagnosisName) {
		this.diagnosisName = diagnosisName;
	}
	public String getSympotoms() {
		return sympotoms;
	}
	public void setSympotoms(String sympotoms) {
		this.sympotoms = sympotoms;
	}
	public String getTestSummary() {
		return testSummary;
	}
	public void setTestSummary(String testSummary) {
		this.testSummary = testSummary;
	}
	public String getTreatment() {
		return treatment;
	}
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}
	public String getPrescription() {
		return prescription;
	}
	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}
	public Date getVisitDatetime() {
		return visitDatetime;
	}
	public void setVisitDatetime(Date visitDatetime) {
		this.visitDatetime = visitDatetime;
	}
	public String getVisitType() {
		return visitType;
	}
	public void setVisitType(String visitType) {
		this.visitType = visitType;
	}
	public String getDoctorComment() {
		return doctorComment;
	}
	public void setDoctorComment(String doctorComment) {
		this.doctorComment = doctorComment;
	}
	public String getPatientComment() {
		return patientComment;
	}
	public void setPatientComment(String patientComment) {
		this.patientComment = patientComment;
	}
	public String getStats() {
		return stats;
	}
	public void setStats(String stats) {
		this.stats = stats;
	}
	
	
}
