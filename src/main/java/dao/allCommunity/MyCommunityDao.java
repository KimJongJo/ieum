package dao.allCommunity;

import java.util.List;

import dto.MyCommunityDto;

public interface MyCommunityDao {
	//작성자 모든 내용
	List<MyCommunityDto> selectMyCommunityList(int uNo) throws Exception ;
	//공감이 있다면 그 작성자의 모든 내용(특정 유저가 공감한 게시글 리스트 가져오기)
	List<MyCommunityDto> selectLikedCommunityList(int uNo) throws Exception;
	// 특정 게시글에 대해 특정 유저가 공감했는지 확인
    boolean checkEmpathy(int uNo, int commuNo) throws Exception;
    
    
 // 최근 작성한 커뮤니티 1개
    MyCommunityDto selectMyCommunityOne(int uNo) throws Exception;

    // 최근 좋아요한 커뮤니티 1개
    MyCommunityDto selectLikedCommunityOne(int uNo) throws Exception;
    
    //페이징
	List<MyCommunityDto> selectMyList(Integer row) throws Exception;
	Integer selectMyConut(Integer uNo) throws Exception;
    
}
