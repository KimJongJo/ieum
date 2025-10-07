package dao.reservation;

import java.util.List;

import dto.ReservationDto;
import dto.otherDto.ReservationInfoDto;

public interface ReservationDao {

	List<ReservationDto> selectTime(Integer mNo, String rDate)throws Exception;
	void insertRes (ReservationDto reservation)throws Exception;
	List<ReservationDto> todayReservationList();
	
	Integer lastRes (Integer uNo)throws Exception;
	ReservationInfoDto resDetail (Integer rNo)throws Exception;
	Integer docMno (Integer rNo)throws Exception;
	List<ReservationInfoDto> commingRes (Integer uNo) throws Exception;
	List<ReservationInfoDto> recordRes (Integer uNo) throws Exception;

}
