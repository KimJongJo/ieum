package service.allCommunity;

import java.util.List;

import dto.AllCommunityDto;
import util.PageInfo;

public interface AllCommunityService {
	List<AllCommunityDto> getAllCommunity();

	List<AllCommunityDto> listByPage(PageInfo pageInfo) throws Exception;
}
