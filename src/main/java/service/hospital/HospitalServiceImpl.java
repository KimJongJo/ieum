package service.hospital;

import java.util.List;
import java.util.Map;

import dao.applicant.ApplicantDao;
import dao.applicant.ApplicantDaoImpl;
import dao.hospital.HospitalDao;
import dao.hospital.HospitalDaoImpl;
import dto.ApplicantDto;
import dto.HospitalDto;
import dto.otherDto.HosSearchDto;

public class HospitalServiceImpl implements HospitalService {
	HospitalDao hosDao;
	ApplicantDao appDao;
	
	public HospitalServiceImpl() {
		hosDao = new HospitalDaoImpl();
		appDao = new ApplicantDaoImpl();
	}

	@Override
	public List<HospitalDto> listByFilter(HosSearchDto hosSearch) throws Exception {	
		return hosDao.selectList(hosSearch);
	}

	@Override
	public void addHospital(Map<String, Object> requestMap) {
		
		// 병원을 등록하고 등록한 병원의 번호를 가져와서 신청자 테이블에서 생성
		HospitalDto hosDto = (HospitalDto)requestMap.get("hosDto");
		ApplicantDto appDto = (ApplicantDto)requestMap.get("appDto");
		
		Integer hosNo = hosDao.addHospital(hosDto);
		
		System.out.println(hosNo);
		
		appDto.sethNo(hosNo);
		appDao.addApplicant(appDto);
		
	}


}
