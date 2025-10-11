package service.allCommunity;

import java.util.List;

import dto.CommentWithMemberDto;
import dto.MyCommunityDto;
import util.PageInfo;

public interface CommentWithMemberService {
	List<CommentWithMemberDto> getMemWithCom(Integer uNo) throws Exception;
	
	
	List<CommentWithMemberDto> listByCommentPage(PageInfo pageInfo, Integer uNo) throws Exception;
}
