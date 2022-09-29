package book.model;

import java.sql.SQLException;
import java.util.ArrayList;

import book.dto.RentalVO;
import book.model.BookService;
import util.DBUtil;

public class BookService {

	private static BookService instance = new BookService();
	
	public static BookService getInstance() {
		return instance;
	}
	
   public static void test(String usId, String usPw) {
      System.out.println(usId + usPw);
   }
   
   public ArrayList<RentalVO> getRentalUser() throws SQLException {
	   return BookDAO.getRentalUser();
   }

   
}