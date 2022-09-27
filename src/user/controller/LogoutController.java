package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession loginSession = req.getSession();
		
		// 로그인한 사용자가 admin이라면 admin페이지에 대한 권한이 없기때문에 main화면으로 전환해주기 위해
		// 세션 무효화전에 grade에 대한 정보를 담는 것!!
		String loginGrade = (String) loginSession.getAttribute("usGrade");
		loginSession.invalidate();
		loginSession = null;
		if (loginGrade.equals("AD")) {
			res.sendRedirect("main.jsp");
		} else {
			res.sendRedirect(req.getHeader("Referer"));
		}
	}

}
