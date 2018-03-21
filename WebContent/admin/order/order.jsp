<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/admin/include/loginCheck.jsp" />
<c:import url="/admin/include/head.jsp" />
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="${pageContext.request.contextPath }/bootstrap/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/sb-admin.css"
	rel="stylesheet">

<script>
	function printClock() {

		var week = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday',
				'Thursday', 'Friday', 'Saturday');
		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var calendar = currentDate.getFullYear() + "-"
				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
		var amPm = 'AM'; // 초기값 AM
		var currentDay = addZeros(currentDate.getDay(), 1);
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);

		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = 'PM';
			currentHours = addZeros(currentHours - 12, 2);
		}
		clock.innerHTML = "Updated " + week[currentDay] + " at " + currentHours
				+ ":" + currentMinute + ":" + currentSeconds + amPm; //날짜를 출력해 줌

		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { // 자릿수 맞춰주기
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
</script>
</head>

<body onload="printClock()">

	<c:import url="/admin/include/navigator.jsp" />

	<div class="container-fluid">
		<div class="row">
			<c:import url="/admin/include/sidebar.jsp" />
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<!-- content-wrapper -->
				<div class="container-fluid">
					<!-- Breadcrumbs-->
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
						<li class="breadcrumb-item active">실시간 주문 현황</li>
					</ol>
					<!-- Example DataTables Card-->
					<div class="card mb-3">
						<div class="card-body">
							<div class="table-responsive">
							
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>메뉴</th>
											<th>이름</th>
											<th>연락처</th>
											<th>배달장소</th>
											<th>매장이름</th>
											<th>매장연락처</th>
											<th>주문완료시각</th>
											<th>배달종료시각</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>주문번호</th>
											<th>메뉴</th>
											<th>이름</th>
											<th>연락처</th>
											<th>배달장소</th>
											<th>매장이름</th>
											<th>매장연락처</th>
											<th>주문완료시각</th>
											<th>배달종료시각</th>
										</tr>
									</tfoot>
									<tbody>

										<tr>
											<th>834</th>
											<th>콰트로치즈버거세트</th>
											<th>홍길동</th>
											<th>123-4567-6789</th>
											<th>금천구 가산동 월드메르디앙2차</th>
											<th>가산점</th>
											<th>02-123-4567</th>
											<th>2018-03-20 19:26</th>
											<th></th>
										</tr>

									</tbody>
								</table>
							</div>
						</div>

						<div class="card-footer small text-muted">
							<div style="color: #666;" id="clock" />
						</div>
						<!-- /.container-fluid-->
						<!-- /.content-wrapper-->

					</div>
				</div>
			</div>

			<!-- Bootstrap core JavaScript-->
			<script
				src="${pageContext.request.contextPath }/bootstrap/vendor/jquery/jquery.min.js"></script>
			<script
				src="${pageContext.request.contextPath }/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- Core plugin JavaScript-->
			<script
				src="${pageContext.request.contextPath }/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
			<!-- Page level plugin JavaScript-->
			<script
				src="${pageContext.request.contextPath }/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
			<script
				src="${pageContext.request.contextPath }/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
			<!-- Custom scripts for all pages-->
			<script
				src="${pageContext.request.contextPath }/bootstrap/js/sb-admin.min.js"></script>
			<!-- Custom scripts for this page-->
			<script
				src="${pageContext.request.contextPath }/bootstrap/js/sb-admin-datatables.min.js"></script>
</body>
</html>