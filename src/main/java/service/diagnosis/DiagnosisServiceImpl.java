package service.diagnosis;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.diagnosis.DiagnosisDao;
import dao.diagnosis.DiagnosisDaoImpl;
import dto.DiagnosisHistoryDto;
import dto.DiaryDto;
import dto.MemberDto;
import dto.otherDto.DiagnosisInfoDto;
import dto.otherDto.PatientDto;
import dto.otherDto.ResPageResponseDto;
import dto.otherDto.ShowDIaListToUser;
import service.member.MemberService;
import service.member.MemberServiceImpl;
import service.myPage.DiaryService;
import service.myPage.DiaryServiceImpl;

public class DiagnosisServiceImpl implements DiagnosisService {
	
	private DiagnosisDao diaDao;
	private DiaryService diaryService;
	
	public DiagnosisServiceImpl() {
		diaDao = new DiagnosisDaoImpl();
		diaryService = new DiaryServiceImpl();
	}

	// 진단서 생성
	@Override
	public void createDia(DiagnosisHistoryDto diagnosisHistoryDto) {
		diaDao.createDia(diagnosisHistoryDto);
	}

	// 진단서 임시저장
	@Override
	public void tempSave(DiagnosisHistoryDto diagnosisHistoryDto, String type) {

		// 임시저장일때
		if("temp-save".equals(type)) {
			diaDao.tempSave(diagnosisHistoryDto);
		}else { // 저장일때
			diaDao.writeCompleted(diagnosisHistoryDto);
		}
		
		
	}

	// 진료 완료
	@Override
	public void diaCompleted(Integer dNo) {
		diaDao.diaCompleted(dNo);
		
	}

	// 과거 진단 기록 가져오기
	@Override
	public ResPageResponseDto myDianosisList(Integer uNo, int curPage, String date) {
		
		
		
		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수
		
		int diaCount;
		
		// 날짜 선택을 안했을때
		if(date.equals("")) {
			diaCount = diaDao.diaCount(uNo); // 전체 데이터 수
		}else {
			Map<String, Object> datePage = new HashMap<String, Object>();
			datePage.put("uNo", uNo);
			datePage.put("date", date);
			diaCount = diaDao.diaDateCount(datePage);
		}
 
		int allPage = (int) Math.ceil((double) diaCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치
		
		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("uNo", uNo);
		
		// 날짜 선택을 안했을때
		if(date.equals("")) {
			return new ResPageResponseDto(diaDao.pastDia(page), curPage, allPage, startPage, endPage, diaCount);
		}else {
			page.put("date", date);
			return new ResPageResponseDto(diaDao.pastDateDia(page), curPage, allPage, startPage, endPage, diaCount);
		}
		
		
		
	}

	// 진단서 상세보기
	@Override
	public Map<String, Object> getDiaInfo(Integer dNo) {
		
		return diaDao.getDiaInfo(dNo);
	}

	@Override
	public ResPageResponseDto myDianosisListByKeyword(Integer curPage, String keyword, Integer uNo, String date) {
		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

		Map<String, Object> keywordPage = new HashMap<>();
		keywordPage.put("keyword", keyword);
		keywordPage.put("uNo", uNo);
		
		int diaCount;
		
		// 날짜 선택을 안했을때
		if(date.equals("")) {
			diaCount = diaDao.diaKeywordCount(keywordPage); // 전체 데이터 수
		}else {
			keywordPage.put("date", date);
			diaCount = diaDao.diaKeywordAndDateCount(keywordPage); // 전체 데이터 수
		}
		
		int allPage = (int) Math.ceil((double) diaCount / pageSize); // 전체 페이지 수
		
		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치
		
		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("uNo", uNo);
		page.put("keyword", keyword);
		
		// 날짜 선택을 안했을때
		if(date.equals("")) {
			return new ResPageResponseDto(diaDao.pastKeywordDia(page), curPage, allPage, startPage, endPage, diaCount);
		}else {
			page.put("date", date);
			return new ResPageResponseDto(diaDao.pastKeywordAndDateDia(page), curPage, allPage, startPage, endPage, diaCount);
		}
		
		
	}

	// 진단서 번호로 환자 정보, 상담내용, 진단서기록, 다이어리 기록 가져오기
	@Override
	public PatientDto getPatientDtoByDiaNo(Integer diaNo) {
		
		Map<String, Object> memberMap = diaDao.selectUserInfo(diaNo);
		Integer uNo = (Integer)memberMap.get("uNo");
		String username = (String)memberMap.get("username");
		Date birthDate = (Date)memberMap.get("birthDate");
		String gender1 = (String)memberMap.get("gender");
		String uTel = (String)memberMap.get("uTel");
		String uAddress = (String)memberMap.get("uAddress");
		
		String gender = gender1.equals("MALE") ? "남" : "여";
		MemberDto member = new MemberDto(uNo, username, birthDate, gender, uTel, uAddress);
		String rContent = (String)memberMap.get("rContent");
		
		// 진단서 기록에는 일자, 담당의사명, 진단명, 진단서 번호만 가져옴
		List<DiagnosisInfoDto> diaList = diaDao.getDiaList(diaNo);
		// 다이어리 기록을 가져오기전에 먼저 다이어리 공개 여부를 확인
		List<DiaryDto> diaryList = null;
		if((boolean)memberMap.get("diaryPrivate")) {
			diaryList = diaryService.getPatientDiaryList(uNo);
		}
		
		return new PatientDto(member, rContent, diaList, diaryList);
	}

	// 해당 환자에 대한 모든 진단서(진료한 모든 의사)
	@Override
	public PatientDto getPatientAllByDiaNo(Integer diaNo) {
		Map<String, Object> memberMap = diaDao.selectUserInfo(diaNo);
		Integer uNo = (Integer)memberMap.get("uNo");
		String username = (String)memberMap.get("username");
		Date birthDate = (Date)memberMap.get("birthDate");
		String gender1 = (String)memberMap.get("gender");
		String uTel = (String)memberMap.get("uTel");
		String uAddress = (String)memberMap.get("uAddress");
		
		String gender = gender1.equals("MALE") ? "남" : "여";
		MemberDto member = new MemberDto(uNo, username, birthDate, gender, uTel, uAddress);
		String rContent = (String)memberMap.get("rContent");
		
		// 진단서 기록에는 일자, 담당의사명, 진단명, 진단서 번호만 가져옴
		List<DiagnosisInfoDto> diaList = diaDao.getDiaAllList(diaNo);
		// 다이어리 기록을 가져오기전에 먼저 다이어리 공개 여부를 확인
		List<DiaryDto> diaryList = null;
		if((boolean)memberMap.get("diaryPrivate")) {
			diaryList = diaryService.getPatientDiaryList(uNo);
		}
		
		return new PatientDto(member, rContent, diaList, diaryList);
	}

	// 마이페이지 진단 상세
	@Override
	public ShowDIaListToUser getUserDiaDetail(Integer diaNo) {
		return diaDao.getUserDiaDetail(diaNo);
	}

	// 마이페이지 진단 이력
	@Override
	public List<ShowDIaListToUser> getUserDiaList(Integer uNo, int offset, int limit, String date) {
		
	    if(date.equals("")) { // 검색어 날짜가 없을때
	    	return diaDao.getUserDiaList(uNo, offset, limit);
	    }else { // 검색 날짜가 있을때
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("uNo", uNo);
	    	map.put("offset", offset);
	    	map.put("limit", limit);
	    	map.put("date", date);
	    	return diaDao.getUserDiaListByDate(map);
	    }
	}


	@Override
	public int getTotalCount(Integer uNo) {
		
		return diaDao.getTotalCount(uNo);
	}

	@Override
	public int getTotalCountByDate(Map<String, Object> paramMap) {
		return diaDao.getTotalCountByDate(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectAll(Integer uNo) {
		return diaDao.selectAll(uNo);
	}

	@Override
	public ShowDIaListToUser selectDiaByNo(Integer diaNo) {
		return diaDao.selectDiaByNo(diaNo);
	}



}
