<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<!-- 제이쿼리로 API 호출하기 위한 기본 스크립트 공식 홈피 참고 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<link href="./css/font.css" rel="stylesheet" type="text/css">
<link href="./css/temple.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 제이쿼리로 API 호출하기 위한 기본 스크립트 공식 홈피 참고 -->
<script type="text/javascript">
  	localStorage.setItem("key", "${key}");
  
  	var searchKey = localStorage.getItem("key");
  	
    	  window.onbeforeunload = () => {
    		  localStorage.removeItem("key");
    		  searchKey = null;
    	  }
</script>

</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- 검색창 -->
	<div class="tm-hero d-flex justify-content-center align-items-center">

		<div class="d-flex tm-search-form">
			<input class="form-control tm-search-input" type="search"
				aria-label="Search" id="keyword" placeholder="search">
			<button class="btn btn-outline-success tm-search-btn" type="submit"
				onclick="search()">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</div>
	<!-- 책목록 -->

	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<h2 class="col-6 tm-text-primary">Book List</h2>
		</div>

		<div class="row tm-mb-90 tm-gallery">
			<!-- 1번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure1" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title1" class="tm-text-gray-light"></span>
				</div>
			</div>
			<!-- 2번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure2" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title2" class="tm-text-gray-light"></span>

				</div>
			</div>
			<!-- 3번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure3" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title3" class="tm-text-gray-light"></span>

				</div>
			</div>
			<!-- 4번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure4" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title4" class="tm-text-gray-light"></span>

				</div>
			</div>
			<!-- 5번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure5" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title5" class="tm-text-gray-light"></span>

				</div>
			</div>
			<!-- 6번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure6" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title6" class="tm-text-gray-light"></span>

				</div>
			</div>
			<!-- 7번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure7" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title7" class="tm-text-gray-light"></span>

				</div>
			</div>
			<!-- 8번책 -->
			<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
				<figure id="figure8" class="effect-ming tm-video-item">
					<figcaption
						class="d-flex align-items-center justify-content-center">
						<h2>Detail</h2>
					</figcaption>
				</figure>
				<div class="d-flex justify-content-between tm-text-gray">
					<span id="title8" class="tm-text-gray-light"></span>


				</div>
			</div>
		</div>
	</div>
		
	<script type="text/javascript">

function search() {
	var bookDataList = null;
	<% String pageNum = request.getParameter("listPage");%>
	var searchWebParam = {
		      'query' : $("#keyword").val(),
		      'size' : 8,
		      'page' : 1	
		};
	  
	  $.ajax({
		   // 통신 방식
		     method: "GET",
		     
		   //API 주소
		     url: "https://dapi.kakao.com/v3/search/book?target=title",
		     data: searchWebParam,
		     headers: {Authorization: searchKey},
		     async: false
		   })
		     .done(function( msg ) {
		   
			 		 
			 	bookDataList = msg;
		    	
	
		     })
		     
		     for(var i = 0 ; i < 8 ; i++){
		    	 
		    	 
		    	 document.getElementById("title"+ (i+1)).innerHTML= bookDataList.documents[i].title;
		    	 document.getElementById("figure"+ (i+1)).innerHTML = "<img class='img-fluid' src='" + bookDataList.documents[i].thumbnail+"' onclick= \" location.href= 'BookDetail.jsp?title="+bookDataList.documents[i].title+"'\"/>";
			 };
		     
		  };
		  
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


	<nav aria-label="Page navigation example">			
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="main.jsp?listPage = 1" onclick="search()">1</a></li>
    <li class="page-item"><a class="page-link" href="main.jsp?listPage = 2" onclick="search()">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
	  </ul>
	</nav>
			
</body>
</html>