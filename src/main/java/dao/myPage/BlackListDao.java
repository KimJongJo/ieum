package dao.myPage;

import java.util.List;
import java.util.Map;

import dto.AllCommunityDto;
import dto.BlackListDto;
import dto.BlackWithMemberDto;
import dto.CommentDto;
import dto.CommunityDto;

public interface BlackListDao {

	int insertBlackList(BlackListDto dto) throws Exception;

	List<Integer> getBlockedUsers(int uNo) throws Exception;

	List<BlackWithMemberDto> selectBlackWithMember(Integer uNo) throws Exception;
	
	int deleteBlack(Map<String, Integer> map) throws Exception;
	  
	List<BlackWithMemberDto> selectBlackList(Integer row) throws Exception;
	Integer selectBlackCount(Integer uNo) throws Exception;
}