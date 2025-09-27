package dao.member;

import dto.MemberDto;

public interface MemberDao {
	
	MemberDto checkId(String userId);

	void normalJoin(MemberDto member);

}
