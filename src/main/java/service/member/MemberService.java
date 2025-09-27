package service.member;

import dto.MemberDto;

public interface MemberService {
	
	boolean checkUserId(String userId);

	void normalJoin(MemberDto member);

}
