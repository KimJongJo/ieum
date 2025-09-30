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
import dto.otherDto.HosSearchListDto;
import util.PageInfo;

public class HospitalServiceImpl implements HospitalService {
	HospitalDao hosDao;
	ApplicantDao appDao;
	
	public HospitalServiceImpl() {
		hosDao = new HospitalDaoImpl();
		appDao = new ApplicantDaoImpl();
	}

	@Override
	public List<HosSearchListDto> listByFilter(HosSearchDto hosSearch, PageInfo pageInfo) throws Exception {	
		Integer hosCnt = hosDao.selectListResCnt(hosSearch);
		pageInfo.setAllCnt(hosCnt);
		Integer allPage = (int)Math.ceil((double)hosCnt/8); 
		pageInfo.setAllPage(allPage);
		Integer offset = (pageInfo.getCurPage() - 1) * 8;
		hosSearch.setOffset(offset);
		hosSearch.setLimit(8);
		System.out.println(hosSearch);
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
