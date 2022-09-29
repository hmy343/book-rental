<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./css/dashboard.css">

<link href="./css/font.css" rel="stylesheet" type="text/css">
<link href="./css/temple.css" rel="stylesheet" type="text/css">
<style type="text/css">

   a{text-decoration: none; color: #000;}
   
   form {display: block; width: 500px; padding-top: 40px; padding-bottom: 40px;}
   
    label {
      display: block; margin: 0 0 10px; font-size: 12px; font-weight: 700;
      line-height: 1; text-transform: uppercase; letter-spacing: .2em;
   }
    
    input {
      display: block; width: 100%; padding: 12px 20px; border: 0; border-radius: 4px;
      box-sizing: border-box; outline: none; background: rgba(0,0,0, 0.1); font-weight: 700;
   }
   
   .sign_us {font-size: 12px; letter-spacing: 0; text-transform: none;}
     
   button {
      width: 100%; padding: 12px 20px; border: 0; border-radius: 4px; background: #4285F4;
      outline: none; color: #fff; font-size: inherit; font-weight: 700; cursor: pointer;
   }
     
    
</style>
</head>
<body>
   <jsp:include page="header.jsp"/>
   
   <main class="form-signin">
   	<form name="loginForm" action="login" method="post" onSubmit='return checkValid()'>
		    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 40 40">
		      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		      <path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
		    </svg>
		    <h1 class="h3 mb-3 fw-normal">Sign In</h1>
		    
			<label for="usId" class="login_group">USERID</label>
			<input type="text" id="id" name="usId"  />		    
		    
			<label for="usPw">PASSWORD</label>
			<input type="password" id="pw" name="usPw"  />
			 
			 <%-- forgot password : 그냥 넣어봤어요^ㅁ^ --%>
			<label class="sign_us">
			   <a href="#">Forgot Password?</a>
			   <a href="signUp.jsp">Sign Up</a>
			</label>
			
			<%-- 로그인 버튼 --%>
			<button type="submit" >Log IN</button>
   	</form>
   </main>
   <script  type="text/javascript">
   /* 빈 칸 입력시 입력하라고 안내 */
   function checkValid() {
	    var f = window.document.loginForm;
			
		if ( f.usId.value == "") {
		    alert( "아이디를 입력해 주세요" );
			return false;
	    }
		if ( f.usPw.value == "" ) {
			alert( "비밀번호를 입력해 주세요" );
			return false;
			}
	    return true;
	}
   </script>
</body>
</html>