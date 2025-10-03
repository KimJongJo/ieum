package service.reservation;

import java.time.LocalDate;
import java.util.List;

import dao.reservation.ReservationDao;
import dao.reservation.ReservationDaoImpl;
import dto.ReservationDto;

public class ReservationServiceImpl implements ReservationService {

	private ReservationDao reservationDao;
	
	public ReservationServiceImpl() {
		reservationDao = new ReservationDaoImpl();
	}
	
	//예약 시간 조회
	@Override
	public List<ReservationDto> getTimeFromRes(Integer mNo, String rDate) throws Exception {
		
		return reservationDao.selectTime(mNo, rDate);
	}

	
}
