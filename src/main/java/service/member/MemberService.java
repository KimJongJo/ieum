package service.member;
import java.util.List;
import java.util.Map;

import dto.MemberDto;
import dto.otherDto.ManagerInfoDto;
import dto.otherDto.ManagerPageResponseDto;
import dto.otherDto.MemberFileDto;
import dto.otherDto.MemberPageResponseDto;
import dto.otherDto.HospitalDocDto;

public interface MemberService {
	
	boolean checkUserId(String userId);

	void normalJoin(MemberDto member);

	Map<String, Object> findId(String email);

	int changePw(String userId, String password);

	int login(String userId, String password);

	MemberDto selectByNickName(Integer uNo) throws Exception;
	
	List<HospitalDocDto> DoclistBy2 (Integer hNo) throws Exception;

	MemberDto socialIdCheck(String idStr);

	Integer socialSignUp(MemberDto member);

	MemberDto emailCheck(String email);

	boolean checkPw(String email, String password);

	MemberDto socialUpdate(String email, String id) throws Exception;
	
	MemberDto selectResUser (Integer uNo)throws Exception;

	MemberPageResponseDto userList(int curPage, String filter, Integer state);

	MemberPageResponseDto memberListByKeyword(int requestPage, String keyword, String filter, Integer state);

	void userState(Integer uNo, Integer stateCode);

	MemberFileDto memberInfoAndFile(Integer uNo);

	ManagerPageResponseDto managerList(int curPage, String filter, int state, String role);

	ManagerPageResponseDto managerListByKeyword(int requestPage, String keyword, String filter, Integer state,
			String role);

	ManagerInfoDto managerInfoAndFile(Integer uNo);

	MemberDto selectUserByNo(Integer uNo);

	
	HospitalDocDto getDocDetail (Integer mNo) throws Exception;

	String profileDown(String id, String profile);

	int getTotalUser();

	int getTotalManager();

	int getTotalMember();

	
}
