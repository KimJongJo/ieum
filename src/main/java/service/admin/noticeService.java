package service.admin;

import java.util.List;

import dto.NoticeDto;
import util.PageInfo;

public interface noticeService {
	public void write(NoticeDto notice) throws Exception;
	public NoticeDto getDetail(Integer dNo) throws Exception;
	public List<NoticeDto> getList(Integer uNo, String keyword, String sort, PageInfo page) throws Exception;
	public NoticeDto update(NoticeDto notice) throws Exception;
	public boolean delete(Integer dNo) throws Exception;
	public String getUserNm(Integer uNo) throws Exception;
}
