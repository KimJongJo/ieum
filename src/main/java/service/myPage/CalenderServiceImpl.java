package service.myPage;

import dao.myPage.CalenderDao;
import dao.myPage.CalenderDaoImpl;
import dto.MyCommunityDto;

public class CalenderServiceImpl implements CalenderService{
	
	private CalenderDao calenderDao;
	
	public CalenderServiceImpl() {
		calenderDao = new CalenderDaoImpl();
	}
	@Override
	public MyCommunityDto getMyRecentCommunity(int uNo) throws Exception {
		return calenderDao.selectMyRecentCommunity(uNo);
	}

}
