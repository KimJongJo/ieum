package service.diagnosis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.diagnosis.DiagnosisDao;
import dao.diagnosis.DiagnosisDaoImpl;
import dto.DiagnosisHistoryDto;
import dto.otherDto.DiagnosisInfoDto;
import dto.otherDto.ResPageResponseDto;

public class DiagnosisServiceImpl implements DiagnosisService {
	
	private DiagnosisDao diaDao;
	
	public DiagnosisServiceImpl() {
		diaDao = new DiagnosisDaoImpl();
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

}
