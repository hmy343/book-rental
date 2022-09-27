<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookDetail.jsp</title>
 <script type="text/javascript"
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script> 
  
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  
</head>

<body>
<jsp:include page="header.jsp"/>
	<!-- 폼태그를 이용해 대여하기 버튼으로 컨트롤로 전달 -->	
	
	<div id="bookDetailInfo" action="bookinfo" method="get" >
		<div id=list0 class="tumbnail"></div>
		<div id=list1 class="card-title">제목:</div>	
		<div id=list2 class="card-author">저자 : </div>	
		<div id=list3 class="card-publisher">출판사 : </div>	
		<div id=list4 class="card-datetime">출판일: </div>
		
		<br>
		<div>상세정보</div>	
		<div id=list5 class="card-contents"></div>
		<div id=list6 class="card-url" style= "border: 1px solid black; width: 80px">상세 페이지</div>		
				
		<br>
		
		<button type="submit">대여하기</button>
	</div>
	
	<script type="text/javascript">
    //main 페이지에서 사진을 클릭시 전달한 제목을 파라미터로 저장
	<% String keyword = request.getParameter("title");%>
	localStorage.setItem("key", "${key}");
  	var searchKey = localStorage.getItem("key");
  	
  	var bookDetailData = null;
	// 받아온 타이틀로 재호출
	   $.ajax({
		   // 통신 방식
		     method: "post",
		     
		   //API 주소
		     url: "https://dapi.kakao.com/v3/search/book?target=title",
		           
		   //위에서 쿼리 스트링을 저장한  keyword 변수를 이용해 쿼리 문 작성
		     data: { query : "<%=keyword%>"},
		     
		   // API 권한 받기 위한 인증키 
		     headers: {Authorization: searchKey },
		     
		   //동기로 처리  
		     async: false
		   })
		   
		   // 호출 완료 시 해당 책이름이 포함되니 모든 데이터가 msg 매게 변수로 JSON 타입의 배열객체로 받아짐
		     .done(function( msg ) {
		    	 bookDetailData = msg.documents[0];
				
		     })
		     console.log(bookDetailData);
		     
			document.getElementById("list0").innerHTML = "<img src='" + bookDetailData.thumbnail+"'/>" + "<input name=\"bkTumbnail\" style=\"display: none\" value= \" " + bookDetailData.thumbnail +"\">"
			document.getElementById("list1").innerHTML = bookDetailData.title + "<input name=\"bkTitle\" style=\"display: none\" value= \" " + bookDetailData.title +"\">" ;
			document.getElementById("list2").innerHTML = bookDetailData.authors + "<input name=\"bkAuthor\" style=\"display: none\" value= \" " + bookDetailData.authors +"\">";
			document.getElementById("list3").innerHTML = bookDetailData.publisher + "<input name=\"bkPublisher\" style=\"display: none\" value= \" " + bookDetailData.publisher +"\">";
			document.getElementById("list4").innerHTML = bookDetailData.datetime + "<input name=\"bkDatetime\" style=\"display: none\" value= \" " + bookDetailData.datetime +"\">";
			document.getElementById("list5").innerHTML = bookDetailData.contents + "<input name=\"bkContents\" style=\"display: none\" value= \" " + bookDetailData.contents +"\">";
			document.getElementById("list6").innerHTML ="<a href='" + bookDetailData.url +"'>MoreView</a>" + "<input name=\"bkUrl\" style=\"display: none\" value= \" " + bookDetailData.url +"\">"
			+ "<input name=\"bkIsbn\" style=\"display: none\" value= \" " + bookDetailData.isbn +"\">";
			
			const bookDetailInfo = documenet.getElementById('bookDetailInfo');
			bookDetailInfo.addEventListner('click', handleClick());
			
			const handleClick = () => {
				
			}

  </script>	
</body>
</html>