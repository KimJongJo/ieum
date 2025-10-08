package service.myPage;

import java.util.List;

import dto.DiaryDto;
import util.PageInfo;

public interface DiaryService {
	public void write(DiaryDto diary) throws Exception;
	public DiaryDto getDetail(Integer dNo) throws Exception;
	public List<DiaryDto> getList(Integer uNo, String keyword, String sort, PageInfo page) throws Exception;
	public DiaryDto update(DiaryDto diary) throws Exception;
	public boolean delete(Integer dNo) throws Exception;
	public boolean getHisYn(Integer uNo) throws Exception;
	public DiaryDto getDate(Integer uNo, String date) throws Exception;
	public List<DiaryDto> getCalList(Integer uNo, String sDate, String eDate) throws Exception;
	public List<DiaryDto> getPatientDiaryList(Integer uNo);
}
