<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="./dashboard.css">

<style type="text/css">
.new_us_id_wrppaer {
	position: relative;
}

.id_check_btn {
	cursor: pointer;
}

.id_check_text {
	position: absolute;
	top: 4.7rem;
	left: 0;
}

.phone_content {
	display: flex;
	justify-content: space-between;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body class="bg-light">


	<jsp:include page="header.jsp" />

	<div class="container">
		<main>
			<div class="py-5 text-center">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 40 40">
			     <path
						d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16zer" />
			     <path
						d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z" />
			   </svg>
				<h2>Join Us</h2>
				<p class="lead">Lorem Ipsum is simply dummy text of the printing
					and typesetting industry.</p>
			</div>

			<hr />
			<br />

			<form action="joinus" method="post" class="needs-validation"
				onSubmit='return checkValid()' novalidate>
				<div class="input-group mb-3">
					<div class="col new_us_id_wrppaer">
						<label for="newUsId" class="form-label">User ID</label>
						<div class="input-group mb-3">
							<input id="newUsIdVal" type="text" name="newUsId" class="form-control" />
							<span class="input-group-text id_check_btn" onclick="callCheckId()">???????????????</span>
						</div>
						<div id="idWarning" class="id_check_text"></div>
					</div>
				</div>

				<div class="input-group mb-3">
					<div class="col">
						<label for="pwCheck" class="form-label">???????????? ??????</label> <input
							type="password" name="newUsPw2" class="form-control" />
					</div>
				</div>

				<div class="col">
					<label for="birthday" class="form-label">????????????</label>
				</div>
				<div class="input-group mb-3 birth_content">
					<div class="col">
						<select class="form-control" name="get_birth_year" id="birth_year"></select>
					</div>
					???
					<div class="col">
						<select class="form-control" name="get_birth_month"
							id="birth_month"></select>
					</div>
					???
					<div class="col">
						<select class="form-control" name="get_birth_day" id="birth_day"></select>
					</div>
					???
				</div>

				<div class="col">
					<label for="phonenum" class="form-label">????????? ??????</label>
				</div>
				<div class="input-group mb-3 phone_content">
					<div class="col-lg-3">
						<select class="form-control" name="usPhnum1"
							style="display: inline">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>019</option>
						</select>
					</div>
					-
					<div class="col-lg-4">
						<input type="number" name="usPhnum2" class="form-control">
					</div>
					-
					<div class="col-lg-4">
						<input type="number" name="usPhnum3" class="form-control">
					</div>
				</div>


				<div class="col">
					<label for="usEmail" class="form-label">Email</label>
				</div>
				<div class="input-group mb-3">
					<div class="col-lg-4 col-md-5 col-sm-12">
						<input type="text" name="usEmail1" class="form-control">
					</div>
					<div class="col-lg-0">
						<span class="input-group-text">@</span>
					</div>
					<div class="col">
						<select class="form-control" name="usEmail2">
							<option selected>???????????? ??????</option>
							<option>naver.com</option>
							<option>gmail.com</option>
							<option>hanmail.net</option>
							<option>?????? ??????</option>
						</select> <br />
						<div class="form-check">
							<label class="form-check-label" for="same-address">????????? ??????
								??????</label> <input type="checkbox" name="usEmailAgree"
								class="form-check-input" id="same-address">
						</div>
					</div>
				</div>
				<br>

				<button class="w-100 btn btn-primary btn-lg" type="submit">????????????</button>

			</form>
		</main>
	</div>

	<script type="text/javascript">
   
   async function callCheckId() {
	   
		  var checkId = document.getElementById("newUsIdVal").value;
		  
  			const result = await axios.get("./idcheck",
				  {params: { 'checkId' : checkId }}
			).then(res => res.data)
			
			if(result === '??????') {
				document.getElementById("idWarning").innerHTML = "<span style='color: red'>* ????????? ??????????????????.</span>"	

			}else{
				document.getElementById("idWarning").innerHTML = "<span style='color: blue'>* ?????? ????????? ??????????????????.</span>"
			}
	   }

   
   function checkValid() {
	    var f = window.document.writeForm;
			
		if ( f.newUsId.value == "") {
		    alert( "???????????? ????????? ?????????" );
			return false;
	    }
		if ( f.newUsPw.value == "" ) {
			alert( "??????????????? ????????? ?????????" );
			return false;
		}
		if ( f.newUsPw.value != f.newUsPw2.value ) {
			alert( "??????????????? ?????? ????????????." );
			return false;
		}
		if ( f.usPhnum2.value == "" ) {
	        alert( "??????????????? ????????? ?????????" );
	        return false;
	    }
		if ( f.usPhnum3.value == "" ) {
	        alert( "??????????????? ????????? ?????????" );
	        return false;
	    }
		if ( f.usEmail1.value == "" ) {
			alert( "???????????? ????????? ?????????" );
			return false;
		}
		if ( f.usEmail2.value == "" ) {
			alert( "???????????? ????????? ?????????" );
			return false;
		}
	    return true;
	}
   
   
	  // ???????????? ????????? ?????? ?????? ??????
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>