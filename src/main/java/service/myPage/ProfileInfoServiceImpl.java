package service.myPage;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.MemberDto;
import dto.MemberProfileDto;

public class ProfileInfoServiceImpl implements ProfileInfoService{
	private MemberDao memberDao;
	
	public ProfileInfoServiceImpl() {
		memberDao = new MemberDaoImpl();
	}

	@Override
	public MemberDto selectProfileView(Integer uNo) throws Exception {
		return memberDao.selectProfileInfo(uNo);
	}

	@Override
	public void updateProfile(MemberDto memberDto) throws Exception {
		memberDao.updateProfile(memberDto);
	}

	@Override
	public MemberProfileDto selectMemberWithProfile(Integer uNo) throws Exception {
		return memberDao.selectMemberWithProfile(uNo);
	}	

}
