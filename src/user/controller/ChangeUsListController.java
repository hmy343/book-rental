package user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.HTTP;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import user.model.UserService;


@WebServlet("/changeuserlist")
public class ChangeUsListController extends HttpServlet {
	
		private UserService service = UserService.getInstance();

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 req.setCharacterEncoding("utf-8");
		 
		 // POSt 방식이면 다음 초기값을 설정 해두고
		 if ( req.getMethod().equals("POST") ) {
		     StringBuffer sb = new StringBuffer();
		     BufferedReader bufferedReader = null;
		     String content = "";
		     JSONParser parser = null;
		     JSONArray obj = null;
		     int bytesRead;

		     try {
		    	 // POST 방식이라 파라미터 로 전달 받은게 아니고 데이터가 바디속으로 숨어 버리기때문에 req객체의 모든 값을 읽어오게한다
		    	 // 그후 요청 객체 속에 있는 data(=axios에서 전달한 {data:dataSet} 를 읽어 온다
		         bufferedReader =  req.getReader();
		         // 버퍼의 한번에 읽어오는 배열의 크기가 128로 기본 세팅 되어있음
		         char[] charBuffer = new char[128];
		        
		         // 데이타를 불러와서 sb 에 차곡 차곡 읽어 드림
		         while ( (bytesRead = bufferedReader.read(charBuffer)) != -1 ) {
		             sb.append(charBuffer, 0, bytesRead);
		         }
		         
		         // 읽어들인 data를 문자열로 저장  content는  키 : 벨류 가 String 인  JSON형태이다
		         //{"data":"[{\"adUpdateId\":\"123\",\"seletedChange\":\"B\"},{\"adUpdateId\":\"125\",\"seletedChange\":\"G\"}]"}
		         content = sb.toString();
		         
		         // 이를 키값을 저장된 벨류에 접근하기 위해 문자열을 JSON 객체로 변환
		         
		         // Joson 타입의 parse를 위한 parser객체 생성
		         parser = new JSONParser();
		        // content 를 JSONObject로 형변환
		        // 형변환 후 needContent가 다음과 같은 형태
		        //{"data":"[{\"adUpdateId\":\"123\",\"seletedChange\":\"S\"},{\"adUpdateId\":\"125\",\"seletedChange\":\"G\"}]"}
		        // 그럼 이 이후 "data" 라는 키값으로 배열 객체에 접근 가능
		        JSONObject needContent = (JSONObject) parser.parse(content);
				
				//(String) needContent.get("data") 가 배열안의 객체 이기 때문에 이때
		        // 배열안의 객체를 하나씩 분리하고 해당 각각의 키 값으로 벨류에 접근하기 위해 다시 
		        // needContent.get("data")를 String 타입으로 만든 후 !!! 
		        // 중요 ! 배열안의 객체들 이기 때문에 JSONArray 타입으로 변환 해준다
				obj = (JSONArray) parser.parse( (String) needContent.get("data") );
				// 이때 obj 의 출력 형태는
				//[{"seletedChange":"S","adUpdateId":"123"},{"seletedChange":"S","adUpdateId":"125"}]
				
				System.out.println(obj);
				
				// 그럼 obj를 다시 JSONObject로 바꿔 주면
				//객체의 key 값으로 접근해 원하는 데이터만 출력 할 수 있다.
				for(int i = 0 ; i < obj.size() ; i++ ) {
				JSONObject updateContext = (JSONObject) obj.get(i);
				String userId = (String) updateContext.get("adUpdateId");
				String updateGrade = (String) updateContext.get("seletedChange");
				
				service.updateGrade(userId, updateGrade);
				
				
				}
		     } catch (IOException ex) {
		         throw ex;
		     } catch (ParseException ex) {
		    	 
		     } catch (SQLException e) {
				e.printStackTrace();
			} finally {
		         if (bufferedReader != null) {
		             try {
		                 bufferedReader.close();
		             } catch (IOException ex) {
		                 throw ex;
		             }
		         }
		     }
				resp.sendRedirect("adUserList.jsp");
		 }
	}

}
