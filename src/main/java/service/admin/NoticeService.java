package service.admin;

import java.util.List;

import dto.NoticeDto;
import util.PageInfo;

public interface NoticeService {
	public void write(NoticeDto notice) throws Exception;
	public NoticeDto getDetail(Integer nNo) throws Exception;
	public List<NoticeDto> getList(Integer uNo, String keyword, String sort, PageInfo page,  Integer isPinned) throws Exception;
	public NoticeDto update(NoticeDto notice) throws Exception;
	public boolean delete(Integer nNo) throws Exception;
	public String getUserNm(Integer uNo) throws Exception;
}