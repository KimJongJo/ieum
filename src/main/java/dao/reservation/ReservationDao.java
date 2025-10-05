package dao.reservation;

import java.util.List;

import dto.ReservationDto;
import dto.otherDto.ResUserDoctorInfoDto;

public interface ReservationDao {

	List<ReservationDto> selectTime(Integer mNo, String rDate)throws Exception;
	void insertRes (ReservationDto reservation)throws Exception;
	List<ResUserDoctorInfoDto> todayReservationList();

}
