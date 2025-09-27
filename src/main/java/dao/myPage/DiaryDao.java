package dao.myPage;

import java.util.List;

import dto.DiaryDto;

public interface DiaryDao {
	public void insert(DiaryDto diary) throws Exception;
	public DiaryDto select(Integer dNo) throws Exception;
	public Integer cnt() throws Exception;
	public List<DiaryDto> selectDiaryList(Integer row)throws Exception;
	public DiaryDto update(DiaryDto diary) throws Exception;
	public void delete(Integer dNo) throws Exception;
}
