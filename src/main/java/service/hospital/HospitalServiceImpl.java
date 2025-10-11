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
import dto.otherDto.HosInfoDto;
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
	public HospitalDetailDto getDetail(Integer hNo, Integer uNo) throws Exception {
		Map<String, Object> hosFav = new HashMap<>();
		hosFav.put("hNo", hNo);
		hosFav.put("uNo", uNo);

		return hosDao.selectHosDetail(hosFav);
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

	// 병원 관리 -> 병원 목록 조회
	@Override
	public HospitalPageResponseDto<HosInfoDto> hosList(int curPage, String filter, String status) {
		String sort;
		// 신청일(최신순)일 경우
		if ("h_created".equals(filter) || "h_updated".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("h_created")) {
			sortValue = "h_created";
		} else if (filter.equals("h_updated")) {
			sortValue = "h_updated";
		} else if(filter.equals("h_nm")){
			sortValue = "h_nm";
		} else if(filter.equals("h_address")) {
			sortValue = "h_address";
		} else if(filter.equals("category_no")) {
			sortValue = "category_no";
		} else {
			sortValue = "h_no";
		}

		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

		int hosCount = hosDao.hospitalCount(status); // 전체 데이터 수
		int allPage = (int) Math.ceil((double) hosCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("sort", sort);
		page.put("sortValue", sortValue);
		page.put("status", status);
		
		

		List<HosInfoDto> list = hosDao.selectHospitals(page);
		// 데이터 + 페이지 정보 같이 반환
		return new HospitalPageResponseDto<HosInfoDto>(list, curPage, allPage, startPage, endPage, hosCount);
	}

	// 병원 번호를 받아와서 해당 병원 정보 반환
	@Override
	public HosInfoDto hosInfo(Integer hNo) {
		return hosDao.hosInfo(hNo);
	}

	// 키워드가 있을때 병원 정보 조회 리스트
	@Override
	public HospitalPageResponseDto<HosInfoDto> hosListByKeyword(Integer curPage, String keyword, String filter,
			String status) {
		String sort;
		// 신청일(최신순)일 경우
		if ("h_created".equals(filter) || "h_updated".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("h_created")) {
			sortValue = "h_created";
		} else if (filter.equals("h_updated")) {
			sortValue = "h_updated";
		} else if(filter.equals("h_nm")){
			sortValue = "h_nm";
		} else if(filter.equals("h_address")) {
			sortValue = "h_address";
		} else if(filter.equals("category_no")) {
			sortValue = "category_no";
		} else {
			sortValue = "h_no";
		}
		
		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수
		
		Map<String, Object> keywordPage = new HashMap<String, Object>();
		keywordPage.put("keyword", keyword);
		keywordPage.put("status", status);

		int hosCount = hosDao.hospitalListByKeyword(keywordPage); // 전체 데이터 수
		int allPage = (int) Math.ceil((double) hosCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("sort", sort);
		page.put("sortValue", sortValue);
		page.put("status", status);
		page.put("keyword", keyword);
		
		
		List<HosInfoDto> list = hosDao.selectHosListByKeyword(page);
		
		// 데이터 + 페이지 정보 같이 반환
		return new HospitalPageResponseDto<HosInfoDto>(list, curPage, allPage, startPage, endPage, hosCount);
	}

	// 의사, 병원관리자 번호를 가지고 소속 병원 이름 가져오기
	@Override
	public String getHosName(Integer uNo) {
		return hosDao.getHosName(uNo);
	}

	// 유저가 소속된 병원의 정보
	@Override
	public HospitalDetailDto getHosInfo(Integer uNo) {
		return hosDao.getHosInfo(uNo);
	}

	@Override
	public void updateHosInfo(Map<String, Object> map) {
		hosDao.updateHosInfo(map);
		
	}

	@Override
	public String getHosNoByuNo(int userNo) {
		return hosDao.getHosNoByuNo(userNo);
	}

	@Override
	public int getTotalActiveHos() {
		return hosDao.getTotalActiveHos();
	}

	@Override
	public int getTotalInactiveHos() {
		return hosDao.getTotalInactiveHos();
	}

}
