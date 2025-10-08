package service.myPage;

import java.util.List;

import dao.myPage.DiaryDao;
import dao.myPage.DiaryDaoImpl;
import dto.DiagnosisHistoryDto;
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
	public List<DiaryDto> getList(Integer uNo, String keyword, String sort, PageInfo page) throws Exception {
		final int PAGE_SIZE = 10;      // 페이지 당 글 수
		final int PAGE_GROUP = 10;     // 페이지 그룹 수 (페이징 버튼 갯수)

		int totalCount = diaryDao.cnt(); // 전체 글 개수
		int totalPage = (int) Math.ceil((double) totalCount / PAGE_SIZE); // 총 페이지 수

		int curPage = page.getCurPage();

		if (curPage < 1) {
		    curPage = 1;
		} else if (curPage > totalPage && totalPage > 0) {
		    curPage = totalPage;
		}

		page.setCurPage(curPage);

		int startPage = (curPage - 1) / PAGE_GROUP * PAGE_GROUP + 1;
		int endPage = startPage + PAGE_GROUP - 1;
		if (endPage > totalPage) endPage = totalPage;

		page.setAllPage(totalPage);
		page.setStartPage(startPage);
		page.setEndPage(endPage);

		int offset = (curPage - 1) * PAGE_SIZE;
		if (offset < 0) offset = 0;

		return diaryDao.selectDiaryList(uNo, keyword, sort, offset);

	}

	@Override
	public DiaryDto update(DiaryDto diary) throws Exception {
		return diaryDao.update(diary);
	}

	@Override
	public boolean delete(Integer dNo) throws Exception {
		DiaryDto diary = diaryDao.select(dNo);
		if (diary == null)
			return false;
		diaryDao.delete(dNo);
		return true;
	}

	@Override
	public boolean getHisYn(Integer uNo) throws Exception {
		List<DiagnosisHistoryDto> list = diaryDao.selectHisList(uNo);
		if (list == null || list.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public DiaryDto getDate(Integer uNo, String date) throws Exception {
		return diaryDao.selectDate(uNo, date);
	}

	@Override
	public List<DiaryDto> getCalList(Integer uNo, String sDate, String eDate) throws Exception {
		return diaryDao.selectCalList(uNo, sDate, eDate);
	}

	// 해당 환자의 다이어리 기로 가져오기
	@Override
	public List<DiaryDto> getPatientDiaryList(Integer uNo) {
		
		return diaryDao.selectPatientDiaryList(uNo);
		
	}

}
