package user.model;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import exception.ExistUserException;
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
	public boolean joinUser(UserDTO UserDTO) throws SQLException, ExistUserException {
		// 해당 아이디가 존재하는지 확인
		return UserDAO.joinUser(UserDTO);
	}
	
	// 관리자 제외한 전체 회원 검색
	public ArrayList<UserDTO> getAllUser() throws SQLException{
		return UserDAO.getAllUser();
	}
	
	// id 존재 여부 확인
	public boolean idCheck(String checkUsId) throws ExistUserException, SQLException {
			
		if(UserDAO.idCheck(checkUsId) == null) {
			
			return true;
		}
		
		return false;
	}
	
	// grade 수정
	public boolean updateGrade(String userId, String updateGrade) throws SQLException {
		
		return UserDAO.userGradeUpdate(userId, updateGrade);
	}
	
	
}
