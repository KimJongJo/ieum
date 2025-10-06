package service.allCommunity;

import java.util.List;

import dao.allCommunity.MyCommunityDao;
import dao.allCommunity.MyCommunityDaoImpl;
import dto.MyCommunityDto;

public class MyCommunityServiceImpl implements MyCommunityService{
	
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
}
