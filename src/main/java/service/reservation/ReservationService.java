package service.reservation;

import java.time.LocalDate;
import java.util.List;

import dto.ReservationDto;

public interface ReservationService {
	
	List<ReservationDto> getTimeFromRes (Integer mNo, String rDate) throws Exception;

}
