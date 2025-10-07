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
	
	//예약 상세
	@Override
	public ReservationInfoDto resDetail(Integer rNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("ResDetail",rNo);
		}
	}
	
	//의사번호
	@Override
	public Integer docMno(Integer rNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("resDocMno", rNo);
		}
	}
	
	//다가오는 예약
	@Override
	public List<ReservationInfoDto> commingRes(Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("commingRes", uNo);
		}
	}

	//지난 예약
	@Override
	public List<ReservationInfoDto> recordRes(Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("recordRes", uNo);
		}
	}

}


