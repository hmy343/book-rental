package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import book.dto.RentalVO;
import util.DBUtil;

public class BookDAO {
	// 책을 대여한 유저 조회
	public static ArrayList<RentalVO> getRentalUser() throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<RentalVO> alist = null;
		String query="select TB_RENTALS.*, TB_USERS.US_GRADE, TB_BOOKS.BK_TITLE from TB_RENTALS\r\n" + 
				"join TB_USERS on TB_RENTALS.US_ID = TB_USERS.US_ID \r\n" + 
				"join TB_BOOKS on TB_RENTALS.BK_ISBN = TB_BOOKS.BK_ISBN";	
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			alist = new ArrayList<RentalVO>();
			while(rset.next()){
				alist.add(new RentalVO(rset.getLong(1),rset.getString(2),
						rset.getDate(3),rset.getDate(4),rset.getDate(5)
		 				,rset.getInt(6),rset.getString(7),rset.getString(8)));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return alist;
	}
}
