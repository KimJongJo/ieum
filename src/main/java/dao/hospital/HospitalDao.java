package dao.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;

public interface HospitalDao {
	public HospitalDto select(Integer hNo) throws Exception;
	public Integer selectCount() throws Exception;
	public Integer addHospital(HospitalDto hosDto);
	public List<HosSearchListDto> selectList (HosSearchDto hosSearch) throws Exception;
	Integer selectListResCnt(HosSearchDto hosSearchDto) throws Exception;
	public int hosWaitCount();
	public List<HospitalDto> selectWaitHos(Map<String, Integer> page);
	public void approve(Integer hNo);
}
