package service.myPage;

import java.util.List;

import dto.BlackListDto;

public interface BlackListService {

	boolean blockComment(BlackListDto dto) throws Exception;

	List<Integer> getBlockedComments(int uNo, int commuNo) throws Exception;


}
