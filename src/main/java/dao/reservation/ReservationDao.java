package dao.reservation;

import java.util.List;
import java.util.Map;

import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;

public interface ReservationDao {

	List<ReservationDto> selectTime(Integer mNo, String rDate)throws Exception;
	Integer insertRes (ReservationDto reservation)throws Exception;
	List<DiagnosisInfoDto> todayReservationList(Map<String, Object> page);
	List<DiagnosisInfoDto> todayReservationMyList(Map<String, Object> page);
	Map<String, Object> selectDiaByRNo(Integer rNo);
	Map<String, Object> patientProfile(Integer rNo);
	int resCount(Integer uNo);
	List<DiagnosisInfoDto> todayReservationMyListByKeyword(Map<String, Object> page);
	List<DiagnosisInfoDto> todayReservationListByKeyword(Map<String, Object> page);

}
