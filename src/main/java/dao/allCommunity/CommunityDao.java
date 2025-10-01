package dao.allCommunity;

import dto.CommunityDto;
import dto.MyCommunityDto;

public interface CommunityDao {
	void insert(CommunityDto community) throws Exception;
	
	int deleteCommunity(int commuNo) throws Exception;
	
	CommunityDto selectByNo(int commuNo) throws Exception;
	
	void updateCommu(MyCommunityDto myCommunityDto) throws Exception;
	
	void updateViewsCount(int commuNo)throws Exception;
}
