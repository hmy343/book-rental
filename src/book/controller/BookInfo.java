package book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/bookinfo")
public class BookInfo extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//책 상세 정보 받음
		String bkTumbnail = req.getParameter("bkTumbnail");			
		String bkTitle = req.getParameter("bkTitle"); 
		String bkAuthor =  req.getParameter("bkAuthor"); 
		String bkPublisher =req.getParameter("bkPublisher"); 
		String bkDatetime = req.getParameter("bkDatetime");
		String bkContents = req.getParameter("bkContents"); 
		String bkUrl = req.getParameter("bkUrl");
		String bkIsbn = req.getParameter("bkIsbn");
		 
		
		  System.out.println(bkTumbnail);
		  System.out.println(bkTitle); 
		  System.out.println(bkAuthor);
		  System.out.println(bkPublisher); 
		  System.out.println(bkDatetime);
		  System.out.println(bkIsbn); 
		  System.out.println(bkContents);
		  System.out.println(bkUrl);
		 
		
		
	
		
		
		// 임시 페이지 이동
		/*
		 * req.getRequestDispatcher("main.jsp").forward(req, resp);
		 */
	}

}
