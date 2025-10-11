package service.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.allCommunity.MyCommunityDao;
import dao.allCommunity.MyCommunityDaoImpl;
import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;
import util.PageInfo;

public class MyCommunityServiceImpl implements MyCommunityService{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	private MyCommunityDao myCommunityDao;
	private CommuEmpathyService commuEmpathyService; // 공감 체크용
	public MyCommunityServiceImpl() {
		myCommunityDao = new MyCommunityDaoImpl();
		commuEmpathyService = new CommuEmpathyServiceImpl();
	}

	@Override
	public List<MyCommunityDto> getMyCommunityList(Integer uNo) throws Exception {
		return myCommunityDao.selectMyCommunityList(uNo);
	}

	@Override
	public List<MyCommunityDto> getSelectLikedCommunityList(int uNo) throws Exception {
		return myCommunityDao.selectLikedCommunityList(uNo);
	}

	@Override
	public boolean checkEmpathy(int uNo, int commuNo) throws Exception {
		 return myCommunityDao.checkEmpathy(uNo, commuNo);
	}

	
	// 최근 작성 커뮤니티 + 댓글 하트 상태
    public MyCommunityDto getRecentMyCommunityWithLiked(int uNo) throws Exception {
        MyCommunityDto community = myCommunityDao.selectMyCommunityOne(uNo);
        if (community != null) {
            boolean liked = commuEmpathyService.checkEmpathy(uNo, community.getCommuNo());
            community.setLikedByUserCom(liked);
        }
        return community;
    }

    // 최근 좋아요한 커뮤니티 + 댓글 하트 상태
    public MyCommunityDto getRecentLikedCommunityWithLiked(int uNo) throws Exception {
        MyCommunityDto community = myCommunityDao.selectLikedCommunityOne(uNo);
        if (community != null) {
            boolean liked = commuEmpathyService.checkEmpathy(uNo, community.getCommuNo());
            community.setLikedByUserCom(liked);
        }
        return community;
    }

	@Override
	public List<MyCommunityDto> listByPage(PageInfo pageInfo, Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> param = new HashMap<>();
			param.put("row", (pageInfo.getCurPage() - 1) * 10); // <- 음수 제거
		    param.put("uNo", uNo);
		    
		    Integer allPage = (int)Math.ceil((double)myCommunityDao.selectMyConut(uNo)/10); // 전체 페이지 수
			// startPage : 1 ~ 10 => 1, 11 ~ 20 => 11
			Integer startPage = (pageInfo.getCurPage()-1)/10 * 10 + 1;
			Integer endPage = startPage  +10 - 1;
			if(endPage > allPage) endPage = allPage;
			
			pageInfo.setAllPage(allPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
		    return session.selectList("mapper.community.selectMyList", param);
		}
	}

	@Override
	public List<MyCommunityDto> listByLikePage(PageInfo pageInfo, Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> param = new HashMap<>();
			param.put("row", (pageInfo.getCurPage() - 1) * 10); // <- 음수 제거
		    param.put("uNo", uNo);
		    
		    Integer allPage = (int)Math.ceil((double)myCommunityDao.selectMyConut(uNo)/10); // 전체 페이지 수
			// startPage : 1 ~ 10 => 1, 11 ~ 20 => 11
			Integer startPage = (pageInfo.getCurPage()-1)/10 * 10 + 1;
			Integer endPage = startPage  +10 - 1;
			if(endPage > allPage) endPage = allPage;
			
			pageInfo.setAllPage(allPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
		    return session.selectList("mapper.community.selectLikedCommunityList", param);
		}
	}
}
