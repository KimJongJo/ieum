package service.member;

import java.util.Map;

import dto.MemberDto;

public interface MemberService {
	
	boolean checkUserId(String userId);

	void normalJoin(MemberDto member);

	Map<String, Object> findId(String email);

	boolean changePw(String userId, String password);

}
