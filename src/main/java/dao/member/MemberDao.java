package dao.member;

import java.util.List;
import java.util.Map;

import dto.MemberDto;
import dto.MemberProfileDto;
import dto.otherDto.HospitalDocDto;

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
	
	Integer docCnt(Integer hNo) throws Exception;
	
	List<HospitalDocDto> docList(Integer hNo) throws Exception;

	Integer kakaoSignUp(MemberDto member);

	MemberDto checkEmail(String email);

	void socialUpdate(Map<String, String> map);
	
	HospitalDocDto docDetail (Integer mNo)throws Exception;
	
}
