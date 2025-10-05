package service.common;

import java.util.List;

import dto.otherDto.MainCommuDto;
import dto.otherDto.MainDiagnosisDto;
import dto.otherDto.MainHosDto;
import dto.otherDto.MainNoticeDto;
import dto.otherDto.MainUserDto;

public interface MainService {
	public List<MainHosDto> getHostList()  throws Exception;
	public MainUserDto getLoginInfo(Integer uNo) throws Exception;
	public List<MainDiagnosisDto> getDiagCate()  throws Exception;
	public List<MainCommuDto> getCommuList()  throws Exception;
	public List<MainNoticeDto> getNoticeList()  throws Exception;
	public List<MainNoticeDto> getTopNoticeList()  throws Exception;
	public List<MainHosDto> getMapHosList(String userLocX, String userLocY) throws Exception;
	public MainHosDto getMapHosInfo(Integer hosNo) throws Exception;
}
