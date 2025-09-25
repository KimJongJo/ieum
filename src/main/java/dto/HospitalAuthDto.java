package dto;

public class HospitalAuthDto {
	
	Integer hCode;	// 병원 인증 코드
	Integer hNo;	// 병원 번호
	
	public HospitalAuthDto() {
		super();
	}
	public HospitalAuthDto(Integer hCode, Integer hNo) {
		super();
		this.hCode = hCode;
		this.hNo = hNo;
	}
	
	
	
	@Override
	public String toString() {
		return "hospitalAuthDto [hCode=" + hCode + ", hNo=" + hNo + "]";
	}
	public Integer gethCode() {
		return hCode;
	}
	public void sethCode(Integer hCode) {
		this.hCode = hCode;
	}
	public Integer gethNo() {
		return hNo;
	}
	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}
	
	
	

}
