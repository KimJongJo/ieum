package dao.allCommunity;

import java.util.List;

import dto.CommunityDto;
import dto.MyCommunityDto;

public interface CommunityDao {
	void insert(CommunityDto community) throws Exception;
	
	int deleteCommunity(int commuNo) throws Exception;
	
	CommunityDto selectByNo(int commuNo) throws Exception;
	
	void updateCommu(MyCommunityDto myCommunityDto) throws Exception;
	
	void updateViewsCount(int commuNo)throws Exception;
	
	
	int selectWriterNoByCommuNo(int commuNo) throws Exception;
}
