package dao.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ReservationDto;
import dto.otherDto.ReservationInfoDto;
import util.MybatisSqlSessionFactory;

public class ReservationDaoImpl implements ReservationDao {	
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	//예약 시간선택
	@Override
	public List<ReservationDto> selectTime(Integer mNo, String rDate) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> docTime = new HashMap<>();
			docTime.put("mNo", mNo);
			docTime.put("rDate", java.sql.Date.valueOf(rDate));
	
			return session.selectList("mapper.reservation.selectResTime",docTime);
		}
	}
	
	//예약 등록
	@Override
	public void insertRes(ReservationDto reservation) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("mapper.reservation.insertReservation",reservation);
			session.commit();
		}
		
	}

	// 오늘 예약 리스트 가져오기
	@Override
	public List<ReservationDto> todayReservationList() {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("todayReservationList");
		}
	}

	//가장 최근예약 번호
	@Override
	public Integer lastRes(Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("latestRes", uNo);
		}
	}
	
	//새예약
	@Override
	public ReservationInfoDto newRes(Integer uNo, Integer rNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> neewRes = new HashMap<>();
			neewRes.put("uNo", uNo);
			neewRes.put("rNo", rNo);
	
			return session.selectOne("mapper.reservation.newRes",neewRes);
		}
	}

	@Override
	public Integer docMno(Integer rNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("resDocMno", rNo);
		}
	}

}


