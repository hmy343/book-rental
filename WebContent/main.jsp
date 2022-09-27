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

<!-- 제이쿼리로 API 호출하기 위한 기본 스크립트 공식 홈피 참고 -->
     <script type="text/javascript">

   //  localStorage.setItem("key", "${key}");
  // 검색 버튼 누르면 호출 하도록 함수 안에 ajax 진행(호출 기능)
  
  
  
  	localStorage.setItem("key", "${key}");
  
  	var searchKey = localStorage.getItem("key");
  	
  	

  
    	  window.onbeforeunload = () => {
    		  localStorage.removeItem("key");
    		  searchKey = null;
    	  }
    	  

    	  
    	  
   
  
  function search() {
	  
	  
	  $.ajax({
		   // 통신 방식
		     method: "GET",
		     
		   //API 주소
		     url: "https://dapi.kakao.com/v3/search/book?target=title",
		           
		   //$("#bookName").val() 인풋 박스 벨류값 을 받아서 쿼리 문 작성
		   
		     data: { query : $("#keyword").val()},
		     
		   
		    // API 권한 받기 위한 인증키 
		    
		     headers: {Authorization: searchKey},
		     
		  
		   })
		   // 호출 완료 시 해당 책이름이 포함되니 모든 데이터가 msg 매게 변수로 JSON 타입의 배열객체로 받아짐
		     .done(function( msg ) {
		    	 console.log(msg);
		    	for(var i = 0 ; i < 8 ; i++){
		    		$("#title"+ (i+1)).append(msg.documents[i].title);
			 		$("#figure"+ (i+1)).append("<img class='img-fluid' src='" + msg.documents[i].thumbnail+"' onclick= \" location.href= 'BookDetail.jsp?title="+msg.documents[i].title+"'\"/>");

		    	};
	
		     })
		  };
		
  </script>

</head>
<body>
   <jsp:include page="header.jsp"/>
   
	<!-- 검색창 -->
	<div class="tm-hero d-flex justify-content-center align-items-center">
        <div class="d-flex tm-search-form">
            <input class="form-control tm-search-input" type="search"  aria-label="Search" id="keyword" placeholder="search">
            <button class="btn btn-outline-success tm-search-btn" type="submit" onclick="search()">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </div>
    <!-- 책목록 -->
  
     <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-6 tm-text-primary">
                Book List
            </h2>
        </div>
        
        <div class="row tm-mb-90 tm-gallery">
        <!-- 1번책 -->
        	<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                <figure id="figure1" class="effect-ming tm-video-item">
                    <figcaption class="d-flex align-items-center justify-content-center">
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
                    <figcaption class="d-flex align-items-center justify-content-center">
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
                    <figcaption class="d-flex align-items-center justify-content-center">
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
                    <figcaption class="d-flex align-items-center justify-content-center">
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
                    <figcaption class="d-flex align-items-center justify-content-center">
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
                    <figcaption class="d-flex align-items-center justify-content-center">
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
                    <figcaption class="d-flex align-items-center justify-content-center">
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
                    <figcaption class="d-flex align-items-center justify-content-center">
                        <h2>Detail</h2>
                    </figcaption>                    
                </figure>
                <div class="d-flex justify-content-between tm-text-gray">
                    <span id="title8" class="tm-text-gray-light"></span>
                    
                </div>
            </div>                     
        </div>
     </div>


</body>
</html>