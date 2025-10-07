package dao.member;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.MemberDto;
import dto.MemberProfileDto;
import dto.otherDto.ManagerInfoDto;
import dto.otherDto.ManagerPageResponseDto;
import dto.otherDto.MemberFileDto;
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

	int memberCount(Integer state);

	List<MemberDto> selectMembers(Map<String, Object> page);

	int memberListByKeyword(Map<String, Object> page);

	List<MemberDto> selectUserListByKeyword(Map<String, Object> page);

	void userState(Map<String, Integer> map);

	MemberFileDto memberInfoAndFile(Integer uNo);

	int managerCount(Map<String, Object> filterMap);

	List<ManagerInfoDto> selectManagers(Map<String, Object> page);

	int managerListByKeyword(Map<String, Object> keywordPage);

	List<ManagerInfoDto> selectManagerListByKeyword(Map<String, Object> page);

	ManagerInfoDto managerInfoAndFile(Integer uNo);

	MemberDto selectUserByNo(Integer uNo);
  
	HospitalDocDto docDetail (Integer mNo)throws Exception;
}
