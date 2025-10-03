package service.allCommunity;

import java.util.List;

import dto.CommentDto;
import dto.CommunityDto;

public interface CommentService {
	void insertComment(CommentDto commentDto) throws Exception;
	
	List<CommentDto> getCommentsByCommuNo(Integer commuNo) throws Exception; 
	
	CommentDto selectByNo(Integer commeNo) throws Exception;
}
