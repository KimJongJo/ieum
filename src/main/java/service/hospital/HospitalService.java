package service.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;

import dto.MemberDto;
import dto.otherDto.HosDetailDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import dto.otherDto.HospitalPageResponseDto;
import util.PageInfo;

public interface HospitalService {
	HosDetailDto getDetail (Integer hNo) throws Exception;
	
	HosDetailDto getDocDetail (Integer hNo) throws Exception;
  
	List<HosSearchListDto> listByFilter (HosSearchDto hosSearch, PageInfo pageInfo) throws Exception;

	void addHospital(Map<String, Object> requestMap);

	HospitalPageResponseDto hosWaitList(int curPage, String filter);

	void approve(Integer hNo);

	HospitalPageResponseDto hosWaitListByKeyword(int requestPage, String keyword, String filter);

	void reject(Integer hNo);

	List<HospitalDto> joinSearchHosName(String keyword);

	boolean checkHosAuthCode(Integer hNo, String hosAuthCode);
}
