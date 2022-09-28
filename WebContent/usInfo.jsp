<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>usInfo.jsp</title>
<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="./css/font.css" rel="stylesheet" type="text/css">
<style>
	.us_info_wrapper {width:1280px; margin: 0 auto;}
	.us_info {padding: 50px; border-radius: 30px; box-sizing: border-box !important; background: rgba(0, 0, 0, .06); text-align: center;}
	.us_rental_list {padding-top: 50px; background: #fff;}
	.us_rental_status {display: flex;}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="container us_info_wrapper">
		<div class="row info_box">
      <div class="us_info col">
        <div>아이디, 등급, 대여가능수, 누적 연체수, 누적 대여 횟수</div>
        <div>대여 가능 권수 | 대여권수  | 연체권수</div>
      </div>
    </div>
		<section class="us_rental_list">
			<h3>대여 리스트</h3>
      <hr>
      <!-- table -->
      <div class="table-responsive">
        <table class="table table-sm ">
          <thead class="table-light">
            <tr class="table-primary">
              <th scope="col">#</th>
              <th scope="col">도서명</th>
              <th scope="col">대여일자</th>
              <th scope="col">반납일자</th>
              <th scope="col">대여상태</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td scope="row"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
              <td>죽고 싶지만 떡볶이는 먹고 싶어</td>
              <td>2022-09-27</td>
              <td>-</td>
              <td>대여중</td>
            </tr>
            <tr>
              <td scope="row"><input class="form-check-input" type="checkbox" value="" id="flexCheckDisabled" disabled></td>
              <td>너의 췌장을 먹고 싶어</td>
              <td>2022-09-27</td>
              <td>2022-09-27</td>
              <td>반납완료</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button type="button" class="btn btn-primary">반납</button>
      </div>

			
		</section>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>