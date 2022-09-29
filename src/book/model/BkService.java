package book.model;

import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

import book.dto.BookDTO;

@WebServlet("/bkservice")
public class BkService {

	public static void test(String usId, String usPw) {
		System.out.println(usId + usPw); 
	}

	// 도서 정보 추가 및 rentalIsbn 리턴
	public static boolean addData(BookDTO bkDTOArr) throws SQLException {
		return BookDAO.insertBooks(bkDTOArr);
	}

}