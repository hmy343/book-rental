package book.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.HTTP;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.mysql.cj.Session;

import book.dto.BookDTO;
import book.model.BkService;
import rental.model.RentalDTO;
import rental.model.rentalService;


@WebServlet("/bookinfo")
public class BookInfo extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	
		  String input =req.getParameter("data");
		  HttpSession session = req.getSession();
		  System.out.println(session.getAttribute("usId"));
		
		  
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
			 
			 
			 
			 // isbn이 2개이상 있을 경우 공백기준으로 잘라내기
			 // isbn 현재 상태 : isbn10 isbn13
			  if(bkIsbn.length() >= 13) {
				  bkIsbn = bkIsbn.split(" ")[1];
			  }
			  
			  
			  
			  // bkDatetime
			  // string -> sql.date
			  
			  // v1 : bkDatetime의 문자정보를 index 기준 0 ~ 10 자리를 잘라 리턴한 값을 date로 변환
			  Date date = Date.valueOf(bkDatetime.toString().substring(0, 10));
			  
			  // v2
//			  Date date = Date.valueOf(bkDatetime.toString().split("T")[0]);
			  
			  boolean result = false;
			  BookDTO bkDTOArr = new BookDTO(Long.parseLong(bkIsbn), bkTitle, bkContents, bkUrl, date, bkAuthors, bkTumbnail, bkPublisher);
			  
				// 로그인한 사용자 정보를 세션에 저장하기 위한 세션 객체 생성
				HttpSession loginSession = req.getSession();
				String usId = (String) loginSession.getAttribute("usId");
				System.out.println(usId);
				
			  RentalDTO rentalDTOArr = new RentalDTO(Long.parseLong(bkIsbn), usId);
			  
			  
			  try {
				  result = BkService.addData(bkDTOArr);
					if(result) { 
						rentalService.addData(rentalDTOArr);
					};
				} catch (SQLException e) {
					e.printStackTrace();
				}
				  
				  
			} catch (ParseException e) {
				e.printStackTrace();
			}
			  		
		 
			
		  		  
		  		  
	}

}
