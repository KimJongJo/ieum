package service.myPage;

import java.util.List;


import dto.BlackListDto;
import dto.BlackWithMemberDto;

public interface BlackListService {

	boolean blockUser(int uNo, int blockedNo) throws Exception;

	List<Integer> getBlockedUsers(int uNo) throws Exception;

	List<BlackWithMemberDto> getBlackWithMember(Integer uNo) throws Exception;
}
