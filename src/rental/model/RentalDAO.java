package rental.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class RentalDAO {
	public static boolean insertRental(RentalDTO rentalDTOArr) throws SQLException {
		System.out.println(rentalDTOArr);
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		
		boolean result = false;
		
		String insertQuery = "INSERT INTO TB_RENTALS (BK_ISBN, US_ID, RT_RECOMPDATE) VALUES (?, ?, null)";
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setLong(1, rentalDTOArr.getBkIsbn());
			pstmt.setString(2, rentalDTOArr.getUsId());
			count = pstmt.executeUpdate();
			
			if(count != 0) {
				result = true;
			}
			
		} finally {
			DBUtil.close(con, pstmt);
		}
		
		return result;
		
	}
}
