package service.member;

import dto.MemberDto;

public interface MemberService {
	MemberDto selectByNickName(Integer uNo) throws Exception;
}
