package dao.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.otherDto.HosInfoDto;
import dto.otherDto.HospitalDetailDto;
import dto.otherDto.HospitalSearchDto;

public interface HospitalDao {
	public HospitalDto select (Integer hNo) throws Exception;
	public HospitalDetailDto selectHosDetail(Integer hNo) throws Exception;
	public Integer selectCount() throws Exception;
	public Integer addHospital(HospitalDto hosDto);
	public List<HospitalDetailDto> selectHosList (HospitalSearchDto hosSearch) throws Exception;
	Integer selectListResCnt(HospitalSearchDto hosSearch) throws Exception;
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
	public HospitalDetailDto getHosInfo(Integer uNo);
	public void updateHosInfo(Map<String, Object> map);
	public String getHosNoByuNo(int userNo);
	public int getTotalActiveHos();
	public int getTotalInactiveHos();
}
