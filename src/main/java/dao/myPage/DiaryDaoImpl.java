package dao.myPage;

import java.util.List;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer cnt() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DiaryDto> selectDiaryList(Integer row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DiaryDto update(DiaryDto diary) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
