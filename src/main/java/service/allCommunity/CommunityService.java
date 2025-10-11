package service.allCommunity;

import java.util.List;

import dto.AllCommunityDto;
import dto.CommunityDto;
import dto.MyCommunityDto;
import util.PageInfo;

public interface CommunityService {
	Integer insertCommunity(CommunityDto community) throws Exception;
	// 글 번호로 단건 조회 (상세 페이지용)
    CommunityDto selectByNo(Integer commuNo) throws Exception;
    
    void deleteCommunityWithComments(int commuNo) throws Exception;
    
    void updateCommunity(MyCommunityDto myCommunity) throws Exception;
    
    CommunityDto updateViews(int commuNo) throws Exception;
    
    int getWriterNoByCommuNo(int commuNo) throws Exception;
    
    Integer getCommunityAuthorNo(int commuNo) throws Exception;
}
