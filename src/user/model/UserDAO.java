package user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.dto.UserDTO;
import util.DBUtil;

public class UserDAO {
	// 로그인
	public static UserDTO loginCheck(String usId, String usPw) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String selectQuery = "SELECT US_ID, US_GRADE FROM TB_USERS WHERE US_ID = ? AND US_PW = ?";
		String updateQuery = "UPDATE TB_USERS SET US_ACCESS_DATE = sysdate() WHERE US_ID = ?";
		UserDTO loginUser = null;
		
		try {			
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, usId);
			pstmt.setString(2, usPw);			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new UserDTO(rset.getString("US_ID"), rset.getString("US_GRADE"));
			}
			
			// 로그인 정보가 존재하면 해당 user의 접속기록 업데이트
			if(loginUser != null) {
				pstmt = con.prepareStatement(updateQuery);
				pstmt.setString(1, usId);
				int result = pstmt.executeUpdate();
				if (result == 0) {
					return loginUser;
				}
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
			
			if(result != 0) {
				return true;
			}

		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// AD 등급 제외한 모든 유저 조회
	public static ArrayList<UserDTO> getAllUser() throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<UserDTO> alist = null;
		String query="select * from TB_USERS where TB_USERS.US_GRADE != 'AD'";	
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			alist = new ArrayList<UserDTO>();
			while(rset.next()){
				alist.add(new UserDTO(rset.getString(1),rset.getString(2),
						rset.getString(3),rset.getString(4),rset.getString(5)
		 				,rset.getInt(6),rset.getDate(7),rset.getInt(8),rset.getDate(9)
		 				,rset.getInt(10),rset.getDate(11)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return alist;
	}
	
	// id가 존재하는지 체크
//	public static String idCheck(String usId) throws SQLException {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		String result = "";
//		
//		String query = "SELECT US_ID FROM TB_USERS WHERE US_ID = ?";
//		
//		try {			
//			con = DBUtil.getConnection();
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1, usId);
//			rset = pstmt.executeQuery();
//			if(rset.next()) {
//				result = rset.getString(1);
//			}
//		} finally {
//			DBUtil.close(con, pstmt);
//		}
//		
//		return result;
//	}

}
