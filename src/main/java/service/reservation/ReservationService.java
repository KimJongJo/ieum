package service.reservation;

import java.util.List;
import java.util.Map;

import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;

public interface ReservationService {
	
	List<ReservationDto> getTimeFromRes (Integer mNo, String rDate) throws Exception;
	void doReservation (ReservationDto reservation)throws Exception;
	List<DiagnosisInfoDto> todayReservationList(Integer uNo);
	Map<String, Object> selectDiaByRNo(Integer rNo);
	Map<String, Object> patientProfile(Integer rNo);

}
