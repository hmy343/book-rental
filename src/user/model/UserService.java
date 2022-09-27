package user.model;

import java.sql.SQLException;

import exception.NotExistException;
import user.dto.UserDTO;

public class UserService {

	private static UserService instance = new UserService();
	
	private UserService() { }
	
	public static UserService getInstance() {
		return instance;
	}

	// 로그인
	public UserDTO loginCheck(String usId, String usPw) throws SQLException {
		return UserDAO.loginCheck(usId, usPw);
	}
	
	// 회원가입
	public boolean joinUser(UserDTO UserDTO) throws SQLException {
		// 해당 아이디가 존재하는지 확인
		return UserDAO.joinUser(UserDTO);
	}
	
	// id 존재 여부 확인
	public void idCheck(String usId) throws NotExistException, SQLException {
		if(UserDAO.idCheck(usId) != null) {
			throw new NotExistException();
		}
	}
	
}
