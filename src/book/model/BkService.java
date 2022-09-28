package book.model;

import java.sql.Date;

import javax.servlet.annotation.WebServlet;

import book.dto.BookDTO;

@WebServlet("/bkservice")
public class BkService {

	public static void test(String usId, String usPw) {
		System.out.println(usId + usPw);
	}

	public static void addData(BookDTO bkDTOArr) {
//		System.out.println(bkDTOArr);
		return;
	}

}