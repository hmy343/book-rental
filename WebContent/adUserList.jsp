<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adUserList.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/dashboard.css">
<link href="./css/font.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</head>
<%
	String id = (String) session.getAttribute("usId");
%>
<body>
	<!-- Navbar -->
	<nav
		class="navbar navbar-dark bg-primary fixed-top flex-md-nowrap p-0 shadow">
		<div class="container-fluid logo">
			<a class="navbar-brand" href="./main.do"> <i
				class="fas fa-film mr-2"></i> Book Rental
			</a>


			<ul class="nav d-flex">
				<li class="nav-item nav-link-3 text-nowrap">UserID</li>
				<li class="nav-item"><a class="nav-item nav-link-4 text-nowrap"
					href="./logout" onclick="">LogOut</a></li>
			</ul>
		</div>
	</nav>

	<!-- Container -->
	<div class="container-fluid contents_wrapper">
		<!-- Sidebar -->
		<div class="row">
			<div class="col-md-2 bg-light d-none d-md-block sidebar">
				<div class="left-sidebar">
					<ul class="nav flex-column sidebar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-chevron-compact-right"
									viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
										d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
                  </svg> UserList
						</a></li>
						
						
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="admin-rental"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-chevron-compact-right"
									viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
										d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
                  </svg> RentalList
						</a></li>

					</ul>
				</div>
			</div>
		</div>	

		<!-- Main -->
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h3>User List</h3>
			<hr>
			<div class="d-grid gap-2 d-md-flex justify-content-md-start">
				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false">??? ???</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">B</a></li>
						<li><a class="dropdown-item" href="#">S</a></li>
						<li><a class="dropdown-item" href="#">G</a></li>
						<li><a class="dropdown-item" href="#">P</a></li>
					</ul>
				</div>
				<button type="button" class="btn btn-outline-primary">?????????
					??????</button>
				<button type="button" class="btn btn-outline-primary">?????? ??????</button>
			</div>
			<!-- table -->
			<div class="table-responsive">
				<table class="table table-sm ">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">ID</th>
							<th scope="col">????????????</th>
							<th scope="col">????????????</th>
							<th scope="col">???????????????</th>
							<th scope="col">?????????</th>
							<th scope="col">????????????</th>
							<th scope="col">?????? ??????</th>
							<th scope="col">????????????</th>
							<th scope="col">??????</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty userList || fn:length(userList) == 0}">
							<tr>
								<td colspan="5">
									<p align="center">
										<b><span style="font-size: 9pt;">????????? ???????????? ????????????.</span></b>
									</p>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${requestScope.userList}" var="data" varStatus="status">
							<tr class = "checkContainer">
								<td scope="row"><input class="form-check-input"
									type="checkbox" value="" id= "${status.index}" ></td>
								<td class = "usId">${data.usId}</td>
								<td>${data.usJoinDate}</td>
								<td>${data.usBirtyDay}</td>
								<td>${data.usPhnum}</td>
								<td>${data.usEmail}</td>
								<td>${data.usEmailAgree}</td>
								<td>${data.usOverdue}</td>
								<td>${data.usStatus}</td>
								<td><select name="us_grade" class = "us_grade">
										<option value="" selected>${data.usGrade}</option>
										<option value="B">bronze</option>
										<option value="S">Silver</option>
										<option value="G">Gold</option>
										<option value="P">Platinum</option>
								</select></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button type="button" class="btn btn-primary" onclick="adUpdateList()">??????</button>
			</div>
		</main>
	</div>

	<script type="text/javascript">
	

	
    const checkbox = document.getElementsByClassName("form-check-input");
    const selectbox= document.getElementsByClassName("us_grade");
	const checkContainer = document.getElementsByClassName("checkContainer");
	
	
	let adUpdateId;
	let gradeChange;
	let seletedChange;
	let	changeData;
	let changeDatas = [];
	 
	function adUpdateList(){
    for(let i = 0 ; i <checkbox.length; i++){
    	   		
   		if(checkbox[i].checked) {
   			 adUpdateId = checkContainer[i].cells[1].innerHTML
   			 gradeChange = checkContainer[i].children[9].children[0];
   			 seletedChange = gradeChange.options[gradeChange.selectedIndex].value
   			
   			changeData = {"adUpdateId": adUpdateId, "seletedChange": seletedChange};
   			changeDatas.push(changeData);

    	    				}
    	}
    const dataSet = JSON.stringify(changeDatas);
    console.log(dataSet);
		axios.post("./changeuserlist",
	
	  {data : dataSet})    			
	}
   
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
</body>
</html>