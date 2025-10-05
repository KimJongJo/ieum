package service.reservation;

import java.util.List;

import dao.reservation.ReservationDao;
import dao.reservation.ReservationDaoImpl;
import dto.ReservationDto;
import dto.otherDto.ReservationInfoDto;

public class ReservationServiceImpl implements ReservationService {

	private ReservationDao resDao;
	
	public ReservationServiceImpl() {
		resDao = new ReservationDaoImpl();
	}
	
	//예약 시간 조회
	@Override
	public List<ReservationDto> getTimeFromRes(Integer mNo, String rDate) throws Exception {
		
		return resDao.selectTime(mNo, rDate);
	}
	//예약 등록
	@Override
	public void doReservation(ReservationDto reservation) throws Exception {
		resDao.insertRes(reservation);
	}

	// 오늘 예약 리스트 조회
	@Override
	public List<ReservationDto> todayReservationList() {
		
		return resDao.todayReservationList();
	}

	// 가장 최근 예약번호
	@Override
	public Integer getLastRes(Integer uNo) throws Exception {
		
		return resDao.lastRes(uNo);
	}
	//가장 최근 예약
	@Override
	public ReservationInfoDto getNowRes(Integer uNo, Integer rNo) throws Exception {
		
		return resDao.newRes(uNo, rNo);
	}

	//의사 번호 가져오기
	@Override
	public Integer getDocMno(Integer rNo) throws Exception {
		
		return resDao.docMno(rNo);
	}

	
}
