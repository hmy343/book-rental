<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/temple.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/font.css" rel="stylesheet" type="text/css">

<title>Insert title here</title>
</head>
<!-- 수정 예정 아래의 id값 임시로 바로 로그인 값 받은 거지만 추후 에 DB의 회원정보와 비교 한 결과를 받아야 완벽 -->
<!-- 수정 예정 아래의 id값 임시로 바로 로그인 값 받은 거지만 추후 에 DB의 회원정보와 비교 한 결과를 받아야 완벽 -->
<!-- 수정 예정 아래의 id값 임시로 바로 로그인 값 받은 거지만 추후 에 DB의 회원정보와 비교 한 결과를 받아야 완벽 -->
<% String id = (String)request.getAttribute("usId"); %>
<body>

    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="main.jsp">
                <i class="fas fa-film mr-2"></i>
                Book Rental
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            
            <!-- 로그인 정보와 DB회원정보 일치 하면 해당 결과를  따라 출력 형태 조건 로직 -->
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
            	<% if(id == null) {  %>
            		 <li class="nav-item">
	                    <a class="nav-link nav-link-4" href="login.jsp">LOGIN</a>
	                </li>
            	<% } else { %>
	                <li class="nav-item">
	                    <a class="nav-link nav-link-3" href=""><%= id %> 님 환영합니다(추후 수정)</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link nav-link-4" href="login.jsp" onclick="<%id = null; %>">LOGOUT</a>
	                </li>
	             <% }%>
            </ul>
            </div>
        </div>
    </nav>
    
    <hr>

</body>
</html>