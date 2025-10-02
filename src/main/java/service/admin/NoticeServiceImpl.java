package service.admin;

import java.util.List;

import dao.admin.NoticeDao;
import dao.admin.NoticeDaoImpl;
import dto.NoticeDto;
import util.PageInfo;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDao noticeDao;

	public NoticeServiceImpl() {
		noticeDao = new NoticeDaoImpl();
	}

	@Override
	public void write(NoticeDto notice) throws Exception {
		noticeDao.insert(notice);
	}

	@Override
	public NoticeDto getDetail(Integer nNo) throws Exception {
		return noticeDao.select(nNo);
	}

	@Override
	public List<NoticeDto> getList(Integer uNo, String keyword, String sort, PageInfo page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDto update(NoticeDto notice) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Integer nNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String getUserNm(Integer uNo) throws Exception {
		return noticeDao.selectUserNm(uNo);
	}

	

}