package service.admin;

import java.util.List;

import dao.admin.NoticeDao;
import dao.admin.NoticeDaoImpl;
import dao.file.FileDao;
import dao.file.FileDaoImpl;
import dto.NoticeDto;
import dto.otherDto.OtherNoticeDto;
import util.PageInfo;

public class NoticeServiceImpl implements NoticeService {
   private NoticeDao noticeDao;
   private FileDao fDao;

   public NoticeServiceImpl() {
      noticeDao = new NoticeDaoImpl();
      fDao = new FileDaoImpl();
   }

   @Override
   public void write(NoticeDto notice) throws Exception {
      noticeDao.insert(notice);
   }

   @Override
   public NoticeDto getDetail(Integer nNo) throws Exception {
      return noticeDao.select(nNo);
   }

   @Override
   public NoticeDto update(NoticeDto notice) throws Exception {
       Integer nNo = notice.getnNo();
       Integer fNo = notice.getFileNo();
       // 기존 공지사항 조회
       NoticeDto befNotice = noticeDao.select(nNo);
       if (befNotice == null) {
           throw new IllegalArgumentException("존재하지 않는 공지사항입니다. nNo=" + nNo);
       }

       // 새 파일이 없으면 기존 파일 번호 유지
       if (fNo == null) {
           Integer befFNo = befNotice.getFileNo();
           if (befFNo != null) {
               notice.setFileNo(befFNo);
           }
       }
       noticeDao.update(notice);
       return notice; // 수정 후 최신 데이터 반환
   }


   @Override
   public boolean delete(Integer nNo) throws Exception {
      NoticeDto notice = noticeDao.select(nNo);
      if (notice == null)
         return false;
      noticeDao.delete(nNo);
      return true;
   }

   @Override
   public String getUserNm(Integer uNo) throws Exception {
      return noticeDao.selectUserNm(uNo);
   }

   @Override
   public OtherNoticeDto getOtherNo(Integer nNo, Integer uNo, String part) throws Exception {
      return noticeDao.selectOtherNotice(nNo, uNo, part);
   }

   @Override
   public List<NoticeDto> getSearchList(String keyword) throws Exception {
      return noticeDao.searchNoticeList(keyword);
   }

   @Override
   public Integer getSearchCnt(String keyword) throws Exception {
      return noticeDao.searchNoticeCnt(keyword);
   }

@Override
public List<NoticeDto> getTopList(Integer uNo, String keyword, String sort) throws Exception {
	return noticeDao.selectNoticeList(uNo, keyword, sort, 0, 0, 1);	
}

@Override
public List<NoticeDto> getList(Integer uNo, String keyword, String sort, PageInfo page) throws Exception {
	int topCnt = noticeDao.cnt(uNo, keyword, 1);
    int totalCount = noticeDao.cnt(uNo, keyword, 0); // 전체 글 개수
    final int PAGE_SIZE = 8 - topCnt;      // 페이지 당 글 수
    final int PAGE_GROUP = 8 - topCnt;     // 페이지 그룹 수 (페이징 버튼 갯수)
    int totalPage = (int) Math.ceil((double) totalCount / PAGE_SIZE); // 총 페이지 수
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
    return noticeDao.selectNoticeList(uNo, keyword, sort, offset, topCnt, 0);
}
   

}