package dao.admin;

import java.util.List;

import dto.NoticeDto;


public interface NoticeDao {
	public void insert(NoticeDto notice) throws Exception;

	public NoticeDto select(Integer dNo) throws Exception;

	public Integer cnt() throws Exception;

	public List<NoticeDto> selectNoticeList(Integer uNo, String keyword, String sort, Integer row,  Integer isPinned) throws Exception;

	public NoticeDto update(NoticeDto notice) throws Exception;

	public void delete(Integer dNo) throws Exception;
	
	public String selectUserNm(Integer uNo) throws Exception;
}
