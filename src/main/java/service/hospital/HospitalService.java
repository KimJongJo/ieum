package service.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;

import dto.MemberDto;
import dto.otherDto.HosDetailDto;
import dto.otherDto.HosInfoDto;
import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import dto.otherDto.HospitalPageResponseDto;
import util.PageInfo;

public interface HospitalService {
	HosDetailDto getDetail (Integer hNo) throws Exception;
	
	HosDetailDto getDocDetail (Integer hNo) throws Exception;
  
	List<HosSearchListDto> listByFilter (HosSearchDto hosSearch, PageInfo pageInfo) throws Exception;

	void addHospital(Map<String, Object> requestMap);

	HospitalPageResponseDto<HospitalDto> hosWaitList(int curPage, String filter);

	void approve(Integer hNo);

	HospitalPageResponseDto<HospitalDto> hosWaitListByKeyword(int requestPage, String keyword, String filter);

	void reject(Integer hNo);

	List<HospitalDto> joinSearchHosName(String keyword);

	boolean checkHosAuthCode(Integer hNo, String hosAuthCode);

	HospitalPageResponseDto<HosInfoDto> hosList(int curPage, String filter, String status);

	HosInfoDto hosInfo(Integer hNo);

	HospitalPageResponseDto<HosInfoDto> hosListByKeyword(Integer page, String keyword, String filter, String status);
}
