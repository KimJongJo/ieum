package service.hospital;

import java.util.List;

import dto.HospitalDto2;
import dto.otherDto.HosSearchDto;

public interface HospitalService {
	List<HospitalDto2> listByFilter (HosSearchDto hosSearch) throws Exception;
}
