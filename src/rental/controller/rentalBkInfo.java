package rental.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;


@WebServlet("/rentalInfo")
public class rentalBkInfo extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		resp.setContentType("application/json; charset=UTF-8");
		// 대여하기 버튼 클릭시, 해당 도서 정보 받아오기
		
		String apiData = req.getParameter("data");
		
		
		JSONObject jsonData = new JSONObject();
		jsonData.put("test", apiData);
		
//		String title = jsonData.getString("title");
		System.out.println(jsonData.getString("title"));
		
		PrintWriter out = resp.getWriter();
		out.print(jsonData.toString());
		
		System.out.println(jsonData.toString());
	}

}
