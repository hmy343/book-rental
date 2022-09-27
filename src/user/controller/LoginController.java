package user.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import enumtype.UsGrade;
import user.dto.UserDTO;
import user.model.UserDAO;
import user.model.UserService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private UserService service = UserService.getInstance();

	public LoginController() {
		super();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			// 로그인 jsp 의 ID PW 정보를 받음
			String usId = req.getParameter("usId");
			String usPw = req.getParameter("usPw");
			UserDTO loginUser = service.loginCheck(usId, usPw);

			// 로그인한 사용자 정보를 세션에 저장하기 위한 세션 객체 생성
			HttpSession loginSession = req.getSession();
			loginSession.setAttribute("usId", usId);
			loginSession.setAttribute("usGrade", loginUser.getUsGrade());
			
			// 로그인한 사용자 정보가 관리자인지 일반 사용자인지에 따라 다른 요청
			if ("AD".equals(loginUser.getUsGrade())) {
				req.getRequestDispatcher("./user-list").forward(req, res);
			} else {
//				res.sendRedirect(req.getHeader("Referer"));
				req.getRequestDispatcher("main.jsp").forward(req, res);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}