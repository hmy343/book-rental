package user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.dto.UserDTO;
import util.DBUtil;

public class UserDAO {
	// 입력 id, pw가 db에 있는지 확인
	public static UserDTO loginCheck(String usId, String usPw) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT US_ID, US_GRADE FROM TB_USERS WHERE US_ID = ? AND US_PW = ?";
		UserDTO loginUser = null;
		
		try {			
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, usId);
			pstmt.setString(2, usPw);			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new UserDTO(rset.getString("US_ID"), rset.getString("US_GRADE"));
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return loginUser;
	}

}
