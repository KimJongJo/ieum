package service.myPage;

import dto.MemberDto;
import dto.MemberProfileDto;

public interface ProfileInfoService {
	MemberDto selectProfileView(Integer uNo) throws Exception;
	
	void updateProfile(MemberDto memberDto) throws Exception;
	
	MemberProfileDto selectMemberWithProfile(Integer uNo) throws Exception;
}
