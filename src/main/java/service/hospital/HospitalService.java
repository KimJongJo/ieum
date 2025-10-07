package service.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.MemberDto;
import dto.otherDto.HosInfoDto;
import dto.otherDto.HospitalDetailDto;
import dto.otherDto.HospitalPageResponseDto;
import dto.otherDto.HospitalSearchDto;
import util.PageInfo;

public interface HospitalService {
	HospitalDetailDto getDetail (Integer hNo) throws Exception;
	
	List<HospitalDetailDto> listByFilter (HospitalSearchDto hosSearch, PageInfo pageInfo) throws Exception;

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

	String getHosName(Integer uNo);
}
