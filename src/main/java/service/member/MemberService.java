package service.member;
import java.util.Map;

import dto.MemberDto;

public interface MemberService {
	
	boolean checkUserId(String userId);

	void normalJoin(MemberDto member);

	Map<String, Object> findId(String email);

	int changePw(String userId, String password);

	int login(String userId, String password);

	MemberDto selectByNickName(Integer uNo) throws Exception;
	
}
