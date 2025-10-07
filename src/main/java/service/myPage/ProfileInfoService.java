package service.myPage;

import javax.servlet.http.Part;

import dto.MemberDto;
import dto.MemberProfileDto;

public interface ProfileInfoService {
	MemberDto selectProfileView(Integer uNo) throws Exception;
	
	void updateProfile(MemberDto memberDto, Part file) throws Exception;
	
	MemberProfileDto selectMemberWithProfile(Integer uNo) throws Exception;
	
	MemberProfileDto selectMemberWithProFileImg(Integer uNo) throws Exception;
}
