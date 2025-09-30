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

	List<Integer> getBlockedComments(Map<String, Object> params) throws Exception;
	
	
	List<BlackWithMemberDto> selectselectBlackWithMember() throws Exception;

}