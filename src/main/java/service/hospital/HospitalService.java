package service.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.otherDto.HospitalDetailDto;
import dto.otherDto.HospitalPageResponseDto;
import dto.otherDto.HospitalSearchDto;
import util.PageInfo;

public interface HospitalService {
	HospitalDetailDto getDetail (Integer hNo) throws Exception;
	
	List<HospitalDetailDto> listByFilter (HospitalSearchDto hosSearch, PageInfo pageInfo) throws Exception;

	void addHospital(Map<String, Object> requestMap);

	HospitalPageResponseDto hosWaitList(int curPage, String filter);

	void approve(Integer hNo);

	HospitalPageResponseDto hosWaitListByKeyword(int requestPage, String keyword, String filter);

	void reject(Integer hNo);

	List<HospitalDto> joinSearchHosName(String keyword);

	boolean checkHosAuthCode(Integer hNo, String hosAuthCode);
}
