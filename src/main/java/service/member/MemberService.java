package service.member;
import java.util.List;
import java.util.Map;

import dto.MemberDto;

public interface MemberService {
	
	boolean checkUserId(String userId);

	void normalJoin(MemberDto member);

	Map<String, Object> findId(String email);

	int changePw(String userId, String password);

	int login(String userId, String password);

	MemberDto selectByNickName(Integer uNo) throws Exception;
	
	List<MemberDto> DoclistBy2 (Integer hNo) throws Exception;

	MemberDto socialIdCheck(String idStr);

	Integer socialSignUp(MemberDto member);

	MemberDto emailCheck(String email);

	boolean checkPw(String email, String password);

	MemberDto socialUpdate(String email, String id) throws Exception;
	
	MemberDto selectResUser (Integer uNo)throws Exception;
	
	MemberDto getresDoc (Integer mNo)throws Exception;
	
}
