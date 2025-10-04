package service.common;

import java.util.List;

import dto.otherDto.MainHosDto;

public interface MainService {
	public List<MainHosDto> getHostList()  throws Exception;
	
}
