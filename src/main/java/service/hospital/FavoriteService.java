package service.hospital;

public interface FavoriteService {
	
	boolean isFav (Integer uNo, Integer hNo) throws Exception;
	void toggleFav (Integer uNo, Integer hNo) throws Exception;
	

}
