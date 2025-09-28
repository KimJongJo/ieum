package dao.member;

import java.util.Map;

import dto.MemberDto;

public interface MemberDao {
	MemberDto selectByNickName(Integer uNo) throws Exception;
	
	MemberDto selectProfileInfo(Integer uNo) throws Exception;
	
	void updateProfile(MemberDto memberDto) throws Exception;
	
	MemberDto selectFindById(Integer uNo) throws Exception;
	
	void updatePassword(MemberDto memberDto) throws Exception;
	
}
