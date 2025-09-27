package service.member;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.MemberDto;

public class MemberServiceImpl implements MemberService{
	
	private MemberDao memberDao;
	
	public MemberServiceImpl() {
		memberDao = new MemberDaoImpl();
	}
	
	@Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		return memberDao.selectByNickName(uNo);
	}

}
