package service.allCommunity;

import java.util.List;

import dto.MyCommunityDto;
import util.PageInfo;

public interface MyCommunityService {
	List<MyCommunityDto> getMyCommunityList(Integer uNo) throws Exception;
	
	List<MyCommunityDto> getSelectLikedCommunityList(int uNo) throws Exception;

	boolean checkEmpathy(int uNo, int commuNo) throws Exception; // 공감 여부 확인
	
	
	List<MyCommunityDto> listByPage(PageInfo pageInfo, Integer uNo) throws Exception;
	
	
	List<MyCommunityDto> listByLikePage(PageInfo pageInfo, Integer uNo) throws Exception;
}
