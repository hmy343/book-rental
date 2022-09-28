package book.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.HTTP;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import book.dto.BookDTO;
import book.model.BkService;


@WebServlet("/bookinfo")
public class BookInfo extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 req.setCharacterEncoding("utf-8");
		
		  String input =req.getParameter("data");

//		  System.out.println(input);
		  
		  JSONParser parser = new JSONParser();        
		  
		  try {
			  
			JSONObject jsonObject = (JSONObject) parser.parse(input);
			JSONObject jsonObj = (JSONObject) jsonObject;
			
			 String bkTumbnail = (String) jsonObj.get("thumbnail");
			 String bkTitle = (String) jsonObj.get("title");
			 String bkPublisher = (String) jsonObj.get("publisher");
			 String bkDatetime = (String) jsonObj.get("datetime");
			 String bkIsbn = (String) jsonObj.get("isbn");
			 String bkContents = (String) jsonObj.get("contents");
			 String bkUrl = (String) jsonObj.get("url");
			 String bkAuthors = (String) jsonObj.get("authors");
			 
//			  System.out.println(bkTumbnail);
//			  System.out.println(bkTitle); 
//			  System.out.println(bkAuthors);
//			  System.out.println(bkPublisher); 
//			  System.out.println(bkDatetime);
//			  System.out.println(bkIsbn); 
//			  System.out.println(bkContents);
//			  System.out.println(bkUrl);
			  System.out.println(bkIsbn);
			  System.out.println(bkIsbn.split(" ")[1]);
			  
			  
			  System.out.println(bkDatetime);
			  
			  // string -> sql.date
			  Date date = Date.valueOf(bkDatetime.toString().substring(0, 10));
			  
			  if(bkIsbn.length() >= 13) {
				  bkIsbn = bkIsbn.split(" ")[1];
			  }
			  
			  BookDTO bkDTOArr = new BookDTO(Long.parseLong(bkIsbn), bkTitle, bkContents, bkUrl, date, bkAuthors, bkTumbnail, bkPublisher);
			  BkService.addData(bkDTOArr);
			  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  		
		// 임시 페이지 이동
		/*
		 * req.getRequestDispatcher("main.jsp").forward(req, resp);
		 */  
		  		  
		  		  
	}

}
