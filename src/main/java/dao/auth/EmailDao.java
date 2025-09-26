package dao.auth;

public interface EmailDao {

	void saveEmailCode(String email, String code);

}
