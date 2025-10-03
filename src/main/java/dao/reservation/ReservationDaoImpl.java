package dao.reservation;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ReservationDto;
import util.MybatisSqlSessionFactory;

public class ReservationDaoImpl implements ReservationDao {	
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public List<ReservationDto> selectTime(Integer mNo, String rDate) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> docTime = new HashMap<>();
			docTime.put("mNo", mNo);
			docTime.put("rDate", java.sql.Date.valueOf(rDate));
	
			return session.selectList("mapper.reservation.selectResTime",docTime);
		}
	}

}
