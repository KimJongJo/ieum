package dao.allCommunity;

import dto.MyCommunityDto;

public interface CommuEmpathyDao {
	//공감 상태 확인
	boolean checkEmpathy(int uNo, int commuNo) throws Exception;
	//추가하기
	void insertEmpathy(int uNo, int commuNo) throws Exception;
	//삭제하기
	void deleteEmpathy(int uNo, int commuNo) throws Exception;
	//commu 테이블의 empathy 추가하기
	void updateCommuEmpathy(int commuNo, int delta) throws Exception;
	
	
	int getEmpathyCount(int commuNo) throws Exception;
}
