package service.hospital;

import java.util.List;

import dao.hospital.HospitalDao;
import dao.hospital.HospitalDaoImpl;
import dto.HospitalDto;
import dto.otherDto.HosSearchDto;

public class HospitalServiceImpl implements HospitalService {
	HospitalDao hosDao = new HospitalDaoImpl();

	@Override
	public List<HospitalDto> listByFilter(HosSearchDto hosSearch) throws Exception {	
		return hosDao.selectList(hosSearch);
	}


}
