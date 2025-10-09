package dto.otherDto;

public class ShowDIaListToUser {
	
	private String uNm; // 환자 이름
	private String gender; // 환자 성별
	private String birthDate; // 환자 생년월일
	private String diagnosisName; // 진단명
	private String sympotoms; // 증상
	private String testSummary; // 검사결과요약
	private String treatment; // 처치수술내용
	private String doctorComment; // 의사의 말
	private String prescription; // 처방전
	private String docFileName; // 의사 파일 이름
	private String docFilePath; // 의사 파일 경로
	private String mNm; // 의사 이름
	private String rDate; // 진료일시
	private String major; // 전공
	private String hNm; // 병원 이름
	private Integer diaNo; // 진단서 번호

	

	@Override
	public String toString() {
		return "ShowDIaListToUser [uNm=" + uNm + ", gender=" + gender + ", birthDate=" + birthDate + ", diagnosisName="
				+ diagnosisName + ", sympotoms=" + sympotoms + ", testSummary=" + testSummary + ", treatment="
				+ treatment + ", doctorComment=" + doctorComment + ", prescription=" + prescription + ", docFileName="
				+ docFileName + ", docFilePath=" + docFilePath + ", mNm=" + mNm + ", rDate=" + rDate + ", major="
				+ major + ", hNm=" + hNm + "]";
	}
	
	public Integer getDiaNo() {
		return diaNo;
	}

	public void setDiaNo(Integer diaNo) {
		this.diaNo = diaNo;
	}

	public String getuNm() {
		return uNm;
	}

	public void setuNm(String uNm) {
		this.uNm = uNm;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
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

	public String getDoctorComment() {
		return doctorComment;
	}

	public void setDoctorComment(String doctorComment) {
		this.doctorComment = doctorComment;
	}

	public String getPrescription() {
		return prescription;
	}

	public void setPrescription(String prescription) {
		this.prescription = prescription;
	}



	public String getDocFileName() {
		return docFileName;
	}

	public void setDocFileName(String docFileName) {
		this.docFileName = docFileName;
	}

	public String getDocFilePath() {
		return docFilePath;
	}

	public void setDocFilePath(String docFilePath) {
		this.docFilePath = docFilePath;
	}

	public String getmNm() {
		return mNm;
	}

	public void setmNm(String mNm) {
		this.mNm = mNm;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String gethNm() {
		return hNm;
	}

	public void sethNm(String hNm) {
		this.hNm = hNm;
	}


	
	
	
	
	

}
