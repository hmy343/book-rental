<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>

</head>
<body>
   <jsp:include page="header.jsp"/>
   
   <h2>회원가입</h2>
   
   <form name="writeForm" action="joinus" method="post" onSubmit='return checkValid()'>
      아이디: <input type="text" name="newUsId"/>
      <br/>
      비밀번호: <input type="password" name="newUsPw" />
      <br/>
      비밀번호 확인: <input type="password" name="newUsPw2" />
      <br/>
      생년월일 :  
       <select name="get_birth_year" id="birth_year"></select> 년
         <select name="get_birth_month" id="birth_month"></select> 월
         <select name="get_birth_day" id="birth_day"></select> 일
      <br>
      휴대폰 번호:
      <select name="usPhnum1" style="display:inline">
         <option>010</option>
         <option>011</option>
         <option>019</option>
      </select>
      - <input name="usPhnum2" size="5" />
      - <input name="usPhnum3" size="5" />
      <br>
      이메일 <input type="text" name="usEmail1"/> 
      @
      <input type="text" name="usEmail2"/> 
      <select>
         <option>메일 주소 선택</option>
         <option>naver.com</option>
         <option>gmail.com</option>
         <option>hanmail.net</option>
         <option>직접 입력</option>
      </select>
      <br/>
      이메일 수신 동의 여부 <input type="checkbox" name="usEmailAgree"/>
      
      <br>
      
      <input type="submit" value="가입" />
      
   </form>
   
   <!-- 생년월일 셀렉트 태그 데이터 생성 로직  -->
   <script type="text/javascript">
   function checkValid() {
	    var f = window.document.writeForm;
			
		if ( f.newUsId.value == "") {
		    alert( "아이디를 입력해 주세요" );
			return false;
	    }
		if ( f.newUsPw.value == "" ) {
			alert( "비밀번호를 입력해 주세요" );
			return false;
		}
		if ( f.newUsPw.value != f.newUsPw2.value ) {
			alert( "비밀번호가 같지 않습니다." );
			return false;
		}
		if ( f.usPhnum2.value == "" ) {
	        alert( "전화번호를 입력해 주세요" );
	        return false;
	    }
		if ( f.usPhnum3.value == "" ) {
	        alert( "전화번호를 입력해 주세요" );
	        return false;
	    }
		if ( f.usEmail1.value == "" ) {
			alert( "이메일을 입력해 주세요" );
			return false;
		}
		if ( f.usEmail2.value == "" ) {
			alert( "이메일을 입력해 주세요" );
			return false;
		}
	    return true;
	}
   
      // birth_year
      let birth_year = document.getElementById("birth_year");
        for(let i = 1970; i < new Date( ).getFullYear( ) +1; i++) {
           birth_year.innerHTML += "<option value="+ i +">"+ i +"</option>";
        }
        
        //birth_month
        let birth_month = document.getElementById("birth_month");
        for(let i = 1; i <= 12; i++) {
            if(i < 10) {
               birth_month.innerHTML += "<option value='0"+ i +"'>0" + i +"</option>"; 
            } else{
               birth_month.innerHTML += "<option value='"+ i +"'>" + i + "</option>";
           }
        }
        
        //birth_day
        let birth_day = document.getElementById("birth_day");
        for(let i = 1; i <= 31; i++) {
            if(i < 10){
               birth_day.innerHTML += "<option value='0"+ i +"'>0" + i + "</option>";
            } else {
               birth_day.innerHTML += "<option value='"+ i +"'>" + i + "</option>";
              }
        } 
        
   </script>
</body>
</html>