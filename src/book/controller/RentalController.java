package book.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.BookService;

@WebServlet("/admin-rental")
public class RentalController extends HttpServlet {
	private BookService service = BookService.getInstance();
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setAttribute("rentalList", service.getRentalUser());
			req.getRequestDispatcher("adRentalList.jsp").forward(req, resp);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
