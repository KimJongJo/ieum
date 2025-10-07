package service.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.reservation.ReservationDao;
import dao.reservation.ReservationDaoImpl;
import dto.DiagnosisHistoryDto;
import dto.MemberDto;
import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;
import dto.otherDto.ResPageResponseDto;
import service.diagnosis.DiagnosisService;
import service.diagnosis.DiagnosisServiceImpl;
import service.member.MemberService;
import service.member.MemberServiceImpl;

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
	@Override
	public void doReservation(ReservationDto reservation) throws Exception {
		// 예약을 하고 예약 번호를 받아온다.
		Integer rNo = resDao.insertRes(reservation);
		// 환자 번호, 의사번호, 병원번호, 예약번호를 가지고 진단서 생성
		diaService.createDia(new DiagnosisHistoryDto(reservation.getuNo(), reservation.getmNo(), reservation.gethNo(), rNo));
		
	}

	// 오늘 예약 리스트 조회
	@Override
	public ResPageResponseDto todayReservationList(Integer uNo, int curPage) {
		
		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

		int resCount = resDao.resCount(uNo); // 전체 데이터 수
		int allPage = (int) Math.ceil((double) resCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치
		
		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("uNo", uNo);
		
		MemberDto member = memberService.selectUserByNo(uNo);
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

		int resCount = resDao.resCount(uNo); // 전체 데이터 수
		int allPage = (int) Math.ceil((double) resCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치
		
		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("uNo", uNo);
		page.put("pageSize", pageSize);
		page.put("keyword", keyword);
		
		MemberDto member = memberService.selectUserByNo(uNo);
		// 현재 로그인한 회원이 의사일 경우 자신의 예약자만 보기
		if("DOCTOR".equals(member.getUserType())) {
			return new ResPageResponseDto(resDao.todayReservationMyListByKeyword(page), curPage, allPage, startPage, endPage, resCount);
		}else { // 현재 병원관리자가 로그인할 경우 모든 의사에 대한 예약 정보 보기
			return new ResPageResponseDto(resDao.todayReservationListByKeyword(page), curPage, allPage, startPage, endPage, resCount);
		}
	}

	
}
