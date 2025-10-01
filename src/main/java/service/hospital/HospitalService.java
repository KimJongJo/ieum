package service.hospital;

import java.util.List;
import java.util.Map;

import dto.otherDto.HosDetailDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import util.PageInfo;

public interface HospitalService {
	HosDetailDto getDetail (Integer hNm) throws Exception;
  
	List<HosSearchListDto> listByFilter (HosSearchDto hosSearch, PageInfo pageInfo) throws Exception;

	void addHospital(Map<String, Object> requestMap);
}
