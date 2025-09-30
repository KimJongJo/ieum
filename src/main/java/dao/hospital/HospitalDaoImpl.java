package dao.hospital;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.HospitalDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
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
		return sqlsession.selectOne("mapper.hospital.selectListResCnt", hosSearchDto);
	}
	
	// 병원 신청 대기중인 병원 수
	@Override
	public int hosWaitCount() {
		return sqlsession.selectOne("hosWaitcount");
	}
	
	// 병원 신청 대기중 페이징 처리
	@Override
	public List<HospitalDto> selectWaitHos(Map<String, Integer> page) {
		
		return sqlsession.selectList("selectWaithos", page);
	}
	@Override
	public void approve(Integer hNo) {
		
		sqlsession.update("approve", hNo);
		sqlsession.commit();
		
		
	}
}
