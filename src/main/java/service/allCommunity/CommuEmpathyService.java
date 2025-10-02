package service.allCommunity;

public interface CommuEmpathyService {
//	boolean commuEmpathy(int uNo, int commuNo) throws Exception;
//	
//	int getEmpathyCount(int commuNo) throws Exception;
	
	
	
	// 유저가 해당 게시글에 공감했는지 확인
    boolean hasEmpathy(int uNo, int commuNo) throws Exception;

    // 공감 토글
    int toggleEmpathy(int uNo, int commuNo) throws Exception;
}
