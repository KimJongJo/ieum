package service.allCommunity;

public interface CommentEmpathyService {
	boolean commentEmpathy (int uNo, int commeNo) throws Exception;
	
	int getCommentEmpathyCount(int commeNo) throws Exception;
}
