package dto;


public class DiagnosisHistoryDto {
	Integer diagnosisNo; //진단 번호
	Integer patientId; // 환자 id
	Integer doctorId; // 의사 id
	Integer hospitalId; // 병원 id
	String diagnosisName; // 진단명
	String sympotoms; // 증상
	String testSummary; // 검사결과요약
	String treatment; // 처치수술내용
	String prescription; // 처방전
	Boolean isCompleted; // 진료 완료 여부
	String doctorComment; // 의사의 말
	String patientComment; // 환자 메모
	String stats; // 진단서 작성상태
	Integer reservationNo; // 예약 번호
	
	public DiagnosisHistoryDto() {
		super();
	}
	








	public DiagnosisHistoryDto(Integer diagnosisNo, Integer patientId, Integer doctorId, Integer hospitalId,
			String diagnosisName, String sympotoms, String testSummary, String treatment, String prescription,
			Boolean isCompleted, String doctorComment, String patientComment, String stats, Integer reservationNo) {
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
		this.isCompleted = isCompleted;
		this.doctorComment = doctorComment;
		this.patientComment = patientComment;
		this.stats = stats;
		this.reservationNo = reservationNo;
	}









	public DiagnosisHistoryDto(Integer patientId, Integer doctorId, Integer hospitalId,
			Integer reservationNo) {
		super();
		this.patientId = patientId;
		this.doctorId = doctorId;
		this.hospitalId = hospitalId;
		this.reservationNo = reservationNo;
	}
	
	

	public DiagnosisHistoryDto(Integer diagnosisNo, String diagnosisName, String sympotoms, String testSummary,
			String treatment, String prescription, String doctorComment) {
		super();
		this.diagnosisNo = diagnosisNo;
		this.diagnosisName = diagnosisName;
		this.sympotoms = sympotoms;
		this.testSummary = testSummary;
		this.treatment = treatment;
		this.prescription = prescription;
		this.doctorComment = doctorComment;
	}





	@Override
	public String toString() {
		return "DiagnosisHistoryDto [diagnosisNo=" + diagnosisNo + ", patientId=" + patientId + ", doctorId=" + doctorId
				+ ", hospitalId=" + hospitalId + ", diagnosisName=" + diagnosisName + ", sympotoms=" + sympotoms
				+ ", testSummary=" + testSummary + ", treatment=" + treatment + ", prescription=" + prescription
				+ ", isCompleted=" + isCompleted + ", doctorComment=" + doctorComment + ", patientComment="
				+ patientComment + ", stats=" + stats + ", reservationNo=" + reservationNo + "]";
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

	public Integer getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(Integer reservationNo) {
		this.reservationNo = reservationNo;
	}
	
	
}
