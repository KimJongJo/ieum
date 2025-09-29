package service.myPage;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.MemberDto;

public class PassModifyServiceImpl implements PassModifyService{
	private MemberDao memberDao;
	
	public PassModifyServiceImpl() {
		memberDao = new MemberDaoImpl();
	}
	
	
	@Override
	public boolean checkCurrentId(int uNo, String currentId) throws Exception {
		if (currentId == null) return false;

	    MemberDto member = memberDao.selectFindById(uNo);
	    if (member != null && member.getId() != null) {
	        return member.getId().trim().equals(currentId.trim());
	    }
	    return false;
	}

	@Override
	public void updatePassword(int uNo, String newPass) throws Exception {
		memberDao.updatePassword(new MemberDto(uNo, newPass));
	}
}
