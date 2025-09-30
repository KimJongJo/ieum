package dao.allCommunity;

import dto.CommunityDto;

public interface CommunityDao {
	void insert(CommunityDto community) throws Exception;
	
	int deleteCommunity(int commuNo) throws Exception;
	
	CommunityDto selectByNo(int commuNo) throws Exception;
	
}
