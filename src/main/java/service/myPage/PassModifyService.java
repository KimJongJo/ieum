package service.myPage;

public interface PassModifyService {
	
boolean checkCurrentId(int uNo, String currentId) throws Exception;
	
    void updatePassword(int uNo, String newPass) throws Exception;
}
