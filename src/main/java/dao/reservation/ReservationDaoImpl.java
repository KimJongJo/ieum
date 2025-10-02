package dao.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.ReservationDto;
import util.MybatisSqlSessionFactory;

public class ReservationDaoImpl implements ReservationDao {
	private SqlSession session;
	
	ReservationDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}

	@Override
	public List<ReservationDto> selectTime(Integer mNo, Integer rDate) throws Exception {
		Map<String,Object> docDate = new HashMap<>();
		docDate.put("mNo", mNo);
		docDate.put("rDate", rDate);
		return session.selectList("selectResTime",docDate);
	}

	
}
