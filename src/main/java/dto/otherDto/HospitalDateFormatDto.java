package dto.otherDto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class HospitalDateFormatDto {
    private int hNo;
    private String hNm;
    private String hAddress;
    private String hTel;
    private Date hCreated; // DB DATETIME 컬럼과 매핑

    
    

    public HospitalDateFormatDto(int hNo, String hNm, String hAddress, String hTel, Date hCreated) {
		super();
		this.hNo = hNo;
		this.hNm = hNm;
		this.hAddress = hAddress;
		this.hTel = hTel;
		this.hCreated = hCreated;
	}

	// 프론트로 내려줄 문자열 포맷 필드
    public String getHCreatedStr() {
        if (hCreated == null) return "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(hCreated); // 항상 yyyy-MM-dd 형식
    }

	public int gethNo() {
		return hNo;
	}

	public void sethNo(int hNo) {
		this.hNo = hNo;
	}

	public String gethNm() {
		return hNm;
	}

	public void sethNm(String hNm) {
		this.hNm = hNm;
	}

	public String gethAddress() {
		return hAddress;
	}

	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}

	public String gethTel() {
		return hTel;
	}

	public void sethTel(String hTel) {
		this.hTel = hTel;
	}

	public Date gethCreated() {
		return hCreated;
	}

	public void sethCreated(Date hCreated) {
		this.hCreated = hCreated;
	}

	@Override
	public String toString() {
		return "HospitalDateFormatDto [hNo=" + hNo + ", hNm=" + hNm + ", hAddress=" + hAddress + ", hTel=" + hTel
				+ ", hCreated=" + hCreated + "]";
	}
}
