package service.allCommunity;

import java.util.List;

import dao.allCommunity.AllCommunityDao;
import dao.allCommunity.AllCommunityDaoImpl;
import dto.AllCommunityDto;

public class AllCommunityServiceImpl implements AllCommunityService{
		
	private AllCommunityDao allCommunityDao;
	
	public AllCommunityServiceImpl() {
		allCommunityDao = new AllCommunityDaoImpl();
	}
	
	@Override
	public List<AllCommunityDto> getAllCommunity() {
		
		return allCommunityDao.selectAllCommunityList();
	}

}
