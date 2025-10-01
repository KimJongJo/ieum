package dao.hospital;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.HospitalDto;
import dto.otherDto.HosDetailDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import dto.otherDto.HospitalDateFormatDto;
import util.MybatisSqlSessionFactory;

public class HospitalDaoImpl implements HospitalDao {
	private SqlSession sqlsession;
	public HospitalDaoImpl() {
		sqlsession = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	@Override
	public HospitalDto select(Integer hNo) throws Exception {
		return sqlsession.selectOne("mapper.hospital.select", hNo);
	}
	
	@Override
	public HosDetailDto selectHosDetail(Integer hNo) throws Exception {
		return sqlsession.selectOne("mapper.hospital.selectHosDetail", hNo);
	}
	
	@Override
	public Integer selectCount() throws Exception {
		return sqlsession.selectOne("mapper.hospital.selectCount");
	}
	
	@Override
	public List<HosSearchListDto> selectList(HosSearchDto hosSearch) throws Exception {
		return sqlsession.selectList("mapper.hospital.selectListRes",hosSearch);
	}
  
	@Override
	public Integer addHospital(HospitalDto hosDto) {
		sqlsession.insert("addHospital", hosDto);
		sqlsession.commit();
		
		return hosDto.gethNo();
	}

	public Integer selectListResCnt(HosSearchDto hosSearchDto) throws Exception {
		try(SqlSession sqlsession = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			return sqlsession.selectOne("mapper.hospital.selectListResCnt", hosSearchDto);
		}
//		return sqlsession.selectOne("mapper.hospital.selectListResCnt", hosSearchDto);
	}
	// 병원 신청 대기중인 병원 수
	@Override
	public int hosWaitCount() {
		return sqlsession.selectOne("hosWaitcount");
	}
	
	// 병원 신청 대기중 페이징 처리
	@Override
	public List<HospitalDto> selectWaitHos(Map<String, Object> page) {
		
		return sqlsession.selectList("selectWaithos", page);
	}
	
	// 병원 승인
	@Override
	public void approve(Integer hNo) {
		
		sqlsession.update("approve", hNo);
		sqlsession.commit();
		
	}
	// 병원 거부
	@Override
	public void reject(Integer hNo) {
		
		sqlsession.update("reject", hNo);
		sqlsession.commit();
		
	}
	
	
	// 검색한 병원의 개수 반환
	@Override
	public int hosWaitCountByKeyword(String keyword) {
		
		return sqlsession.selectOne("hosWaitCountByKeyword", keyword);
	}
	@Override
	public List<HospitalDto> selectWaitHosByKeyword(Map<String, Object> page) {
		
		return sqlsession.selectList("selectWaitHosByKeyword", page);
	}
	// 회원가입 시 병원 검색
	@Override
	public List<HospitalDto> joinSearchHosName(String keyword) {
		
		return sqlsession.selectList("joinSearchHosName", keyword);
	}
	
	// 병원 인증
	@Override
	public HospitalDto checkHosAuthCode(Map<String, Object> hosMap) {
		
		return sqlsession.selectOne("checkHosAuthCode", hosMap);
	}

}
