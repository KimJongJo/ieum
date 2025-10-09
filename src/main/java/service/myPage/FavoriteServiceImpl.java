package service.myPage;

import java.util.List;

import dao.myPage.FavoriteDao;
import dao.myPage.FavoriteDaoImpl;
import dto.FavoriteDto;
import util.PageInfo;

public class FavoriteServiceImpl implements FavoriteService {
	private FavoriteDao fDao;

	public FavoriteServiceImpl() {
		fDao = new FavoriteDaoImpl();
	}
	@Override
	public FavoriteDto getDetail(Integer hFNo) throws Exception {
		return fDao.select(hFNo);
	}

	@Override
	public Integer cnt(Integer uNo) throws Exception {
		return fDao.cnt(uNo);
	}

	@Override
	public void delete(Integer hFNo) throws Exception {
		fDao.delete(hFNo);		
	}

	@Override
	public List<FavoriteDto> getList(PageInfo page, Integer uNo) throws Exception {
		final int PAGE_SIZE = 10; // 한 페이지당 글 수
		final int PAGE_GROUP = 10; // 페이지 버튼 그룹 크기

		int totalCount = fDao.cnt(uNo);
		int totalPage = (int) Math.ceil((double) totalCount / PAGE_SIZE);
		if (totalPage == 0)
			totalPage = 1; // 최소 1페이지 유지

		int curPage = page.getCurPage();
		if (curPage < 1)
			curPage = 1;
		if (curPage > totalPage)
			curPage = totalPage;

		page.setCurPage(curPage);

		// 페이지 그룹 시작/끝 계산 (안정화된 공식)
		int startPage = ((curPage - 1) / PAGE_GROUP) * PAGE_GROUP + 1;
		int endPage = Math.min(startPage + PAGE_GROUP - 1, totalPage);

		page.setStartPage(startPage);
		page.setEndPage(endPage);
		page.setAllPage(totalPage);

		int offset = (curPage - 1) * PAGE_SIZE;
		return fDao.selectFavList(offset, uNo);
	}
	

}
