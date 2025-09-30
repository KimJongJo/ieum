package dao.hospital;

import java.util.List;

import dto.HospitalDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;

public interface HospitalDao {
	public HospitalDto select(Integer hNo) throws Exception;
	public Integer selectCount() throws Exception;
	public List<HosSearchListDto> selectList (HosSearchDto hosSearch) throws Exception;
	Integer selectListResCnt(HosSearchDto hosSearchDto) throws Exception;
}
