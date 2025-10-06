package dao.myPage;

import dto.MyCommunityDto;

public interface CalenderDao {
	MyCommunityDto selectMyRecentCommunity(int uNo)throws Exception;
}
