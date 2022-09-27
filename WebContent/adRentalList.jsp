<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adRentalList.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="./css/dashboard.css">
<link href="./css/font.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Navbar -->
  <nav class="navbar navbar-dark bg-primary fixed-top flex-md-nowrap p-0 shadow">
    <div class="container-fluid logo">
      <a class="navbar-brand"  href="main.jsp">
	      <i class="fas fa-film mr-2"></i>
	      Book Rental
      </a>
      
      
      <ul class="nav d-flex">
        <li class="nav-item nav-link-3 text-nowrap">UserID</li>
        <li class="nav-item nav-link-4 text-nowrap" href="login.jsp" onclick="">LogOut</li>
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
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                  </svg>
                  Admin1
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                  </svg>
                  Admin2
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z"/>
                  </svg>
                  Admin3
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      
      <!-- Main -->
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div>
        <h3>대여현황</h3>
        <hr>
        <div class="rental-status">
        	<h3>대여 현황</h3>
        	<p>총 대여 권수 | 연체 권수</p>
        </div>
      </div>
      <div>
        <h3>Rental List</h3>
        <hr>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="button" class="btn btn-primary">연체조회</button>
          <button type="button" class="btn btn-outline-primary">사용자 목록</button>
          <button type="button" class="btn btn-outline-primary">대여 목록</button>
        </div>
        <div class="table-responsive">
          <table class="table table-sm ">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">ID</th>
                <th scope="col">등급</th>
                <th scope="col">도서명</th>
                <th scope="col">대여날짜</th>
                <th scope="col">반납일</th>
                <th scope="col">대여상태</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row"></th>
                <td>my8za</td>
                <td>G</td>
                <td>data3</td>
                <td>2022-09-27</td>
                <td>2022-09-27</td>
                <td>반납완료</td>
              </tr>
              <tr>
                <th scope="row"></th>
                <td>data1</td>
                <td>data2</td>
                <td>data3</td>
                <td>data4</td>
                <td>data5</td>
                <td>data5</td>
              </tr>
              <tr>
                <th scope="row"></th>
                <td>data1</td>
                <td>data2</td>
                <td>data3</td>
                <td>data4</td>
                <td>data5</td>
                <td>data5</td>
              </tr>
            </tbody>
          </table>
        </div>
        </div>
      </main>
    </div>

	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>