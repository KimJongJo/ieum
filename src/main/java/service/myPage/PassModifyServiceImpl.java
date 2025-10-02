package service.myPage;

import org.mindrot.jbcrypt.BCrypt;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.MemberDto;

public class PassModifyServiceImpl implements PassModifyService{
	private MemberDao memberDao;
	
	public PassModifyServiceImpl() {
		memberDao = new MemberDaoImpl();
	}
	
	
	@Override
	public boolean checkCurrentId(int uNo, String currentId) throws Exception {// 입력한 비번
		if (currentId == null) return false;

	    MemberDto member = memberDao.selectFindById(uNo);// 현재 암호화된 비번
	    if (BCrypt.checkpw(currentId, member.getPassword())) {

	        return true;
	    }
	    return false;
	}

	@Override
	public void updatePassword(int uNo, String newPass) throws Exception {
		memberDao.updatePassword(new MemberDto(uNo, newPass));
	}
}
