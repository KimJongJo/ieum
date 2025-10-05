package service.reservation;

import java.util.List;

import dto.ReservationDto;
import dto.otherDto.ResUserDoctorInfoDto;

public interface ReservationService {
	
	List<ReservationDto> getTimeFromRes (Integer mNo, String rDate) throws Exception;
	void doReservation (ReservationDto reservation)throws Exception;

	List<ResUserDoctorInfoDto> todayReservationList();

}
