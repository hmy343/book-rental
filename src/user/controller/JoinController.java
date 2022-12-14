package user.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.api.ha.StickyFeature;

import exception.ExistUserException;
import user.dto.UserDTO;
import user.model.UserService;

@WebServlet("/joinus")
public class JoinController extends HttpServlet {
	private UserService service = UserService.getInstance();

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		// 회원 가입 시 회원 정보 저장
		// 단 로그인 ID와 쿼리스트링 구분하기위해 neweUsId로 쿼리스트리명 설정
		String usId = req.getParameter("newUsId");
		String usPw = req.getParameter("newUsPw");

		// sql.Date 형식은 yyyy-mm-dd 형으로 들어가야함
		String usBirthday = req.getParameter("get_birth_year") + "-" + req.getParameter("get_birth_month") + "-"
				+ req.getParameter("get_birth_day");
		String usPhnum = req.getParameter("usPhnum1") + req.getParameter("usPhnum2") + req.getParameter("usPhnum3");
		String usEmail = req.getParameter("usEmail1") + req.getParameter("usPhnum2");

		UserDTO joinUser;

		// 이메일 수신 여부에 따라 객체 생성을 다르게 하기
		if (req.getParameter("usEmailAgree") != null) {
			joinUser = new UserDTO(usId, usPw, usEmail, usPhnum, Date.valueOf(usBirthday), 1);
		} else {
			joinUser = new UserDTO(usId, usPw, usEmail, usPhnum, Date.valueOf(usBirthday));
		}

		try {
			if (service.joinUser(joinUser)) {
				resp.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ExistUserException e) {
			req.setAttribute("errorMsg", "중복된 아이디가 존재");
			req.getRequestDispatcher("signUp.jsp").forward(req, resp);
		}

	}

}