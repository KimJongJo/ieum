package service.hospital;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.applicant.ApplicantDao;
import dao.applicant.ApplicantDaoImpl;
import dao.hospital.HospitalDao;
import dao.hospital.HospitalDaoImpl;
import dao.member.MemberDao;
import dto.ApplicantDto;
import dto.HospitalDto;
import dto.otherDto.HospitalDetailDto;
import dto.otherDto.HospitalPageResponseDto;
import dto.otherDto.HospitalSearchDto;
import util.PageInfo;

public class HospitalServiceImpl implements HospitalService {
	HospitalDao hosDao;
	ApplicantDao appDao;
	MemberDao memDao;

	public HospitalServiceImpl() {
		hosDao = new HospitalDaoImpl();
		appDao = new ApplicantDaoImpl();
		
	}

	@Override
	public List<HospitalDetailDto> listByFilter(HospitalSearchDto hosSearch, PageInfo pageInfo) throws Exception {

		// 병원목록 필터 조회
		Integer hosCnt = hosDao.selectListResCnt(hosSearch);
		pageInfo.setAllCnt(hosCnt);
		Integer allPage = (int) Math.ceil((double) hosCnt / 8);
		pageInfo.setAllPage(allPage);
		Integer offset = (pageInfo.getCurPage() - 1) * 8;
		hosSearch.setOffset(offset);
		hosSearch.setLimit(8);
		return hosDao.selectHosList(hosSearch);
	}

	@Override
	public void addHospital(Map<String, Object> requestMap) {

		// 병원을 등록하고 등록한 병원의 번호를 가져와서 신청자 테이블에서 생성
		HospitalDto hosDto = (HospitalDto) requestMap.get("hosDto");
		ApplicantDto appDto = (ApplicantDto) requestMap.get("appDto");

		Integer hosNo = hosDao.addHospital(hosDto);

		appDto.sethNo(hosNo);
		appDao.addApplicant(appDto);

	}

	// 병원 등록 신청중인 병원 리스트 조회
	@Override
	public HospitalPageResponseDto hosWaitList(int curPage, String filter) {

		String sort;
		// 신청일(최신순)일 경우
		if ("created_young".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("created_young") || filter.equals("created_old")) {
			sortValue = "h_created";
		} else if (filter.equals("none")) {
			sortValue = "h_no";
		} else {
			sortValue = "h_nm";
		}

		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

		int hosCount = hosDao.hosWaitCount(); // 전체 데이터 수
		int allPage = (int) Math.ceil((double) hosCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("sort", sort);
		page.put("sortValue", sortValue);

		List<HospitalDto> list = hosDao.selectWaitHos(page);
		// 데이터 + 페이지 정보 같이 반환
		return new HospitalPageResponseDto(list, curPage, allPage, startPage, endPage, hosCount);
	}

	// 병원 승인
	@Override
	public void approve(Integer hNo) {

		hosDao.approve(hNo);

	}

	// 병원 거부
	@Override
	public void reject(Integer hNo) {

		hosDao.reject(hNo);
	}

	// 검색해서 가져오는 병원 등록 리스트
	@Override
	public HospitalPageResponseDto hosWaitListByKeyword(int curPage, String keyword, String filter) {

		String sort;
		// 신청일(최신순)일 경우
		if ("created_young".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("created_young") || filter.equals("created_old")) {
			sortValue = "h_created";
		} else if (filter.equals("none")) {
			sortValue = "h_no";
		} else {
			sortValue = "h_nm";
		}

		int pageSize = 8;
		int blockSize = 5;

		int hosCount = hosDao.hosWaitCountByKeyword(keyword); // 검색어 기준 총 개수
		int allPage = (int) Math.ceil((double) hosCount / pageSize);

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, allPage);

		int offset = (curPage - 1) * pageSize;

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("keyword", keyword); // 검색어 전달
		page.put("sort", sort);
		page.put("sortValue", sortValue);

		List<HospitalDto> list = hosDao.selectWaitHosByKeyword(page);

		return new HospitalPageResponseDto(list, curPage, allPage, startPage, endPage, hosCount);
	}

	// 병원 디테일정보 가져오기
	@Override
	public HospitalDetailDto getDetail(Integer hNo) throws Exception {

		return hosDao.selectHosDetail(hNo);
	}


	// 관리자 회원가입 시 병원 이름 가져오기
	@Override
	public List<HospitalDto> joinSearchHosName(String keyword) {
		
		return hosDao.joinSearchHosName(keyword);
	}

	
	// 병원 인증
	@Override
	public boolean checkHosAuthCode(Integer hNo, String hosAuthCode) {
		
		Map<String, Object> hosMap = new HashMap<String, Object>();
		hosMap.put("hNo", hNo);
		hosMap.put("hosAuthCode", hosAuthCode);
		
		HospitalDto hosDto = hosDao.checkHosAuthCode(hosMap);
		if(hosDto == null) return false;
		return true;
	}

}
