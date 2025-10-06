package service.allCommunity;

public interface CommuEmpathyService {
	boolean commuEmpathy(int uNo, int commuNo) throws Exception;
	
	int getEmpathyCount(int commuNo) throws Exception;
	
	boolean checkEmpathy(int uNo, int commuNo) throws Exception;
	
	
}
