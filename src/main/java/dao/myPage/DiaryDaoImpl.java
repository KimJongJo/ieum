package dao.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.DiaryDto;
import util.MybatisSqlSessionFactory;

public class DiaryDaoImpl implements DiaryDao {
	private SqlSession session;
	public DiaryDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	@Override
	public void insert(DiaryDto diary) throws Exception {
		session.insert("insert", diary);
		session.commit();
	}

	@Override
	public DiaryDto select(Integer dNo) throws Exception {
		return session.selectOne("selectDetail", dNo);
	}

	@Override
	public Integer cnt() throws Exception {
		return session.selectOne("selectCnt");
	}

	@Override
	public List<DiaryDto> selectDiaryList(Integer uNo, Integer row) throws Exception {
		Map<String, Object> params = new HashMap<>();
        params.put("uNo", uNo);
        params.put("row", row);
		return session.selectList("selectList", params);
	}

	@Override
	public DiaryDto update(DiaryDto diary) throws Exception {
		session.update("update", diary);
		session.commit();
		return diary;
	}

	@Override
	public void delete(Integer dNo) throws Exception {
		session.delete("delete", dNo);
		session.commit();		
	}

}
