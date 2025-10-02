package dao.member;

import java.util.Map;

import dto.MemberDto;
import dto.MemberProfileDto;

public interface MemberDao {
	
	MemberDto checkId(String userId);

	void normalJoin(MemberDto member);
	
	void managerJoin(MemberDto member);

	Map<String, Object> findId(String email);

	void changePw(Map<String, Object> userMap);

	String beforePw(String userId);

	Map<String, Object> existIdtoPw(String userId);

	MemberDto selectByNickName(Integer uNo) throws Exception;
	
	MemberDto selectProfileInfo(Integer uNo) throws Exception;
	
	void updateProfile(MemberDto memberDto) throws Exception;
	
	MemberDto selectFindById(Integer uNo) throws Exception;
	
	void updatePassword(MemberDto memberDto) throws Exception;

	MemberProfileDto selectMemberWithProfile(int uNo) throws Exception;

	
}
