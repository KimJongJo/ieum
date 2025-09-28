package service.myPage;

import java.util.List;

import javax.servlet.http.HttpSession;

import dao.myPage.DiaryDao;
import dao.myPage.DiaryDaoImpl;
import dto.DiaryDto;
import util.PageInfo;

public class DiaryServiceImpl implements DiaryService {
	private DiaryDao diaryDao;

	public DiaryServiceImpl() {
		diaryDao = new DiaryDaoImpl();
	}

	@Override
	public void write(DiaryDto diary) throws Exception {
		diaryDao.insert(diary);
	}

	@Override
	public DiaryDto getDetail(Integer dNo) throws Exception {
		return diaryDao.select(dNo);
	}

	@Override
	public List<DiaryDto> getList(Integer uNo, PageInfo page) throws Exception {
		Integer cnt = diaryDao.cnt();
		Integer allPage = (int) Math.ceil((double) cnt / 10);
		Integer startPage = (page.getCurPage() - 1) / 10 * 10;
		Integer endPage = startPage + 10;
		if (endPage > allPage)
			endPage = allPage;
		page.setAllPage(allPage);
		page.setStartPage(startPage);
		page.setEndPage(endPage);
		Integer row = (page.getCurPage() - 1) * 10;
		return diaryDao.selectDiaryList(uNo, row);
	}

	@Override
	public DiaryDto update(DiaryDto diary) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean getHisYn(Integer uNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
