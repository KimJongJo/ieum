package service.hospital;

import java.util.List;

import dto.HospitalDto;
import dto.otherDto.HosSearchDto;

public interface HospitalService {
	List<HospitalDto> listByFilter (HosSearchDto hosSearch) throws Exception;
}
