package service.reservation;

import java.util.List;

import dao.reservation.ReservationDao;
import dao.reservation.ReservationDaoImpl;
import dto.ReservationDto;

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

	@Override
	public void doReservation(ReservationDto reservation) throws Exception {
		resDao.insertRes(reservation);
	}

	// 오늘 예약 리스트 조회
	@Override
	public List<ReservationDto> todayReservationList() {
		
		return resDao.todayReservationList();
	}

	
}
