package service.myPage;

import java.util.List;

import dto.DiaryDto;
import dto.MyCommunityDto;
import dto.ReservationDto;

public interface CalenderService {
	
	MyCommunityDto getMyRecentCommunity(int uNo) throws Exception;
	
	List<DiaryDto> getAllByUser(int uNo) throws Exception;
	
	List<ReservationDto> getAllReservationList(int uNo) throws Exception;
	
}
