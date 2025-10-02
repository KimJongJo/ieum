package dao.allCommunity;

import java.util.List;

import dto.CommentWithMemberDto;

public interface CommentWithMemberDao {
	List<CommentWithMemberDto> selectMemberWithComment(Integer uNo) throws Exception;
}
