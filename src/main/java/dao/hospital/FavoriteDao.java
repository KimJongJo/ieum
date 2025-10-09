package dao.hospital;

import java.util.Map;

public interface FavoriteDao {
	
	void insertFav (Map<String, Object> favInfo) throws Exception;
	void deleteFav (Map<String, Object> favInfo) throws Exception;
	Integer Favorite (Map<String, Object> favInfo) throws Exception;

}
