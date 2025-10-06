package service.diagnosis;

import dao.diagnosis.DiagnosisDao;
import dao.diagnosis.DiagnosisDaoImpl;
import dto.DiagnosisHistoryDto;

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

}
