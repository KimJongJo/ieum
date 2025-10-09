package dao.myPage;

import java.util.List;

import dto.DiagnosisHistoryDto;
import dto.DiaryDto;
import dto.FavoriteDto;

public interface FavoriteDao {
	public FavoriteDto select(Integer hFNo) throws Exception;

	public Integer cnt(Integer uNo) throws Exception;
	
	public void delete(Integer hFNo) throws Exception;
	
	public List<FavoriteDto> selectFavList(Integer row, Integer uNo) throws Exception;
}
