package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import book.dto.BookDTO;
import user.dto.UserDTO;
import util.DBUtil;

import book.dto.RentalVO;

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
	// 책을 대여한 유저 조회
	public static ArrayList<RentalVO> getRentalUser() throws SQLException{
		Connection con = null;	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<RentalVO> alist = null;
//		String query="select TB_RENTALS.*, TB_USERS.US_GRADE, TB_BOOKS.BK_TITLE from TB_RENTALS\r\n" + 
//				"join TB_USERS on TB_RENTALS.US_ID = TB_USERS.US_ID \r\n" + 
//				"join TB_BOOKS on TB_RENTALS.BK_ISBN = TB_BOOKS.BK_ISBN";
		// TB_RENTAL, TB_USERS, TB_BOOKS 테이블 사용
		String query="select rt.*, us.US_GRADE, bk.BK_TITLE from TB_RENTALS as rt\r\n" + 
				"join TB_USERS as us on rt.US_ID = us.US_ID \r\n" + 
				"join TB_BOOKS as bk on rt.BK_ISBN = bk.BK_ISBN";	
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			alist = new ArrayList<RentalVO>();
			while(rset.next()){
				// 
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
