package service.allCommunity;

import dto.CommunityDto;

public interface CommunityService {
	Integer insertCommunity(CommunityDto community) throws Exception;
	// 글 번호로 단건 조회 (상세 페이지용)
    CommunityDto selectByNo(Integer commuNo) throws Exception;
    
    void deleteCommunityWithComments(int commuNo) throws Exception;
}
