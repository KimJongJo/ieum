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
	
	
    @Override
    public boolean blockComment(BlackListDto dto) throws Exception{
        int result = blackListDao.insertBlackList(dto);
        return result > 0;
    }

    @Override
    public List<Integer> getBlockedComments(int uNo, int commuNo) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("uNo", uNo);
        params.put("commuNo", commuNo);
        return blackListDao.getBlockedComments(params);
    }


	@Override
	public List<BlackWithMemberDto> getBlackWithMember() throws Exception {
		
		return blackListDao.selectselectBlackWithMember();
	}
    
    
    
}
