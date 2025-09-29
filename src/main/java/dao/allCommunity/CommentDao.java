package dao.allCommunity;

import java.util.List;

import dto.CommentDto;

public interface CommentDao {
	void insert(CommentDto commentDto) throws Exception;
	
	List<CommentDto> selectCommentWithNick(int commuNo) throws Exception;
	
	// 해당 게시글 댓글 삭제
	int deleteCommentsByCommuNo(Integer commuNo) throws Exception;
	
	// 댓글 조회 (참고)
	List<CommentDto> getCommentsByCommuNo(int commuNo) throws Exception;
}
