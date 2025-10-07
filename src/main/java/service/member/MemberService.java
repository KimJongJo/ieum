package service.member;
import java.util.List;
import java.util.Map;

import dto.MemberDto;
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
	
	HospitalDocDto getDocDetail (Integer mNo) throws Exception;

	
}
