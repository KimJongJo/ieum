package dao.reservation;

import java.util.List;
import java.util.Map;

import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;
import dto.otherDto.ReservationInfoDto;

public interface ReservationDao {

	List<ReservationDto> selectTime(Integer mNo, String rDate)throws Exception;

	Integer insertRes (ReservationDto reservation)throws Exception;
	List<DiagnosisInfoDto> todayReservationList(Map<String, Object> page);
	List<DiagnosisInfoDto> todayReservationMyList(Map<String, Object> page);
	Map<String, Object> selectDiaByRNo(Integer rNo);
	Map<String, Object> patientProfile(Integer rNo);
	int resCount(Integer uNo); // 의사인 경우
	int resCount(); // 병원관리자인 경우
	int resCount(Map<String, Object> keywordPage); // 키워드를 찾는 전체 데이터 수
	int resCountByManager(Map<String, Object> keywordPage); // 키워드를 찾는 전체 데이터 수(병원관리자)
	
	List<DiagnosisInfoDto> todayReservationMyListByKeyword(Map<String, Object> page);
	List<DiagnosisInfoDto> todayReservationListByKeyword(Map<String, Object> page);
	
	Integer lastRes (Integer uNo)throws Exception;
	ReservationInfoDto resDetail (Integer rNo)throws Exception;
	Integer docMno (Integer rNo)throws Exception;
	List<ReservationInfoDto> commingRes (Integer uNo) throws Exception;
	List<ReservationInfoDto> recordRes (Map<String, Object> recPage) throws Exception;
	Integer recordResCnt (Integer uNo) throws Exception;

	

	

}
