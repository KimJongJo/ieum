package service.allCommunity;

import java.util.List;

import dto.CommentWithMemberDto;

public interface CommentWithMemberService {
	List<CommentWithMemberDto> getMemWithCom(Integer uNo) throws Exception;
}
