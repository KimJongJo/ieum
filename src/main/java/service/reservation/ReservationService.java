package service.reservation;

import java.util.List;

import dto.ReservationDto;
import dto.otherDto.ReservationInfoDto;

public interface ReservationService {
	
	List<ReservationDto> getTimeFromRes (Integer mNo, String rDate) throws Exception;
	void doReservation (ReservationDto reservation)throws Exception;

	List<ReservationDto> todayReservationList();
	
	Integer getLastRes (Integer uNo) throws Exception;
	ReservationInfoDto getNowRes (Integer uNo, Integer rNo) throws Exception;
	Integer getDocMno (Integer rNo) throws Exception;

}
