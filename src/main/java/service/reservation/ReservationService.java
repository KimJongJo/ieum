package service.reservation;

import java.util.Date;
import java.util.List;
import java.util.Map;

import dto.ReservationDto;
import dto.otherDto.ResPageResponseDto;
import dto.otherDto.ReservationInfoDto;
import util.PageInfo;

public interface ReservationService {
	
	List<ReservationDto> getTimeFromRes (Integer mNo, String rDate) throws Exception;
	void doReservation (ReservationDto reservation)throws Exception;
	ResPageResponseDto todayReservationList(Integer uNo, int curPage);
	Map<String, Object> selectDiaByRNo(Integer rNo);
	Map<String, Object> patientProfile(Integer rNo);
	ResPageResponseDto todayReservationByKeywordList(Integer page, String keyword, Integer uNo);
	
	Integer getLastRes (Integer uNo) throws Exception;
	ReservationInfoDto getResDetail (Integer rNo) throws Exception;
	Integer getDocMno (Integer rNo) throws Exception;
	List<ReservationInfoDto> comResList (Integer uNo) throws Exception;
	List<ReservationInfoDto> recResList (Integer uNo, String keyword, PageInfo page, String sort) throws Exception;
	Integer recResListCnt (Integer uNo, String keyword, String sort) throws Exception;
	void resCancel (Integer rNo) throws Exception;
}
