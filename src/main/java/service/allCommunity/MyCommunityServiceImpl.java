package service.allCommunity;

import java.util.List;

import dao.allCommunity.MyCommunityDao;
import dao.allCommunity.MyCommunityDaoImpl;
import dto.MyCommunityDto;

public class MyCommunityServiceImpl implements MyCommunityService{
	
	private MyCommunityDao myCommunityDao;
	
	public MyCommunityServiceImpl() {
		myCommunityDao = new MyCommunityDaoImpl();
	}

	@Override
	public List<MyCommunityDto> getMyCommunityList(Integer uNo) throws Exception {
		return myCommunityDao.selectMyCommunityList(uNo);
	}

	@Override
	public List<MyCommunityDto> getSelectLikedCommunityList(int uNo) throws Exception {
		return myCommunityDao.selectLikedCommunityList(uNo);
	}

}
