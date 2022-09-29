<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookDetail.jsp</title>
<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
  .detail_wrapper {margin-top: 60px; margin-bottom: 100px;}
  .k_detail_bg {background-image: url("./img/k_detail_bg.jpg") !important;}
  .ratio>* {left: 15%;}
  .tumbnail {background: #ccc; margin-bottom: 20px; }
  .tumbnail img {width: 70%;}
  .card-title {padding-top: 0; font-size: 1.2rem; font-weight: 700;}
  .card-url {display: flex; justify-content: flex-end;}
</style>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  
</head>
<body>
<jsp:include page="header.jsp"/>
   <!-- 폼태그를 이용해 대여하기 버튼으로 컨트롤로 전달 -->   
	<main>
		<!-- visual content -->
		<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
	      <div class="col-md-5 p-lg-5 mx-auto my-5 bk_detail_bg">
	        <h1 class="display-4 fw-normal">Book-Rental</h1>
	        <p class="lead fw-normal">"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."</p>
	        <a class="btn btn-outline-secondary" href="main.do">목록으로 이동</a>
	      </div>
	    </div>
	    
	    
	 <!-- book-detail -->
     <div class="container detail_wrapper">
      <div class="row flex-nowrap" id="bookDetailInfo" action="bookinfo" method="get" >
        <div class="col">
          <div id=list0 class="tumbnail ratio ratio-1x1"><img class="rounded mx-auto d-block" src="https://www.cbc.ca/kidsnews/content/_card_resize/BlueMonday_thumbnail.jpg"/></div>
          <div class="row" style="box-sizing: border-box !important;"><button type="submit" class="btn btn-outline-primary">대여하기</button></div>
        </div>
  
        <div class="col-7 info_content">
          <h5>도서 소개</h5>
          <hr/>
          <div id=list1 class="card-title">예민함이라는 선물</div>	
          <dl>
            <div class="row">
              <dt class="col-lg-2">저자</dt>
              <dd id=list2 class="card-author col "></dd>
            </div>

            <div class="row">
              <dt class="col-lg-2">출판사</dt>
              <dd id=list3 class="card-publisher col "></dd>
            </div>
          
            <div class="row">
              <dt class="col-lg-2">출판일</dt>
              <dd id=list4 class="card-datetime col "></dd>
            </div>
          </dl>
          <div id=list5 class="card-contents"></div>

          <!-- <div id=list5 class="card-contents"></div> -->
          <div id=list6 class="card-url"></div>	

        </div>
      </div>
    </div>
	    
	</main>
	

  <script type="text/javascript">
    //main 페이지에서 사진을 클릭시 전달한 제목을 파라미터로 저장
	<% String keyword = request.getParameter("title");%>
	localStorage.setItem("key", "${key}");
  	var searchKey = localStorage.getItem("key");
  	
			 axios.get("https://dapi.kakao.com/v3/search/book?target=title", {
	             headers: {Authorization: searchKey},
	             params: { 'query' : "<%=keyword%>"}
	       })
	       .then(res => { var bookDetailData = res.data.documents[0];
	       	document.getElementById("list0").innerHTML = "<img src='" + bookDetailData.thumbnail+"'/>";
			document.getElementById("list1").innerHTML = bookDetailData.title ;
			document.getElementById("list2").innerHTML = bookDetailData.authors;
			document.getElementById("list3").innerHTML = bookDetailData.publisher;
			document.getElementById("list4").innerHTML = bookDetailData.datetime;
			document.getElementById("list5").innerHTML = bookDetailData.contents;
			document.getElementById("list6").innerHTML ="<a href='" + bookDetailData.url +"'>MoreView</a>";
			
			const authorsArr = bookDetailData.authors;
 			const sendAuthors = authorsArr.join([","]);
 			console.log(sendAuthors);
			const sendData = {'data' :
									{'thumbnail' : bookDetailData.thumbnail ,
										'title' : bookDetailData.title,
										'isbn' : bookDetailData.isbn,
										'url' : bookDetailData.url,
										'contents' : bookDetailData.contents,
										'datetime' : bookDetailData.datetime,
										'publisher' : bookDetailData.publisher,
										'authors' : sendAuthors
									}
										
							  };
			axios.get("./bookinfo"
					,{params: sendData}
			).then(res => console.log(res));
	       			
	             		}
	       
	       		);
			 		
  </script>	
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>