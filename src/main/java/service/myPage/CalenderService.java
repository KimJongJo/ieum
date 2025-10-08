package service.myPage;

import java.util.List;

import dto.DiaryDto;
import dto.MyCommunityDto;

public interface CalenderService {
	
	MyCommunityDto getMyRecentCommunity(int uNo) throws Exception;
	
	List<DiaryDto> getAllByUser(int uNo) throws Exception;
	
}
