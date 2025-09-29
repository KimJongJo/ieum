package dao.hospital;

import java.util.List;

import dto.HospitalDto2;
import dto.otherDto.HosSearchDto;

public interface HospitalDao {
	public HospitalDto2 select(Integer hNo) throws Exception;
	public Integer selectCount() throws Exception;
	public List<HospitalDto2> selectList (HosSearchDto hosSearch) throws Exception;
	
}
