package dao.admin;

import java.util.List;

import dto.NoticeDto;
import dto.otherDto.OtherNoticeDto;


public interface NoticeDao {
   public void insert(NoticeDto notice) throws Exception;

   public NoticeDto select(Integer nNo) throws Exception;
   
   public OtherNoticeDto selectOtherNotice(Integer nNo, Integer uNo, String part) throws Exception;

   public Integer cnt(Integer uNo, String keyword, Integer isPinned) throws Exception;

   public List<NoticeDto> selectNoticeList(Integer uNo, String keyword, String sort, Integer row, Integer topCnt,  Integer isPinned) throws Exception;

   public NoticeDto update(NoticeDto notice) throws Exception;

   public void delete(Integer dNo) throws Exception;
   
   public String selectUserNm(Integer uNo) throws Exception;
   
   public List<NoticeDto> searchNoticeList(String keyword) throws Exception;
   
   public Integer searchNoticeCnt(String keyword) throws Exception;
}
