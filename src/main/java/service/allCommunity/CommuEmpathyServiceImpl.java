package service.allCommunity;

import dao.allCommunity.CommuEmpathyDao;
import dao.allCommunity.CommuEmpathyDaoImpl;

public class CommuEmpathyServiceImpl implements CommuEmpathyService {
	private CommuEmpathyDao commuEmpathyDao;
	
	public CommuEmpathyServiceImpl() {
		commuEmpathyDao = new CommuEmpathyDaoImpl();
		
	}
	
//	@Override
//	public boolean commuEmpathy(int uNo, int commuNo) throws Exception {
//		boolean hasEmpathy = commuEmpathyDao.checkEmpathy(uNo, commuNo);
//		int delta = hasEmpathy ? -1 : 1;
//		
//		if(hasEmpathy) {
//			commuEmpathyDao.deleteEmpathy(uNo, commuNo);
//		}else {
//			commuEmpathyDao.insertEmpathy(uNo, commuNo);
//		}
//		
//		commuEmpathyDao.updateCommuEmpathy(commuNo, delta);
//		
//		
//		return !hasEmpathy;
//	}
//	
//	
//	@Override
//	public int getEmpathyCount(int commuNo) throws Exception {
//	    return commuEmpathyDao.getEmpathyCount(commuNo);
//	}
	
	
	
	

    @Override
    public boolean hasEmpathy(int uNo, int commuNo) throws Exception {
        return commuEmpathyDao.checkEmpathy(uNo, commuNo);
    }

    @Override
    public int toggleEmpathy(int uNo, int commuNo) throws Exception {
        boolean liked = commuEmpathyDao.checkEmpathy(uNo, commuNo);
        int delta = 0;

        if(liked) {
        	commuEmpathyDao.deleteEmpathy(uNo, commuNo);
            delta = -1;
        } else {
        	commuEmpathyDao.insertEmpathy(uNo, commuNo);
            delta = 1;
        }

        commuEmpathyDao.updateCommuEmpathy(commuNo, delta);

        // 최신 공감수 반환
        return commuEmpathyDao.getEmpathyCount(commuNo);
    }
}
