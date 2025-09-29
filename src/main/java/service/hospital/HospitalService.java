package service.hospital;

import java.util.List;
import java.util.Map;

import dto.HospitalDto;
import dto.otherDto.HosSearchDto;

public interface HospitalService {
	List<HospitalDto> listByFilter (HosSearchDto hosSearch) throws Exception;

	void addHospital(Map<String, Object> requestMap);
}
