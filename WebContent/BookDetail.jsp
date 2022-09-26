<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript"
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
  
  <script type="text/javascript">
  //main 페이지에서 사진을 클릭시 전달한 제목을 파라미터로 저장
	<% String keyword = request.getParameter("title");%>
  	
	// 받아온 타이틀로 재호출
	   $.ajax({
		   // 통신 방식
		     method: "GET",
		     
		   //API 주소
		     url: "https://dapi.kakao.com/v3/search/book?target=title",
		           
		   //위에서 쿼리 스트링을 저장한  keyword 변수를 이용해 쿼리 문 작성
		     data: { query : "<%=keyword%>"},
		   // API 권한 받기 위한 인증키 
		     headers: {Authorization: ""},
		   })
		   // 호출 완료 시 해당 책이름이 포함되니 모든 데이터가 msg 매게 변수로 JSON 타입의 배열객체로 받아짐
		     .done(function( msg ) {
   
		   // 배열 인덱스 번호로 해당 키값을 통해 데이터 받아 아래의 div 박스및 h 태그의 아이디 값으로 지정해 
		   // 상세페이지 내용 출력
		      console.log(msg);
		      $("#img1").append("<img src='" + msg.documents[0].thumbnail+"'/>");
				$("#list1").append(msg.documents[0].title);
				$("#list2").append(msg.documents[0].authors);
				$("#list3").append(msg.documents[0].publisher);
				$("#list4").append(msg.documents[0].datetime);
				$("#list5").append(msg.documents[0].contents);
				$("#list6").append("<a onclick= \" location.href= '"+msg.documents[0].url+"'\">상세페이지</a>");
				
			//폼으로 데이터 전달
				$("#img1").append("<input id= \"sendBkTumbnail\" name=\"bkTumbnail\" style=\"display: none\" value= \" " + msg.documents[0].thumbnail +"\">");
				$("#list1").append("<input id= \"sendBkTitle\" name=\"bkTitle\" style=\"display: none\" value= \" " + msg.documents[0].title +"\">");
				$("#list2").append("<input id= \"sendBkAuthor\" name=\"bkAuthor\" style=\"display: none\" value= \" " + msg.documents[0].authors +"\">");
				$("#list3").append("<input id= \"sendBkPublisher\" name=\"bkPublisher\" style=\"display: none\" value= \" " + msg.documents[0].publisher +"\">");
				$("#list4").append("<input id= \"sendBkDatetime\" name=\"bkDatetime\" style=\"display: none\" value= \" " + msg.documents[0].datetime +"\">");
				$("#list5").append("<input id= \"sendBkContents\" name=\"bkContents\" style=\"display: none\" value= \" " + msg.documents[0].contents +"\">");
				$("#list6").append("<input id= \"sendBkUrl\" name=\"bkUrl\" style=\"display: none\" value= \" " + msg.documents[0].url +"\">");
				$("#list7").append("<input id= \"sendBkIsbn\" name=\"bkIsbn\" style=\"display: none\" value= \" " + msg.documents[0].isbn +"\">");
				 
				
		     })
		  
  
  </script>
  
  
</head>

<body>
	<!-- 폼태그를 이용해 대여하기 버튼으로 컨트롤로 전달 -->
	<form action="bookimfo" method="get">
		<div id=img1 class="tumbnail"></div>
		<h5 id=list1 class="card-title">제목: </h5>	
		<h5 id=list2 class="card-author">저자 : </h5>	
		<h5 id=list3 class="card-publisher">출판사 : </h5>	
		<h5 id=list4 class="card-datetime">출판일: </h5>
		<br>
		<h5>상세정보</h5>	
		<h5 id=list5 class="card-contents"></h5>
		<div id=list6 class="card-url" style= "border: 1px solid black; width: 80px"></div>
		<div id=list7 style="display: none"></div>		
		<br>
		<button type="submit">대여하기</button>
	</form>
</body>
</html>