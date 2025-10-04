package dto.otherDto;

public class ResUserDoctorInfoDto {
	private Integer rNo; // 예약 번호
	private String pName; // 환자 이름
	private Integer pNo; // 환자 번호
	private String time; // 예약 시간
	private Integer diaNo; // 진단서 번호
	private String diaState; // 진단서 작성 상태
	
	public ResUserDoctorInfoDto(Integer rNo, String pName, Integer pNo, String time, Integer diaNo, String diaState) {
		super();
		this.rNo = rNo;
		this.pName = pName;
		this.pNo = pNo;
		this.time = time;
		this.diaNo = diaNo;
		this.diaState = diaState;
	}
	
	

	@Override
	public String toString() {
		return "ResUserDoctorInfoDto [rNo=" + rNo + ", pName=" + pName + ", pNo=" + pNo + ", time=" + time + ", diaNo="
				+ diaNo + ", diaState=" + diaState + ", getrNo()=" + getrNo() + ", getpName()=" + getpName()
				+ ", getpNo()=" + getpNo() + ", getTime()=" + getTime() + ", getDiaNo()=" + getDiaNo()
				+ ", getDiaState()=" + getDiaState() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}



	public Integer getrNo() {
		return rNo;
	}

	public void setrNo(Integer rNo) {
		this.rNo = rNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
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

	public Integer getDiaNo() {
		return diaNo;
	}

	public void setDiaNo(Integer diaNo) {
		this.diaNo = diaNo;
	}

	public String getDiaState() {
		return diaState;
	}

	public void setDiaState(String diaState) {
		this.diaState = diaState;
	}
	
	
	
	
}
