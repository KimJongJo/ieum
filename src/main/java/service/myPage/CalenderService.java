package service.myPage;

import dto.MyCommunityDto;

public interface CalenderService {
	
	MyCommunityDto getMyRecentCommunity(int uNo) throws Exception;
	
}
