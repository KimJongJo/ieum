package service.myPage;

import java.util.List;

import dao.myPage.CalenderDao;
import dao.myPage.CalenderDaoImpl;
import dao.myPage.DiaryDao;
import dto.DiaryDto;
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
	@Override
	public List<DiaryDto> getAllByUser(int uNo) throws Exception {
		return calenderDao.selectAllByUser(uNo);
	}

}
