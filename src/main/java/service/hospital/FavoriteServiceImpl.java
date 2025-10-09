package service.hospital;

import java.util.HashMap;
import java.util.Map;

import dao.hospital.FavoriteDao;
import dao.hospital.FavoriteDaoImpl;

public class FavoriteServiceImpl implements FavoriteService {
	FavoriteDao favDao;
	
	public FavoriteServiceImpl() {
		favDao = new FavoriteDaoImpl();
	}

	@Override
	public boolean isFav(Integer uNo, Integer hNo) throws Exception {
		Map<String, Object> favInfo = new HashMap<>();
		favInfo.put("uNO", uNo);
		favInfo.put("hNo", hNo);
		
		return favDao.Favorite(favInfo) >0 ;
	}

	@Override
	public void toggleFav(Integer uNo, Integer hNo) throws Exception {
		Map<String, Object> favInfo = new HashMap<>();
		favInfo.put("uNO", uNo);
		favInfo.put("hNo", hNo);
		
		if(favDao.Favorite(favInfo) > 0) {
			favDao.deleteFav(favInfo);
		}else {
			favDao.insertFav(favInfo);
		}
	}

}
