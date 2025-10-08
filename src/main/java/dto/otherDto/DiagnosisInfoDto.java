package dto.otherDto;

public class DiagnosisInfoDto {
	
	private Integer rNo; // 예약번호
	private String pNm; // 환자이름
	private Integer pNo; // 환자 번호
	private String time; // 예약 시간
	private String diaState; // 진단서 작성상태
	private Integer diaNo; // 진단서 번호
	private String mNm; // 의사 이름
	private String date; // 예약날짜
	private String diaName;
	
	public DiagnosisInfoDto(Integer rNo, String pNm, Integer pNo, String time, String diaState, Integer diaNo) {
		super();
		this.rNo = rNo;
		this.pNm = pNm;
		this.pNo = pNo;
		this.time = time;
		this.diaState = diaState;
		this.diaNo = diaNo;
	}
	
	public DiagnosisInfoDto(Integer rNo, String pNm, Integer pNo, String time, String diaState, Integer diaNo,
			String mNm, String date) {
		super();
		this.rNo = rNo;
		this.pNm = pNm;
		this.pNo = pNo;
		this.time = time;
		this.diaState = diaState;
		this.diaNo = diaNo;
		this.mNm = mNm;
		this.date = date;
	}
	
	
	
	public DiagnosisInfoDto(Integer rNo, String pNm, Integer pNo, String time, Integer diaNo, String mNm, String date) {
		super();
		this.rNo = rNo;
		this.pNm = pNm;
		this.pNo = pNo;
		this.time = time;
		this.diaNo = diaNo;
		this.mNm = mNm;
		this.date = date;
	}
	
	

	public DiagnosisInfoDto(Integer diaNo, String mNm, String date, String diaName) {
		super();
		this.diaNo = diaNo;
		this.mNm = mNm;
		this.date = date;
		this.diaName = diaName;
	}

	@Override
	public String toString() {
		return "DiagnosisInfoDto [rNo=" + rNo + ", pNm=" + pNm + ", pNo=" + pNo + ", time=" + time + ", diaState="
				+ diaState + ", diaNo=" + diaNo + ", getrNo()=" + getrNo() + ", getpNm()=" + getpNm() + ", getpNo()="
				+ getpNo() + ", getTime()=" + getTime() + ", getDiaState()=" + getDiaState() + ", getDiaNo()="
				+ getDiaNo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}



	public String getmNm() {
		return mNm;
	}

	public void setnMn(String mNm) {
		this.mNm = mNm;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getrNo() {
		return rNo;
	}

	public void setrNo(Integer rNo) {
		this.rNo = rNo;
	}

	public String getpNm() {
		return pNm;
	}

	public void setpNm(String pNm) {
		this.pNm = pNm;
	}

	public Integer getpNo() {
		return pNo;
	}

	public void setpNo(Integer pNo) {
		this.pNo = pNo;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDiaState() {
		return diaState;
	}

	public void setDiaState(String diaState) {
		this.diaState = diaState;
	}

	public Integer getDiaNo() {
		return diaNo;
	}

	public void setDiaNo(Integer diaNo) {
		this.diaNo = diaNo;
	}

	public String getDiaName() {
		return diaName;
	}

	public void setDiaName(String diaName) {
		this.diaName = diaName;
	}

	public void setmNm(String mNm) {
		this.mNm = mNm;
	}
	
	
	
	

}
