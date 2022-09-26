<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	body { background: #999; text-align: center;}
	.us_info_wrapper {width:1280px; margin: 0 auto; background: #aaa;}
	.us_info {background: #fff; padding: 50px; border-radius: 30px;}
	.us_rental_list {margin-top: 100px; background: rgba(255,255,255,0.5); padding: 50px;}
	.us_rental_status {display: flex;}
</style>
<head>

<meta charset="UTF-8">
<title>usInfo.jsp</title>
</head>
<body>
	<div class="us_info_wrapper">
		<section class="us_info">
			<div>아이디, 등급, 대여가능수, 누적 연체수, 누적 대여 횟수</div>
			<div>대여 가능 권수 | 대여권수  | 연체권수</div>
		</section>
		<section class="us_rental_list">
			<h2>대여 리스트</h2>
			
			<form action="/" method="post">
				<div class="us_rental_status">
					<input type="checkbox" />
					<p>도서명, 대여날짜, 반납일, 대여상태</p>
				</div>
				<input type="button" value="반납"/>
			</form>
			
		</section>
	</div>
	
</body>
</html>