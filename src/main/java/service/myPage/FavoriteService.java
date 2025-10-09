package service.myPage;

import java.util.List;
import java.util.Map;

import dto.FavoriteDto;
import dto.HospitalDto;
import dto.otherDto.HosInfoDto;
import dto.otherDto.HospitalDetailDto;
import dto.otherDto.HospitalPageResponseDto;
import dto.otherDto.HospitalSearchDto;
import util.PageInfo;

public interface FavoriteService {
	public FavoriteDto getDetail(Integer hFNo) throws Exception;

	public Integer cnt(Integer uNo) throws Exception;
	
	public void delete(Integer hFNo) throws Exception;
	
	public List<FavoriteDto> getList(PageInfo page, Integer uNo) throws Exception;
}
