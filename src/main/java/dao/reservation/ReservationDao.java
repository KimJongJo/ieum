package dao.reservation;

import java.time.LocalDate;
import java.util.List;

import dto.ReservationDto;

public interface ReservationDao {

	List<ReservationDto> selectTime(Integer mNo, String rDate)throws Exception;

}
