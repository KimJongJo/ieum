package dao.allCommunity;

import java.util.List;

import dto.AllCommunityDto;

public interface AllCommunityDao {
	List<AllCommunityDto> selectAllCommunityList();
	
	List<AllCommunityDto> selectList(Integer row) throws Exception;
	Integer selectCount() throws Exception;
}
