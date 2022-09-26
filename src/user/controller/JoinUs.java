package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.api.ha.StickyFeature;

@WebServlet("/joinus")
public class JoinUs extends HttpServlet {
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("utf-8");
      
      //회원 가입 시 회원 정보 저장
      //단 로그인 ID와 쿼리스트링 구분하기위해 neweUsId로 쿼리스트리명 설정
      String usId = req.getParameter("newUsId");
      String usPw = req.getParameter("newUsPw");
      
      String usBirthday = req.getParameter("get_birth_year") +  req.getParameter("get_birth_month") +  req.getParameter("get_birth_day");
      String usPhnum = req.getParameter("usPhnum1") + req.getParameter("usPhnum2") + req.getParameter("usPhnum3");
      
      String usEmail = req.getParameter("usEmail1") + req.getParameter("usPhnum2");
      String usEmailAgree  = req.getParameter("usEmailAgree");
      
      
      
      System.out.println(usId + " " + usPw);
      System.out.println(usBirthday);
      System.out.println(usPhnum);
      System.out.println(usEmail);
      System.out.println(usEmailAgree);
      
      resp.sendRedirect("main.jsp");      
   }

}