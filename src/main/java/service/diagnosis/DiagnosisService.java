package service.diagnosis;

import java.util.List;
import java.util.Map;

import dto.DiagnosisHistoryDto;
import dto.otherDto.PatientDto;
import dto.otherDto.ResPageResponseDto;
import dto.otherDto.ShowDIaListToUser;

public interface DiagnosisService {

	void createDia(DiagnosisHistoryDto diagnosisHistoryDto);

	void tempSave(DiagnosisHistoryDto diagnosisHistoryDto, String type);

	void diaCompleted(Integer dNo);

	ResPageResponseDto myDianosisList(Integer uNo, int curPage, String date);

	Map<String, Object> getDiaInfo(Integer dNo);

	ResPageResponseDto myDianosisListByKeyword(Integer page, String keyword, Integer uNo, String date);

	// 이건 해당 의사에 대한 환자의 모든 진단서
	PatientDto getPatientDtoByDiaNo(Integer diaNo);

	// 이건 모든 의사에 대한 환자의 모든 진단서
	PatientDto getPatientAllByDiaNo(Integer diaNo);

	// 마이페이지에서 보여줄 진단 상세
	ShowDIaListToUser getUserDiaDetail(Integer diaNo);
	// 마이페이지에서 보여줄 진단 이력
	List<ShowDIaListToUser> getUserDiaList(Integer uNo, int offset, int limit, String date);

	int getTotalCount(Integer uNo);

	int getTotalCountByDate(Map<String, Object> paramMap);


}
