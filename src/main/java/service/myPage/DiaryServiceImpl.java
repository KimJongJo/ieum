package service.myPage;

import java.util.List;

import dao.myPage.DiaryDao;
import dao.myPage.DiaryDaoImpl;
import dto.DiaryDto;
import util.PageInfo;

public class DiaryServiceImpl implements DiaryService {
	private DiaryDao diaryDao;
	public DiaryServiceImpl() {
		diaryDao = new DiaryDaoImpl();
	}
	@Override
	public void write(DiaryDto diary) throws Exception {
		try {
			diaryDao.insert(diary);
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}

	@Override
	public DiaryDto getDetail(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DiaryDto> getList(PageInfo page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DiaryDto update(DiaryDto diary) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
