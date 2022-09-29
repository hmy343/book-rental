package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import book.dto.BookDTO;
import user.dto.UserDTO;
import util.DBUtil;

public class BookDAO {
	@SuppressWarnings("resource")
	public static boolean insertBooks(BookDTO bkDTOArr) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean result = false;
//		ArrayList<BookDTO> alist = null;
		String existIsbn = "";
		
		String selectQuery = "SELECT BK_ISBN FROM TB_BOOKS WHERE BK_ISBN = ?";
		String insertQuery = "INSERT INTO TB_BOOKS (BK_ISBN, BK_TITLE, BK_CONTENTS, BK_URL, BK_DATETIME, BK_AUTHORS, BK_PUBLISHER, BK_THUMBNAIL) VALUES (?,?,?,?,?,?,?,?) ";
		
		
		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setLong(1, bkDTOArr.getBkIsbn());
			rset = pstmt.executeQuery();
			
//			alist = new ArrayList<BookDTO>();
			
			while(rset.next()){
//				alist.add(new BookDTO(rset.getLong(1),rset.getString(2),
//						rset.getString(3),rset.getString(4),rset.getDate(5)
//		 				,rset.getString(6),rset.getString(7),rset.getString(8)));
				existIsbn = rset.getString(1);
			}
			
			System.out.println(existIsbn);
			if("".equals(existIsbn)) {
				pstmt = con.prepareStatement(insertQuery);
				pstmt.setLong(1, bkDTOArr.getBkIsbn());
				pstmt.setString(2, bkDTOArr.getBkTitle());
				pstmt.setString(3, bkDTOArr.getBkContents());
				pstmt.setString(4, bkDTOArr.getBkUrl());
				pstmt.setDate(5, bkDTOArr.getBkDateTime());
				pstmt.setString(6, bkDTOArr.getBkAuthors());
				pstmt.setString(7, bkDTOArr.getBkPublisher());
				pstmt.setString(8, bkDTOArr.getBkThumbnail());
				
				
				int count = pstmt.executeUpdate();
				if(count!=0) {
					 return true;
				 }
			}
			
		}  finally {
			DBUtil.close(con, pstmt);
		}
		
		
		return result;
	}

}
