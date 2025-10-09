package service.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.reservation.ReservationDao;
import dao.reservation.ReservationDaoImpl;
import dto.DiagnosisHistoryDto;
import dto.MemberDto;
import dto.ReservationDto;
import dto.otherDto.ResPageResponseDto;
import dto.otherDto.ReservationInfoDto;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import util.PageInfo;
public class ReservationServiceImpl implements ReservationService {

	private ReservationDao resDao;
	private DiagnosisService diaService;
	private MemberService memberService;
	
	
	public ReservationServiceImpl() {
		resDao = new ReservationDaoImpl();
		diaService = new DiagnosisServiceImpl();
		memberService = new MemberServiceImpl();
	}
	
	//예약 시간 조회
	@Override
	public List<ReservationDto> getTimeFromRes(Integer mNo, String rDate) throws Exception {
		return resDao.selectTime(mNo, rDate);
	}
  
	// 예약을 하면서 바로 해당 진단서까지 생성
	//예약 등록
	@Override
	public void doReservation(ReservationDto reservation) throws Exception {
		// 예약을 하고 예약 번호를 받아온다.
		Integer rNo = resDao.insertRes(reservation);
		// 환자 번호, 의사번호, 병원번호, 예약번호를 가지고 진단서 생성
		System.out.println(rNo);
		diaService.createDia(new DiagnosisHistoryDto(reservation.getuNo(), reservation.getmNo(), reservation.gethNo(), rNo));
		
	}

	// 오늘 예약 리스트 조회
	@Override
	public ResPageResponseDto todayReservationList(Integer uNo, int curPage) {
		
		MemberDto member = memberService.selectUserByNo(uNo);
		
		int resCount;
		
		if("DOCTOR".equals(member.getUserType())) {
			resCount = resDao.resCount(uNo); // 전체 데이터 수(의사)
		}else { // 현재 병원관리자가 로그인할 경우 모든 의사에 대한 예약 정보 보기
			resCount = resDao.resCount(); // 전체 데이터 수 (병원관리자)
		}
		
		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수
		int allPage = (int) Math.ceil((double) resCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치
		
		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("uNo", uNo);
		
		
		// 현재 로그인한 회원이 의사일 경우 자신의 예약자만 보기
		if("DOCTOR".equals(member.getUserType())) {
			return new ResPageResponseDto(resDao.todayReservationMyList(page), curPage, allPage, startPage, endPage, resCount);
		}else { // 현재 병원관리자가 로그인할 경우 모든 의사에 대한 예약 정보 보기
			return new ResPageResponseDto(resDao.todayReservationList(page), curPage, allPage, startPage, endPage, resCount);
		}
	}

	// 예약 번호를 통해 진단서 작성할때 기본 정보들 가져오기
	@Override
	public Map<String, Object> selectDiaByRNo(Integer rNo) {
		return resDao.selectDiaByRNo(rNo);
	}

	@Override
	public Map<String, Object> patientProfile(Integer rNo) {
		return resDao.patientProfile(rNo);
	}

	// 
	@Override
	public ResPageResponseDto todayReservationByKeywordList(Integer curPage, String keyword, Integer uNo) {
		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

		MemberDto member = memberService.selectUserByNo(uNo);
		
		Map<String, Object> keywordPage = new HashMap<>();
		
		int resCount;
		if("DOCTOR".equals(member.getUserType())) {
			keywordPage.put("keyword", keyword);
			keywordPage.put("uNo", uNo);
			
			resCount = resDao.resCount(keywordPage); // 전체 데이터 수(의사)
		}else { // 현재 병원관리자가 로그인할 경우 모든 의사에 대한 예약 정보 보기
			keywordPage.put("keyword", keyword);
			
			resCount = resDao.resCountByManager(keywordPage); // 전체 데이터 수(병원관리자)
		}
		
		
		int allPage = (int) Math.ceil((double) resCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치
		
		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("uNo", uNo);
		page.put("pageSize", pageSize);
		page.put("keyword", keyword);
		
		
		// 현재 로그인한 회원이 의사일 경우 자신의 예약자만 보기
		if("DOCTOR".equals(member.getUserType())) {
			return new ResPageResponseDto(resDao.todayReservationMyListByKeyword(page), curPage, allPage, startPage, endPage, resCount);
		}else { // 현재 병원관리자가 로그인할 경우 모든 의사에 대한 예약 정보 보기
			return new ResPageResponseDto(resDao.todayReservationListByKeyword(page), curPage, allPage, startPage, endPage, resCount);
		}
	}

	// 가장 최근 예약번호
	@Override
	public Integer getLastRes(Integer uNo) throws Exception {
		return resDao.lastRes(uNo);
	}
	//예약 디테일
	@Override
	public ReservationInfoDto getResDetail(Integer rNo) throws Exception {
		return resDao.resDetail(rNo);
	}

	//의사 번호 가져오기
	@Override
	public Integer getDocMno(Integer rNo) throws Exception {
		return resDao.docMno(rNo);
	}

	//다가오는 예약
	@Override
	public List<ReservationInfoDto> comResList(Integer uNo) throws Exception {
		return resDao.commingRes(uNo);
	}
	

	//지난 예약
	@Override
	public List<ReservationInfoDto> recResList(Integer uNo, String keyword, PageInfo page, String sort) throws Exception {
		final int pageSize = 5; // 페이지 당 글 수
		final int pageGroup = 10;	// 페이지 그룹 수 (페이징 버튼 갯수)	
		
		Map<String, Object> recCnt = new HashMap<>();
		recCnt.put("keyword", keyword);
		recCnt.put("sort", sort);
		recCnt.put("uNo", uNo);
		
		int totalCount = resDao.recordResCnt(recCnt);
		int totalPage = (int) Math.ceil((double)totalCount/pageSize); // 총 페이지 수
		
		int curPage = page.getCurPage();
		
		if(curPage < 1) {
			curPage = 1;
		}else if (curPage > totalPage && totalPage > 0 ) {
			curPage = totalPage;
		}
		
		page.setCurPage(curPage);
		
		int startPage = (curPage -1)/ pageGroup * pageGroup +1;
		int endPage = startPage + pageGroup -1;
		if(endPage > totalPage) endPage = totalPage;
		
		page.setAllPage(totalPage);
		page.setStartPage(startPage);
		page.setEndPage(endPage);
		
		int offset = (curPage -1) * pageSize;
		if(offset < 0) offset = 0;
		
		Map<String, Object> recPage = new HashMap<>();
		recPage.put("offset", offset);
		recPage.put("keyword", keyword);
		recPage.put("uNo", uNo);
		recPage.put("sort", sort);
		recPage.put("pageSize", pageSize);
		
		return resDao.recordRes(recPage);
		
	}

	//필터처리한 갯수
	@Override
	public Integer recResListCnt(Integer uNo, String keyword, String sort) throws Exception {
		Map<String, Object> recCnt = new HashMap<>();
		recCnt.put("keyword", keyword);
		recCnt.put("sort", sort);
		recCnt.put("uNo", uNo);
		return resDao.recordResCnt(recCnt);
	}

	//예약취소
	@Override
	public void resCancel(Integer rNo) throws Exception {
		resDao.resCancel(rNo);
	}
	


	
}
