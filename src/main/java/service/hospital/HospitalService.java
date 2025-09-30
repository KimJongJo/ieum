package service.hospital;

import java.util.List;
import java.util.Map;

import dto.otherDto.HosSearchDto;
import dto.otherDto.HosSearchListDto;
import util.PageInfo;

public interface HospitalService {
  
	List<HosSearchListDto> listByFilter (HosSearchDto hosSearch, PageInfo pageInfo) throws Exception;
}
