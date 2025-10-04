package dao.common;

import java.util.List;

import dto.otherDto.MainHosDto;

public interface MainDao {
	public List<MainHosDto> selectMainHosList() throws Exception;
}
