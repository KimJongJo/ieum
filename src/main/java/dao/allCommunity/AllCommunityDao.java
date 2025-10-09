package dao.allCommunity;

import java.util.List;

import dto.AllCommunityDto;
import util.PageInfo;

public interface AllCommunityDao {
	List<AllCommunityDto> selectAllCommunityList();
	
	List<AllCommunityDto> selectList(Integer row) throws Exception;
	Integer selectCount() throws Exception;
	
	Integer getSearchCnt(String keyword) throws Exception;
	List<AllCommunityDto>getSearchList(String keyword) throws Exception;
}
