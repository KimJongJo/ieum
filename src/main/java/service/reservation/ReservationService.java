package service.reservation;

import java.util.List;
import java.util.Map;

import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;
import dto.otherDto.ResPageResponseDto;

public interface ReservationService {
	
	List<ReservationDto> getTimeFromRes (Integer mNo, String rDate) throws Exception;
	void doReservation (ReservationDto reservation)throws Exception;
	ResPageResponseDto todayReservationList(Integer uNo, int curPage);
	Map<String, Object> selectDiaByRNo(Integer rNo);
	Map<String, Object> patientProfile(Integer rNo);
	ResPageResponseDto todayReservationByKeywordList(Integer page, String keyword, Integer uNo);

}
