package service.reservation;

import java.util.List;
import java.util.Map;

import dao.reservation.ReservationDao;
import dao.reservation.ReservationDaoImpl;
import dto.DiagnosisHistoryDto;
import dto.MemberDto;
import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;
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
	public List<DiagnosisInfoDto> todayReservationList(Integer uNo) {
		
		MemberDto member = memberService.selectUserByNo(uNo);
		// 현재 로그인한 회원이 의사일 경우 자신의 예약자만 보기
		if("DOCTOR".equals(member.getUserType())) {
			return resDao.todayReservationMyList(uNo);
		}else { // 현재 병원관리자가 로그인할 경우 모든 의사에 대한 예약 정보 보기
			return resDao.todayReservationList();
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

	
}
