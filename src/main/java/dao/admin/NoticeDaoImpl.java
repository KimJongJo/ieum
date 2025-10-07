package dao.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.NoticeDto;
import dto.otherDto.OtherNoticeDto;
import util.MybatisSqlSessionFactory;

public class NoticeDaoImpl implements NoticeDao {
   private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

   @Override
   public void insert(NoticeDto notice) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         session.insert("insertNotice", notice);
         session.commit();
      }
   }

   @Override
   public NoticeDto select(Integer nNo) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         return session.selectOne("selectNoticeDetail", nNo);
      }
   }

   @Override
   public Integer cnt(Integer uNo, String keyword, Integer isPinned) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         Map<String, Object> params = new HashMap<>();
         params.put("uNo", uNo);
         params.put("keyword", keyword);
         params.put("isPinned", isPinned);
         return session.selectOne("selectNoticeCnt", params);
      }
   }

   @Override
   public List<NoticeDto> selectNoticeList(Integer uNo, String keyword, String sort, Integer row, Integer topCnt, Integer isPinned)
         throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         Map<String, Object> params = new HashMap<>();
         params.put("uNo", uNo);
         params.put("row", row);
         params.put("topCnt", topCnt);
         params.put("keyword", keyword);
         params.put("sort", sort);
         params.put("isPinned", isPinned);
         return session.selectList("selectNoticeList", params);
      }
   }

   @Override
   public NoticeDto update(NoticeDto notice) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         session.update("updateNotice", notice);
         session.commit();
         return notice;
      }
   }

   @Override
   public void delete(Integer nNo) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         session.delete("delNotice", nNo);
         session.commit();
      }
   }

   @Override
   public String selectUserNm(Integer uNo) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         return session.selectOne("selectUserNm", uNo);
      }
   }

   @Override
   public OtherNoticeDto selectOtherNotice(Integer nNo, Integer uNo, String part) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         Map<String, Object> params = new HashMap<>();
         params.put("nNo", nNo);
         params.put("uNo", uNo);
         if (part=="prev") return session.selectOne("selectPrev", params);
         return session.selectOne("selectNext", params);
      }
      
   }

   @Override
   public List<NoticeDto> searchNoticeList(String keyword) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         Map<String, Object> params = new HashMap<>();
         params.put("keyword", keyword);
//         System.out.println("keyword" + session.selectList("searchNoticeList", params));
         return session.selectList("searchNoticeList", params);
      }
   }

   @Override
   public Integer searchNoticeCnt(String keyword) throws Exception {
      try (SqlSession session = sqlSessionFactory.openSession()) {
         Map<String, Object> params = new HashMap<>();
         params.put("keyword",keyword);
         return session.selectOne("searchNoticeCnt", params);
      }
   }

}
