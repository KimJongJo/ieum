package service.allCommunity;

import dao.allCommunity.CommentEmpathyDao;
import dao.allCommunity.CommentEmpathyDaoImpl;

public class CommentEmpathyServiceImpl implements CommentEmpathyService{
	
	private CommentEmpathyDao commentEmpathyDao;
	
	public CommentEmpathyServiceImpl() {
		commentEmpathyDao = new CommentEmpathyDaoImpl();
	}
	
	@Override
	public boolean commentEmpathy(int uNo, int commeNo) throws Exception {
		boolean hasCommeEmpathy = commentEmpathyDao.ckeckCommeEmpathy(uNo, commeNo);
		
		int delta = hasCommeEmpathy ? -1 : 1;
		
		if(hasCommeEmpathy) {
			commentEmpathyDao.deleteCommeEmpathy(uNo, commeNo);
		}else {
			commentEmpathyDao.insertCommeEmpathy(uNo, commeNo);
		}
		
		commentEmpathyDao.updateCommeEmpathy(commeNo, delta);
		
		return !hasCommeEmpathy;
	}

	@Override
	public int getCommentEmpathyCount(int commeNo) throws Exception {
		return commentEmpathyDao.getCommeEmpathyCount(commeNo);
	}

	@Override
	public boolean checkEmpathy(int uNo, int commeNo) throws Exception {
		
		return commentEmpathyDao.ckeckCommeEmpathy(uNo, commeNo);
	}

}
