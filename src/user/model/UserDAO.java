package user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.dto.UserDTO;
import util.DBUtil;

public class UserDAO {
private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	public static UserDTO loginCheck() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT US_ID, US_GRADE FROM TB_USERS WHERE US_ID = ? AND US_PW = ?";
		UserDTO loginUser = null;
		
		try {			
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new UserDTO(rset.getString("US_ID"), rset.getString("US_GRADE"));
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return loginUser;
	}
	
	public static boolean joinUs(UserDTO UserDTO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "INSERT INTO TB_USERS(US_ID, US_PW, US_EMAIL, US_PHNUM, US_GRADE, US_OVERDUE, US_JOINDATE, US_EMAILAGREE, US_BIRTHDAY, US_STATEUS, US_ACCESS_DATE) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		UserDTO loginUser = null;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
//			pstmt.setString(1, movie.getTitle());
			pstmt.setString(1, UserDTO.getUsId());
			pstmt.setString(2, UserDTO.getUsPw());
			pstmt.setString(3, UserDTO.getUsEmail());
			pstmt.setString(4, UserDTO.getUsPhnum());
			pstmt.setString(5, UserDTO.getUsGrade());
			pstmt.setInt(6, UserDTO.getUsOverdue());
			pstmt.setString(7, UserDTO.getUsId());
			pstmt.setString(8, UserDTO.getUsId());
			pstmt.setString(9, UserDTO.getUsId());
			pstmt.setString(10, UserDTO.getUsId());
			pstmt.setString(11, UserDTO.getUsId());

			
			// DB 내용 생성 : 몇개의 행이 적용 되었는지 그 반환값을 숫자로 나타냄 
			int result = pstmt.executeUpdate();
			
			if(result != 0) {
				return true;
			}

		} finally {
			// close 에 순서가 있다. 중요
			pstmt.close();	
			con.close();	
			// 2개짜리
//			MovieUtil.close(pstmt, con);
		}
		
		return false;
	}

}
