package dao.myPage;

import java.util.List;
import java.util.Map;

import dto.BlackListDto;

public interface BlackListDao {

	int insertBlackList(BlackListDto dto) throws Exception;

	List<Integer> getBlockedComments(Map<String, Object> params) throws Exception;

}