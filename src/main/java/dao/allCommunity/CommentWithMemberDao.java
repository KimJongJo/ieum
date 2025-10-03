package dao.allCommunity;

import java.util.List;

import dto.CommentWithMemberDto;

public interface CommentWithMemberDao {
	List<CommentWithMemberDto> selectMemberWithComment(Integer uNo) throws Exception;
	
	// 특정 게시글에 대해 특정 유저가 공감했는지 확인
    boolean checkEmpathy(int uNo, int commuNo) throws Exception;
}
