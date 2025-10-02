package service.social;

import dto.MemberDto;
import dto.otherDto.NaverMemberDto;

public interface NaverService {

	String getAccessToken(String clientId, String clientSecret, String code, String state) throws Exception;

	NaverMemberDto getMemberDto(String token) throws Exception;

	MemberDto emailCheck(String email);

}
