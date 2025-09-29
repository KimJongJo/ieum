package service.allCommunity;

import java.util.List;

import dto.MyCommunityDto;

public interface MyCommunityService {
	List<MyCommunityDto> getMyCommunityList(Integer uNo) throws Exception;
}
