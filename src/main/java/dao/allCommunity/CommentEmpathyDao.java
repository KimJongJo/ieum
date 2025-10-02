package dao.allCommunity;

public interface CommentEmpathyDao {
	//공감상태 확인
	boolean ckeckCommeEmpathy(int uNo, int commeNo) throws Exception;
	
	//공감 추가
	void insertCommeEmpathy(int uNo, int commeNo) throws Exception;
	
	//삭제하기
	void deleteCommeEmpathy(int uNo, int commeNo) throws Exception;
	
	//comme 테이블에 empathy 하나 추가
	void updateCommeEmpathy(int commeNo, int delta) throws Exception;
	
	//공감 가져오기
	int getCommeEmpathyCount(int commeNo) throws Exception;

}
