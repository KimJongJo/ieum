package service.hospital;

import java.util.HashMap;
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
import dto.otherDto.HospitalPageResponseDto;
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

	
	// 병원 등록 신청중인 병원 리스트 조횔
	@Override
	public HospitalPageResponseDto hosWaitList(int curPage) {

	    int pageSize = 8; // 한 페이지당 데이터 수
	    int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

	    int hosCount = hosDao.hosWaitCount(); // 전체 데이터 수
	    int allPage = (int) Math.ceil((double) hosCount / pageSize); // 전체 페이지 수

	    int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
	    int endPage = Math.min(startPage + blockSize - 1, allPage);   // 끝 페이지

	    int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치

	    Map<String, Integer> page = new HashMap<>();
	    page.put("offset", offset);
	    page.put("pageSize", pageSize);
	    
	    List<HospitalDto> list = hosDao.selectWaitHos(page);
	    // 데이터 + 페이지 정보 같이 반환
	    return new HospitalPageResponseDto(list, curPage, allPage, startPage, endPage, hosCount);
	}

	// 병원 승인
	@Override
	public void approve(Integer hNo) {
		
		hosDao.approve(hNo);
		
	}


}
