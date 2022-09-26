<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adUserList.jsp</title>
<style type="text/css">
	body { background: #999;}
	.ad_uslist_wrapper {width:1280px; margin: 0 auto; background: #aaa;}
	.ad_uslist_content {display: flex;}
</style>
</head>
<body>
	
	<div class="ad_uslist_wrapper">
		<h2>USER LIST</h2>
		
		<section>
			<div>
				<select>
					<option>B</option>
					<option>S</option>
					<option>G</option>
					<option>P</option>
				</select>
				<button>사용자목록</button>
				<button>대여목록</button>
			</div>
		</section>
		
		<section>
			<form action="/" method="post">
			    <p>테이블 컬럼</p>
				<p>유저 아이디, 가입날짜, 생년월일, 휴대폰번호, 이메일, 수신동의, 연체 횟수, 회원상태, 등급</p>
				<div class="ad_uslist_content">
					<input type="checkbox" />
					<p>유저 아이디, 가입날짜, 생년월일, 휴대폰번호, 이메일, 수신동의, 연체 횟수, 회원상태, </p>
					<select>
						<option>B</option>
						<option>S</option>
						<option>G</option>
						<option>P</option>
					</select>
				</div>
				<input type="button" value="수정"/>
			</form>
		</section>
		
	</div>
</body>
</html>