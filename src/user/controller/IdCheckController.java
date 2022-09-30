package user.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.ExistUserException;
import user.dto.UserDTO;
import user.model.UserService;


@WebServlet("/idcheck")
public class IdCheckController extends HttpServlet {
	
	private UserService service = UserService.getInstance();
	
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	
		req.setCharacterEncoding("utf-8");
			
		  String checkId =req.getParameter("checkId");
		  System.out.println(checkId);
		  
		  String checkUsId = checkId ;
		  String isId = "";
	
		  

		  try {
			
			 
			boolean isIdResult = service.idCheck(checkUsId);
			
			if(isIdResult) {
				 isId = "가입가능";
			}else {
				 isId = "중복";
			}
			
			 
			 resp.setContentType("text/html; charset=utf-8");
			 resp.getWriter().print(isId);
			 
		} catch (ExistUserException | SQLException e) {
			
			e.printStackTrace();
		}
		 
		 

		
		}
		  
		 
		  
		  
	}


