package dao.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.DiagnosisHistoryDto;
import dto.DiaryDto;
import dto.NoticeDto;
import util.MybatisSqlSessionFactory;

public class NoticeDaoImpl implements NoticeDao {

	@Override
	public void insert(NoticeDto notice) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public NoticeDto select(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer cnt() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeDto> selectNoticeList(Integer uNo, String keyword, String sort, Integer row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDto update(NoticeDto notice) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String selectUserNm(Integer uNo) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			return session.selectOne("selectUserNm", uNo);
		}
	}

	
}
