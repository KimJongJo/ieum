package service.social;

import dto.otherDto.KakaoMemberDto;

public interface KakaoService {

	String getAccessToken(String code, String kakaoKey, String kakaoRedirectUrl) throws Exception;

	KakaoMemberDto getMemberDto(String token) throws Exception;

}
