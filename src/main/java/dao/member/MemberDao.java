package dao.member;

import java.util.Map;

import dto.MemberDto;

public interface MemberDao {
	
	MemberDto checkId(String userId);

	void normalJoin(MemberDto member);

	Map<String, Object> findId(String email);

	void changePw(Map<String, Object> userMap);

	String beforePw(String userId);

	Map<String, Object> existIdtoPw(String userId);

}
