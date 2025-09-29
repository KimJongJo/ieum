package dao.hospital;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.HospitalDto2;
import dto.otherDto.HosSearchDto;
import util.MybatisSqlSessionFactory;

public class HospitalDaoImpl implements HospitalDao {
	private SqlSession sqlsession;
	public HospitalDaoImpl() {
		sqlsession = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	@Override
	public HospitalDto2 select(Integer hNo) throws Exception {
		return sqlsession.selectOne("mapper.hospital.select", hNo);
	}
	@Override
	public Integer selectCount() throws Exception {
		return sqlsession.selectOne("mapper.hospital.selectCount");
	}
	@Override
	public List<HospitalDto2> selectList(HosSearchDto hosSearch) throws Exception {
		return sqlsession.selectList("mapper.hospital.selectListRes",hosSearch);
	}


}
