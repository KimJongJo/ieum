package dto;

import java.sql.Date;

public class ReservationDto {
	
	Integer rNo; // 예약 번호
	Integer uNo;	// 예약자 번호
	Integer hNo;	// 병원 번호
	Integer mNo;	// 의사 번호
	Date rDate;	// 예약 날짜
	Date rTime;	// 예약 시간
	String rContent;	// 상담 내용
	String actName;	// 실제 방문자
	String actTel;	// 실제 전화번호
	String rStatus;	// 예약상태
	String rDay;	// 요일

}
