package dao.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.otherDto.HosDetailDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import dto.otherDto.HospitalDateFormatDto;

public interface HospitalDao {
	public HospitalDto select (Integer hNo) throws Exception;
	public HosDetailDto selectHosDetail(Integer hNo) throws Exception;
	public Integer selectCount() throws Exception;
	public Integer addHospital(HospitalDto hosDto);
	public List<HosSearchListDto> selectList (HosSearchDto hosSearch) throws Exception;
	Integer selectListResCnt(HosSearchDto hosSearchDto) throws Exception;
	public int hosWaitCount();
	public List<HospitalDto> selectWaitHos(Map<String, Object> page);
	public void approve(Integer hNo);
	public int hosWaitCountByKeyword(String keyword);
	public List<HospitalDto> selectWaitHosByKeyword(Map<String, Object> page);
	public void reject(Integer hNo);
	public List<HospitalDto> joinSearchHosName(String keyword);
	public HospitalDto checkHosAuthCode(Map<String, Object> hosMap);
}
