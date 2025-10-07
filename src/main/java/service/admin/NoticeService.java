package service.admin;

import java.util.List;

import dto.NoticeDto;
import dto.otherDto.OtherNoticeDto;
import util.PageInfo;

public interface NoticeService {
   public void write(NoticeDto notice) throws Exception;
   public NoticeDto getDetail(Integer nNo) throws Exception;
   public List<NoticeDto> getList(Integer uNo, String keyword, String sort, PageInfo page,  Integer isPinned) throws Exception;
   public List<NoticeDto> getSearchList(String keyword) throws Exception;
   public NoticeDto update(NoticeDto notice) throws Exception;
   public boolean delete(Integer nNo) throws Exception;
   public String getUserNm(Integer uNo) throws Exception;
   public OtherNoticeDto getOtherNo(Integer nNo, Integer uNo, String part) throws Exception;
   public Integer getSearchCnt(String keyword) throws Exception;
}