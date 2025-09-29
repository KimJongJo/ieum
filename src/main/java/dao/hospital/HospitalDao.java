package dao.hospital;

import java.util.List;

import dto.HospitalDto;
import dto.otherDto.HosSearchDto;

public interface HospitalDao {
	public HospitalDto select(Integer hNo) throws Exception;
	public Integer selectCount() throws Exception;
	public List<HospitalDto> selectList (HosSearchDto hosSearch) throws Exception;
	
}
