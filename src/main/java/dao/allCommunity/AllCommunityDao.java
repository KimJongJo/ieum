package dao.allCommunity;

import java.util.List;

import dto.AllCommunityDto;
import util.PageInfo;

public interface AllCommunityDao {
	List<AllCommunityDto> selectAllCommunityList();
	
	List<AllCommunityDto> selectList(Integer row, String sort, String category) throws Exception;
	Integer selectCount(String category) throws Exception;
	
	Integer getSearchCnt(String keyword) throws Exception;
	List<AllCommunityDto>getSearchList(String keyword) throws Exception;
}
