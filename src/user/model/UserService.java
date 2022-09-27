package user.model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	public boolean joinUser(UserDTO UserDTO) throws SQLException {
		return UserDAO.joinUser(UserDTO);
	}
	
	public ArrayList<UserDTO> getAllUser() throws SQLException{
		return UserDAO.getAllUser();
	}
	
}
