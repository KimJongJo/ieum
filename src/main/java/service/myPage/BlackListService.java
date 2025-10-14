package service.myPage;

import java.util.List;


import dto.BlackListDto;
import dto.BlackWithMemberDto;
import dto.MyCommunityDto;
import util.PageInfo;

public interface BlackListService {

	boolean blockUser(int uNo, int blockedNo) throws Exception;

	List<Integer> getBlockedUsers(int uNo) throws Exception;

	List<BlackWithMemberDto> getBlackWithMember(Integer uNo) throws Exception;
	
	// 차단 해제
    boolean unblockUser(int uNo, int blockedNo) throws Exception;
    
    List<BlackWithMemberDto> listByPage(PageInfo pageInfo, Integer uNo) throws Exception;
}
