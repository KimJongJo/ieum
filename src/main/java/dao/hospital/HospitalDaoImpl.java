package dao.hospital;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.HospitalDto;
import dto.otherDto.HosDetailDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import util.MybatisSqlSessionFactory;

public class HospitalDaoImpl implements HospitalDao {
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public HospitalDto select(Integer hNo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("mapper.hospital.select", hNo);
		}
	}
	
	@Override
	public HosDetailDto selectHosDetail(Integer hNo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("mapper.hospital.selectHosDetail", hNo);
		}
	}
	
	@Override
	public HosDetailDto selectDocDetail(Integer hNo) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("mapper.hospital.selectHosDetailDoc", hNo);
		}
	}
	
	@Override
	public Integer selectCount() throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("mapper.hospital.selectCount");
		}
	}
	
	@Override
	public List<HosSearchListDto> selectList(HosSearchDto hosSearch) throws Exception {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectList("mapper.hospital.selectListRes",hosSearch);
		}
	}
  
	@Override
	public Integer addHospital(HospitalDto hosDto) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			sqlsession.insert("addHospital", hosDto);
			sqlsession.commit();
			return hosDto.gethNo();
		}
	}

	public Integer selectListResCnt(HosSearchDto hosSearchDto) throws Exception {
		try(SqlSession sqlsession = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			return sqlsession.selectOne("mapper.hospital.selectListResCnt", hosSearchDto);
		}

	}
	// 병원 신청 대기중인 병원 수
	@Override
	public int hosWaitCount() {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("hosWaitcount");
		}
	}
	
	// 병원 신청 대기중 페이징 처리
	@Override
	public List<HospitalDto> selectWaitHos(Map<String, Object> page) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {	
			return sqlsession.selectList("selectWaithos", page);
    }
	}
	
	// 병원 승인
	@Override
	public void approve(Integer hNo) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {		
			sqlsession.update("approve", hNo);
			sqlsession.commit();
		}		
	}
	// 병원 거부
	@Override
	public void reject(Integer hNo) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {		
			sqlsession.update("reject", hNo);
			sqlsession.commit();
		}		
	}
	
	
	// 검색한 병원의 개수 반환
	@Override
	public int hosWaitCountByKeyword(String keyword) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {	
			return sqlsession.selectOne("hosWaitCountByKeyword", keyword);
		}
	}
	@Override
	public List<HospitalDto> selectWaitHosByKeyword(Map<String, Object> page) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectList("selectWaitHosByKeyword", page);
		}
	}
	// 회원가입 시 병원 검색
	@Override
	public List<HospitalDto> joinSearchHosName(String keyword) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {		
			return sqlsession.selectList("joinSearchHosName", keyword);
		}
	}
	
	// 병원 인증
	@Override
	public HospitalDto checkHosAuthCode(Map<String, Object> hosMap) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {		
			return sqlsession.selectOne("checkHosAuthCode", hosMap);
		}
	}
}
