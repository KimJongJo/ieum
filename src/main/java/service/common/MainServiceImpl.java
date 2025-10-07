package service.common;

import java.util.ArrayList;
import java.util.List;

import dao.common.MainDao;
import dao.common.MainDaoImpl;
import dto.HospitalDto;
import dto.otherDto.MainCommuDto;
import dto.otherDto.MainDiagnosisDto;
import dto.otherDto.MainHosDto;
import dto.otherDto.MainNoticeDto;
import dto.otherDto.MainUserDto;

public class MainServiceImpl implements MainService {
	MainDao maindao;

	public MainServiceImpl() {
		maindao = new MainDaoImpl();
	}

	@Override
	public List<MainHosDto> getHostList() throws Exception {
	    return maindao.selectMainHosList(); 
	}

	@Override
	public MainUserDto getLoginInfo(Integer uNo) throws Exception {
		return maindao.selectLoginInfo(uNo); 
	}

	@Override
	public List<MainDiagnosisDto> getDiagCate() throws Exception {
		return maindao.selectDiagnosis();
	}

	@Override
	public List<MainCommuDto> getCommuList() throws Exception {
		 return maindao.selectCommuList(); 
	}

	@Override
	public List<MainNoticeDto> getNoticeList() throws Exception {
		return maindao.selectNoticeList(0);
	}

	@Override
	public List<MainNoticeDto> getTopNoticeList() throws Exception {
		return maindao.selectNoticeList(1);
	}

	@Override
	public List<MainHosDto> getMapHosList(String userLocX, String userLocY) throws Exception {
		return maindao.selectMapHosList(userLocX, userLocY);
	}

	@Override
	public MainHosDto getMapHosInfo(Integer hosNo) throws Exception {
		return maindao.selectMapHosInfo(hosNo);
	}

}
