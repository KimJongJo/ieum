package dao.reservation;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ReservationDto;
import dto.otherDto.DiagnosisInfoDto;
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
	public List<ReservationInfoDto> recordRes(Map<String, Object> recPage) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectList("recordRes", recPage);
		}
	}

	//지난예약 수
	@Override
	public Integer recordResCnt(Map<String, Object> recCnt) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("recordResCnt", recCnt);
		}
	}

	@Override
	public int resCount(Map<String, Object> keywordPage) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("resCountKeyword", keywordPage);
		}
	}

	@Override
	public int resCount() {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("resCountByManager");
		}
	}

	@Override
	public int resCountByManager(Map<String, Object> keywordPage) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("resCountByManagerByKeyword", keywordPage);
		}
	}

	//예약 취소
	@Override
	public void resCancel(Integer rNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			session.selectOne("resCancel", rNo);
			session.commit();
		}
	}
	
	//예약선택
	@Override
	public ReservationDto selectRno(Integer rNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("selectRno", rNo);
			
		}
	}
	
	//진짜 예약 취소
	@Override
	public void deleteRno(Integer rNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			session.selectOne("deleteRno", rNo);
			session.commit();
			
		}
	}

	@Override
	public void resCompleted(Integer rNo) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			session.update("resCompleted", rNo);
			session.commit();
			
		}
	}

}


