package service.allCommunity;

import java.util.List;

import dto.MyCommunityDto;

public interface MyCommunityService {
	List<MyCommunityDto> getMyCommunityList(Integer uNo) throws Exception;
	
	List<MyCommunityDto> getSelectLikedCommunityList(int uNo) throws Exception;

	boolean checkEmpathy(int uNo, int commuNo) throws Exception; // 공감 여부 확인
	
	
	
}
