package user.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dto.UserDTO;
import user.model.UserService;

@WebServlet("/admin-user")
public class UserListController extends HttpServlet {
	private UserService service = UserService.getInstance();
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			try {
//				for (UserDTO user : service.getAllUser()) {
//					System.out.println(user);
//				}
				req.setAttribute("userList", service.getAllUser());
				req.getRequestDispatcher("adUserList.jsp").forward(req, resp);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
