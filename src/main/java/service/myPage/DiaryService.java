package service.myPage;

import java.util.List;

import dto.DiaryDto;
import util.PageInfo;

public interface DiaryService {
	public void write(DiaryDto diary) throws Exception;
	public DiaryDto getDetail(Integer dNo) throws Exception;
	public List<DiaryDto> getList(PageInfo page) throws Exception;
	public DiaryDto update(DiaryDto diary) throws Exception;
	public boolean delete(Integer dNo) throws Exception;
}
