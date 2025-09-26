package service.hosSignUp;

import dto.CommunityDto;

public interface CommunityService {
	Integer insertCommunity(CommunityDto community) throws Exception;
}
