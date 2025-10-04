package dto;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;

public class ReservationDto {
	
	Integer rNo; // 예약 번호
	Integer uNo;	// 예약자 번호
	Integer hNo;	// 병원 번호
	Integer mNo;	// 의사 번호
	LocalDate rDate;	// 예약 날짜
	LocalTime rTime;	// 예약 시간
	String rContent;	// 상담 내용
	String actName;	// 실제 방문자
	String actTel;	// 실제 전화번호
	String rStatus;	// 예약상태
	String rDay;	// 요일
	
	
	public ReservationDto() {
		super();
	}


	public ReservationDto(Integer rNo, Integer uNo, Integer hNo, Integer mNo, LocalDate rDate, LocalTime rTime,
			String rContent, String actName, String actTel, String rStatus, String rDay) {
		super();
		this.rNo = rNo;
		this.uNo = uNo;
		this.hNo = hNo;
		this.mNo = mNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rContent = rContent;
		this.actName = actName;
		this.actTel = actTel;
		this.rStatus = rStatus;
		this.rDay = rDay;
	}
	
	
	public ReservationDto(Integer uNo, Integer hNo, Integer mNo, LocalDate rDate, LocalTime rTime,
			String rContent, String rStatus, String rDay) {
		super();
		this.uNo = uNo;
		this.hNo = hNo;
		this.mNo = mNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rContent = rContent;
		this.rStatus = rStatus;
		this.rDay = rDay;
	}


	public ReservationDto(Integer uNo, Integer hNo, Integer mNo, LocalDate rDate, LocalTime rTime, String rContent,
			String actName, String actTel, String rStatus, String rDay) {
		super();
		this.uNo = uNo;
		this.hNo = hNo;
		this.mNo = mNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rContent = rContent;
		this.actName = actName;
		this.actTel = actTel;
		this.rStatus = rStatus;
		this.rDay = rDay;
	}


	@Override
	public String toString() {
		return "ReservationDto [rNo=" + rNo + ", uNo=" + uNo + ", hNo=" + hNo + ", mNo=" + mNo + ", rDate=" + rDate
				+ ", rTime=" + rTime + ", rContent=" + rContent + ", actName=" + actName + ", actTel=" + actTel
				+ ", rStatus=" + rStatus + ", rDay=" + rDay + "]";
	}


	public Integer getrNo() {
		return rNo;
	}


	public void setrNo(Integer rNo) {
		this.rNo = rNo;
	}


	public Integer getuNo() {
		return uNo;
	}


	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}


	public Integer gethNo() {
		return hNo;
	}


	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}


	public Integer getmNo() {
		return mNo;
	}


	public void setmNo(Integer mNo) {
		this.mNo = mNo;
	}


	public LocalDate getrDate() {
		return rDate;
	}


	public void setrDate(LocalDate rDate) {
		this.rDate = rDate;
	}


	public LocalTime getrTime() {
		return rTime;
	}


	public void setrTime(LocalTime rTime) {
		this.rTime = rTime;
	}


	public String getrContent() {
		return rContent;
	}


	public void setrContent(String rContent) {
		this.rContent = rContent;
	}


	public String getActName() {
		return actName;
	}


	public void setActName(String actName) {
		this.actName = actName;
	}


	public String getActTel() {
		return actTel;
	}


	public void setActTel(String actTel) {
		this.actTel = actTel;
	}


	public String getrStatus() {
		return rStatus;
	}


	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}


	public String getrDay() {
		return rDay;
	}


	public void setrDay(String rDay) {
		this.rDay = rDay;
	}

	
	
	
	
	
	

}
