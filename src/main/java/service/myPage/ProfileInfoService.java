package service.myPage;

import dto.MemberDto;

public interface ProfileInfoService {
	MemberDto selectProfileView(Integer uNo) throws Exception;
	
	void updateProfile(MemberDto memberDto) throws Exception;
	

}
