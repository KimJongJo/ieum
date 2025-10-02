package dao.reservation;

import java.util.List;

import dto.ReservationDto;

public interface ReservationDao {

	List<ReservationDto> selectTime(Integer mNo, Integer rDate)throws Exception;
}
