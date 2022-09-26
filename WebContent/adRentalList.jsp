<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adRentalList.jsp</title>
<style type="text/css">
	body { background: #999;}
	.ad_rental_list_wrapper {width:1280px; margin: 0 auto; background: #aaa;}
	.ad_rental_summary {background: #fff; padding: 50px; border-radius: 30px; text-align: center;}
	.ad_rental_list {margin-top: 100px; background: rgba(255,255,255,0.5); padding: 50px;}
	.ad_rental_status {display: flex;}
</style>
</head>
<body>
	<div class="ad_rental_list_wrapper">
		<section class="ad_rental_summary">
			<h3>대여현황 파악</h3>
			<div>총 대여권수 | 연체권수</div>
		</section>
		
		<div class="ad_rental_list">
			<h2>RENTAL LIST</h2>
			
			<section>
				<div>
					<button>연체조회</button>
					<button>사용자목록</button>
					<button>대여목록</button>
				</div>
			</section>
			
			<section>
				<form action="/" method="post">
				    <p>테이블 컬럼</p>
					<p>유저아이디, 유저 등급, 도서명, 대여날짜, 반납일, 대여상태</p>
					<div class="ad_uslist_content">
						<input type="checkbox" />
						<p>유저아이디, 유저 등급, 도서명, 대여날짜, 반납일, 대여상태</p>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>