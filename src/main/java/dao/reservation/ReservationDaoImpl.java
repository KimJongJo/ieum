package dao.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;
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

	@Override
	public Integer insertRes(ReservationDto reservation) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			System.out.println(reservation);
			session.insert("mapper.reservation.insertReservation",reservation);
			session.commit();
			return reservation.getrNo();
		}
		
	}

	// 오늘 예약 리스트 가져오기(병원관리자)
	@Override
	public List<DiagnosisInfoDto> todayReservationList(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("todayReservationList", page);
		}
	}
	
	// 오늘 예약 수 가져오기(의사)
	@Override
	public int resCount(Integer uNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("resCount", uNo);
		}
	}

	// 오늘 예약 리스트 가져오기(의사)
	@Override
	public List<DiagnosisInfoDto> todayReservationMyList(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("todayReservationMyList", page);
		}
	}

	@Override
	public Map<String, Object> selectDiaByRNo(Integer rNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("selectDiaByRNo", rNo);
		}
	}

	@Override
	public Map<String, Object> patientProfile(Integer rNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("patientProfile", rNo);
		}
	}

	@Override
	public List<DiagnosisInfoDto> todayReservationMyListByKeyword(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("todayReservationMyListByKeyword", page);
		}
	}

	@Override
	public List<DiagnosisInfoDto> todayReservationListByKeyword(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("todayReservationListByKeyword", page);
		}
	}



}
