package dao.allCommunity;

import java.util.List;

import dto.CommentDto;
import dto.CommunityDto;

public interface CommentDao {
	//등록하기
	void insert(CommentDto commentDto) throws Exception;
	
	//리스트로 보여주기
	List<CommentDto> selectCommentWithNick(int commuNo) throws Exception;
	
	// 해당 게시글 댓글 삭제
	int deleteCommentsByCommuNo(Integer commuNo) throws Exception;
	
	// 댓글 조회
	List<CommentDto> getCommentsByCommuNo(int commuNo) throws Exception;
	
	CommentDto selectByNo(int commeNo) throws Exception;
	
	 // 댓글 개수 조회
    int countCommentsByCommuNo(int commuNo) throws Exception;

    // community 테이블의 commu_comment 갱신
    void updateCommentCount(int commuNo, int count) throws Exception;
    
    //신고 횟수 증가
    void increaseReportCount(int commeNo) throws Exception;
    //신고 횟수 가져오기
    int getReportCount(int commeNo) throws Exception;
    //댓글 삭제
    void deleteComment(int commeNo)throws Exception;

	int getCommentWriter(int commeNo)throws Exception;
}
