package service.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.myPage.BlackListDao;
import dao.myPage.BlackListDaoImpl;
import dto.BlackListDto;
import dto.BlackWithMemberDto;
import dto.CommentDto;
import dto.CommunityDto;
import util.MybatisSqlSessionFactory;
import util.PageInfo;

public class BlackListServiceImpl implements BlackListService{
	private BlackListDao blackListDao;
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
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

	@Override
	public boolean unblockUser(int uNo, int blockedNo) throws Exception {
		Map<String, Integer> map = new HashMap<>();
	    map.put("uNo", uNo);
	    map.put("blockedNo", blockedNo);
	    
	    int result = blackListDao.deleteBlack(map);
	    return result > 0;
	}

	@Override
	public List<BlackWithMemberDto> listByPage(PageInfo pageInfo, Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> param = new HashMap<>();
			param.put("row", (pageInfo.getCurPage() - 1) * 10); // <- 음수 제거
		    param.put("uNo", uNo);
		    
		    Integer allPage = (int)Math.ceil((double)blackListDao.selectBlackCount(uNo)/10); // 전체 페이지 수
			// startPage : 1 ~ 10 => 1, 11 ~ 20 => 11
			Integer startPage = (pageInfo.getCurPage()-1)/10 * 10 + 1;
			Integer endPage = startPage  +10 - 1;
			if(endPage > allPage) endPage = allPage;
			
			pageInfo.setAllPage(allPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
		    return session.selectList("mapper.blacklist.selectBlackList", param);
		}
	}

    
}
