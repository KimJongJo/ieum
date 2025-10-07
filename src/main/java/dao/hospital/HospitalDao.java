package dao.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.otherDto.HosDetailDto;
import dto.otherDto.HosInfoDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import dto.otherDto.HospitalDateFormatDto;

public interface HospitalDao {
	public HospitalDto select (Integer hNo) throws Exception;
	public HosDetailDto selectHosDetail(Integer hNo) throws Exception;
	public HosDetailDto selectDocDetail(Integer hNo) throws Exception;
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
	public int hospitalCount(String status);
	public List<HosInfoDto> selectHospitals(Map<String, Object> page);
	public HosInfoDto hosInfo(Integer hNo);
	public int hospitalListByKeyword(Map<String, Object> keywordPage);
	public List<HosInfoDto> selectHosListByKeyword(Map<String, Object> page);
	public String getHosName(Integer uNo);
}
