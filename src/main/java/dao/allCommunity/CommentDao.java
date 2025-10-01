package dao.allCommunity;

import java.util.List;

import dto.CommentDto;

public interface CommentDao {
	//등록하기
	void insert(CommentDto commentDto) throws Exception;
	
	//리스트로 보여주기
	List<CommentDto> selectCommentWithNick(int commuNo) throws Exception;
	
	// 해당 게시글 댓글 삭제
	int deleteCommentsByCommuNo(Integer commuNo) throws Exception;
	
	// 댓글 조회
	List<CommentDto> getCommentsByCommuNo(int commuNo) throws Exception;
	
	
	
	 // 댓글 개수 조회
    int countCommentsByCommuNo(int commuNo) throws Exception;

    // community 테이블의 commu_comment 갱신
    void updateCommentCount(int commuNo, int count) throws Exception;

}
