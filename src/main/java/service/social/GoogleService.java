package service.social;

import dto.MemberDto;
import dto.otherDto.GoogleMemberDto;

public interface GoogleService {

	String getAccessToken(String clientId, String clientSecret, String code, String redirectUrl) throws Exception;

	GoogleMemberDto getMemberDto(String token) throws Exception;

	MemberDto emailCheck(String email);

}
