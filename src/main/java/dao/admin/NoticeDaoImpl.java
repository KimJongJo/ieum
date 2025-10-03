package dao.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.NoticeDto;
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
	public Integer cnt() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("selectNoticeCnt");
		}
	}

	@Override
	public List<NoticeDto> selectNoticeList(Integer uNo, String keyword, String sort, Integer row, Integer isPinned)
			throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> params = new HashMap<>();
			params.put("uNo", uNo);
			params.put("row", row);
			params.put("keyword", keyword);
			params.put("sort", sort);
			params.put("isPinned", isPinned);
			 return session.selectList("selectList", params);
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
	public void delete(Integer dNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.delete("delete", dNo);
			session.commit();
		}
	}

	@Override
	public String selectUserNm(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("selectUserNm", uNo);
		}
	}

}
