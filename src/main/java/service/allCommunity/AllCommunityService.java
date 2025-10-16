package service.allCommunity;

import java.util.List;

import dto.AllCommunityDto;
import util.PageInfo;

public interface AllCommunityService {
	List<AllCommunityDto> getAllCommunity();

	List<AllCommunityDto> listByPage(PageInfo pageInfo , String sort, String category) throws Exception;
	
//	pes
	Integer getSearchCnt(String keyword) throws Exception;
	List<AllCommunityDto>getSearchList(String keyword) throws Exception;

}
