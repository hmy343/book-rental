package user.model;

import java.sql.SQLException;

import user.dto.UserDTO;

public class UserService {

	private static UserService instance = new UserService();
	
	private UserService() { }
	
	public static UserService getInstance() {
		return instance;
	}

	public UserDTO loginCheck(String usId, String usPw) throws SQLException {
		return UserDAO.loginCheck(usId, usPw);
	}
}
