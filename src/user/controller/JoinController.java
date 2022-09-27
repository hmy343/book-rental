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

import user.dto.UserDTO;
import user.model.UserService;


@WebServlet("/joinus")
public class JoinController extends HttpServlet {
	private UserService service = UserService.getInstance();
	
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("utf-8");
      
      //회원 가입 시 회원 정보 저장
      //단 로그인 ID와 쿼리스트링 구분하기위해 neweUsId로 쿼리스트리명 설정
      String usId = req.getParameter("newUsId");
      String usPw = req.getParameter("newUsPw");
      
      String usBirthday = req.getParameter("get_birth_year") +"-"+  req.getParameter("get_birth_month") +"-"+  req.getParameter("get_birth_day");
      String usPhnum = req.getParameter("usPhnum1") + req.getParameter("usPhnum2") + req.getParameter("usPhnum3");
      
      String usEmail = req.getParameter("usEmail1") + req.getParameter("usPhnum2");
      String usEmailAgree  = req.getParameter("usEmailAgree");
      
      
      System.out.println(usId + " " + usPw);
      System.out.println(usBirthday);
      System.out.println(usPhnum);
      System.out.println(usEmail);
      System.out.println(usEmailAgree);
      
//      UserDAO.joinUser();
//      UserDTO joinUser = service.joinUser(usId, usPw, usPhnum, usEmail, usBirthday);
//      UserDTO joinUser = service.joinUser();
      UserDTO joinUser = new UserDTO(usId, usPw, usEmail, usPhnum, Date.valueOf(usBirthday));
      System.out.println(joinUser);
      
      try {
		service.joinUser(joinUser);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      resp.sendRedirect("login.jsp");      
   }

}