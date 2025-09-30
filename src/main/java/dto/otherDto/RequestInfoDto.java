package dto.otherDto;

public class RequestInfoDto {
	Integer applicantNo; // 신청 번호
	Integer hNo; // 병원 번호
	String hNm; // 병원 이름
	String applicantName; // 신청자 이름
	String applicantTel; // 신청자 전화번호
	String applicantEmail; // 신청자 이메일
	String hAddress; // 병원 주소
	String hosReNo; // 사업자등록번호
	String hosReFilePath; // 사입자등록증 경로
	
	public RequestInfoDto() {
		super();
	}

	public RequestInfoDto(Integer applicantNo, Integer hNo, String hNm, String applicantName, String applicantTel,
			String applicantEmail, String hAddress, String hosReNo, String hosReFilePath) {
		super();
		this.applicantNo = applicantNo;
		this.hNo = hNo;
		this.hNm = hNm;
		this.applicantName = applicantName;
		this.applicantTel = applicantTel;
		this.applicantEmail = applicantEmail;
		this.hAddress = hAddress;
		this.hosReNo = hosReNo;
		this.hosReFilePath = hosReFilePath;
	}


	public String getHosReFilePath() {
		return hosReFilePath;
	}

	public void setHosReFilePath(String hosReFilePath) {
		this.hosReFilePath = hosReFilePath;
	}

	public String gethNm() {
		return hNm;
	}


	public void sethNm(String hNm) {
		this.hNm = hNm;
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

	public String getApplicantTel() {
		return applicantTel;
	}

	public void setApplicantTel(String applicantTel) {
		this.applicantTel = applicantTel;
	}

	public String getApplicantEmail() {
		return applicantEmail;
	}

	public void setApplicantEmail(String applicantEmail) {
		this.applicantEmail = applicantEmail;
	}

	public String gethAddress() {
		return hAddress;
	}

	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}

	public String getHosReNo() {
		return hosReNo;
	}

	public void setHosReNo(String hosReNo) {
		this.hosReNo = hosReNo;
	}
	
	
	
	
	
}
