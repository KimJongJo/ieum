package dao.myPage;

import java.util.List;

import dto.DiaryDto;
import dto.MyCommunityDto;

public interface CalenderDao {
	MyCommunityDto selectMyRecentCommunity(int uNo)throws Exception;
	
	List<DiaryDto> selectAllByUser(int uNo) throws Exception;
}
