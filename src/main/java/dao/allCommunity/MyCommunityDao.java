package dao.allCommunity;

import java.util.List;

import dto.MyCommunityDto;

public interface MyCommunityDao {
	//작성자 모든 내용
	List<MyCommunityDto> selectMyCommunityList(int uNo) throws Exception ;
	//공감이 있다면 그 작성자의 모든 내용
	List<MyCommunityDto> selectLikedCommunityList(int uNo) throws Exception;
}
