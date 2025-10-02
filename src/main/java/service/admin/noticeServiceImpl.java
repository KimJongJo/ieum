package service.admin;

import java.util.List;

import dao.admin.NoticeDao;
import dao.admin.NoticeDaoImpl;
import dto.NoticeDto;
import util.PageInfo;

public class noticeServiceImpl implements noticeService {
	private NoticeDao noticeDao;

	public noticeServiceImpl() {
		noticeDao = new NoticeDaoImpl();
	}

	@Override
	public void write(NoticeDto notice) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public NoticeDto getDetail(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
	public boolean delete(Integer dNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String getUserNm(Integer uNo) throws Exception {
		return noticeDao.selectUserNm(uNo);
	}

	

}
