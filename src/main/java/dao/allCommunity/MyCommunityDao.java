package dao.allCommunity;

import java.util.List;

import dto.MyCommunityDto;

public interface MyCommunityDao {
	List<MyCommunityDto> selectMyCommunityList(int uNo);
}
