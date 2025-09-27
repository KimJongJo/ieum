package dao.member;

import dto.MemberDto;

public interface MemberDao {
	MemberDto selectByNickName(Integer uNo) throws Exception;
}
