package dao.myPage;

import java.util.List;

import dto.DiagnosisHistoryDto;
import dto.DiaryDto;

public interface DiaryDao {
	public void insert(DiaryDto diary) throws Exception;

	public DiaryDto select(Integer dNo) throws Exception;

	public Integer cnt() throws Exception;

	public List<DiaryDto> selectDiaryList(Integer uNo, String keyword, String sort, Integer row) throws Exception;

	public DiaryDto update(DiaryDto diary) throws Exception;

	public void delete(Integer dNo) throws Exception;

	public List<DiagnosisHistoryDto> selectHisList(Integer uNo) throws Exception;
	
	public DiaryDto selectDate (Integer uNo, String date) throws Exception;
	
	public List<DiaryDto> selectCalList(Integer uNo, String sDate, String eDate) throws Exception;

	public List<DiaryDto> selectPatientDiaryList(Integer uNo);
}
