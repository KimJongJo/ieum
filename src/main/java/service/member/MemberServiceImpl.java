package service.member;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.MemberDto;

public class MemberServiceImpl implements MemberService {

	MemberDao memberDao;
	
	public MemberServiceImpl() {
		memberDao = new MemberDaoImpl();
	}
	
	@Override
	public boolean checkUserId(String userId) {
		
		MemberDto member = memberDao.checkId(userId);
		
		if(member == null) {
			return false; // 사용 가능
		}else {
			return true; // 존재하는 아이디
			
		}
	}

	@Override
	public void normalJoin(MemberDto member) {
		memberDao.normalJoin(member);
		
	}

}
