package dao.diagnosis;

import java.util.List;
import java.util.Map;

import dto.DiagnosisHistoryDto;
import dto.otherDto.DiagnosisInfoDto;

public interface DiagnosisDao {

	void createDia(DiagnosisHistoryDto diagnosisHistoryDto);

	void tempSave(DiagnosisHistoryDto diagnosisHistoryDto);

	void writeCompleted(DiagnosisHistoryDto diagnosisHistoryDto);

	void diaCompleted(Integer dNo);

	int diaCount(Integer uNo);

	List<DiagnosisInfoDto> pastDia(Map<String, Object> page);

	Map<String, Object> getDiaInfo(Integer dNo);

}
