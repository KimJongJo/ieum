package dao.common;

import java.util.List;

import dto.otherDto.MainCommuDto;
import dto.otherDto.MainDiagnosisDto;
import dto.otherDto.MainHosDto;
import dto.otherDto.MainNoticeDto;
import dto.otherDto.MainUserDto;

public interface MainDao {
	public List<MainHosDto> selectMainHosList() throws Exception;
	public MainUserDto selectLoginInfo(Integer uNo) throws Exception;
	public List<MainDiagnosisDto> selectDiagnosis() throws Exception;
	public List<MainCommuDto> selectCommuList() throws Exception;
	public List<MainNoticeDto> selectNoticeList(Integer isPinned) throws Exception;
	public List<MainHosDto> selectMapHosList(String userLocX, String userLocY) throws Exception;
	public MainHosDto selectMapHosInfo(Integer hosNo) throws Exception;
	
}
