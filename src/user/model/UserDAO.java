package user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.xml.internal.messaging.saaj.packaging.mime.util.QEncoderStream;

import user.dto.UserDTO;
import util.DBUtil;

public class UserDAO {
	// 로그인
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

			if (rset.next()) {
				loginUser = new UserDTO(rset.getString("US_ID"), rset.getString("US_GRADE"));
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return loginUser;
	}

	// 회원가입
	public static boolean joinUser(UserDTO UserDTO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		String query = "INSERT INTO TB_USERS(US_ID, US_PW, US_EMAIL, US_PHNUM, US_BIRTHDAY, US_EMAILAGREE) VALUES(?, ?, ?, ?, ?, ?)";

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, UserDTO.getUsId());
			pstmt.setString(2, UserDTO.getUsPw());
			pstmt.setString(3, UserDTO.getUsEmail());
			pstmt.setString(4, UserDTO.getUsPhnum());
			pstmt.setDate(5, UserDTO.getUsBirtyDay());
			pstmt.setInt(6, UserDTO.getUsEmailAgree());
			// default 값은 없어도 됨
			int result = pstmt.executeUpdate();

			if (result != 0) {
				return true;
			}

		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	public static String idCheck(String usId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = "";
		
		String query = "SELECT US_ID FROM TB_USERS WHERE US_ID = ?";
		
		try {			
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, usId);
			while(rset.next()) {
				result = rset.getString(1);
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		
		return result;
	}

}
