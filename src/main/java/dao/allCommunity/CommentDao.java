package dao.allCommunity;

import java.util.List;

import dto.CommentDto;

public interface CommentDao {
	void insert(CommentDto commentDto) throws Exception;
	
	List<CommentDto> selectCommentWithNick(int commuNo) throws Exception;
}
