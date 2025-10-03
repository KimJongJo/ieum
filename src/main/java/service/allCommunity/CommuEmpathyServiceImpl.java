package service.allCommunity;

import dao.allCommunity.CommuEmpathyDao;
import dao.allCommunity.CommuEmpathyDaoImpl;

public class CommuEmpathyServiceImpl implements CommuEmpathyService {
	private CommuEmpathyDao commuEmpathyDao;
	
	public CommuEmpathyServiceImpl() {
		commuEmpathyDao = new CommuEmpathyDaoImpl();
		
	}
	
	@Override
	public boolean commuEmpathy(int uNo, int commuNo) throws Exception {
		boolean hasEmpathy = commuEmpathyDao.checkEmpathy(uNo, commuNo);
		int delta = hasEmpathy ? -1 : 1;
		
		if(hasEmpathy) {
			commuEmpathyDao.deleteEmpathy(uNo, commuNo);
		}else {
			commuEmpathyDao.insertEmpathy(uNo, commuNo);
		}
		
		commuEmpathyDao.updateCommuEmpathy(commuNo, delta);
		
		
		return !hasEmpathy;
	}
	
	
	@Override
	public int getEmpathyCount(int commuNo) throws Exception {
	    return commuEmpathyDao.getEmpathyCount(commuNo);
	}

	@Override
	public boolean checkEmpathy(int uNo, int commuNo) throws Exception {
		return commuEmpathyDao.checkEmpathy(uNo, commuNo);
	}
}