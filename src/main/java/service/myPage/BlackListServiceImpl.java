package service.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.myPage.BlackListDao;
import dao.myPage.BlackListDaoImpl;
import dto.BlackListDto;
import dto.BlackWithMemberDto;
import dto.CommentDto;
import dto.CommunityDto;

public class BlackListServiceImpl implements BlackListService{
	private BlackListDao blackListDao;
	
	public BlackListServiceImpl() {
		blackListDao = new BlackListDaoImpl();
	}
	
	 // 사용자 차단
    @Override
    public boolean blockUser(int uNo, int blockedNo) throws Exception {
        BlackListDto dto = new BlackListDto();
        dto.setuNo(uNo);
        dto.setBlockedNo(blockedNo);
        int result = blackListDao.insertBlackList(dto);
        return result > 0;
    }

    // 로그인 사용자가 차단한 사용자 목록
    @Override
    public List<Integer> getBlockedUsers(int uNo) throws Exception {
        return blackListDao.getBlockedUsers(uNo);
    }

    // 블랙리스트 + 회원 정보 조회
    @Override
    public List<BlackWithMemberDto> getBlackWithMember(Integer uNo) throws Exception {
        return blackListDao.selectBlackWithMember(uNo);
    }

    
}
