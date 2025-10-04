package service.common;

import java.util.ArrayList;
import java.util.List;

import dao.common.MainDao;
import dao.common.MainDaoImpl;
import dto.HospitalDto;
import dto.otherDto.MainHosDto;

public class MainServiceImpl implements MainService {
	MainDao maindao;

	public MainServiceImpl() {
		maindao = new MainDaoImpl();

	}

	@Override
	public List<MainHosDto> getHostList() throws Exception {
	    return maindao.selectMainHosList(); // DAO에서 가져오기
	}

}
