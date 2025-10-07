package service.diagnosis;

import java.util.Map;

import dto.DiagnosisHistoryDto;
import dto.otherDto.ResPageResponseDto;

public interface DiagnosisService {

	void createDia(DiagnosisHistoryDto diagnosisHistoryDto);

	void tempSave(DiagnosisHistoryDto diagnosisHistoryDto, String type);

	void diaCompleted(Integer dNo);

	ResPageResponseDto myDianosisList(Integer uNo, int curPage);

	Map<String, Object> getDiaInfo(Integer dNo);

}
