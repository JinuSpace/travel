<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header_script.jsp"></c:import>
<c:import url="../temp/header_css.jsp"></c:import>

<!-- //제이쿼리 ui css -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>
<div class="container">

	
	
		<h4>detail page</h4>
		
		<c:if test="${vo.price ne 0}">
		<div class="row float-end" >
			<h4>입장권 구매</h4>
					<div class="carousel-inner" >
						<div id="datepicker1"></div>
						선택날짜 : <input type="date" id="dateResult" readonly/>
						<div>
							입장료 : <fmt:formatNumber type="currency" value="${vo.price}" />원							
						</div>

						<div>
							구입 매수 : <select name="count" id="select" style="margin: 0 0.5rem 0 0.5rem">
								<option value="1">1매</option>
								<option value="2">2매</option>
								<option value="3">3매</option>
								<option value="4">4매</option>
								<option value="5">5매</option>
							</select>
						</div>
						<div class="d-flex ">
							총 금액 : <input type="number" id="total" readonly="readonly"
								style="margin-left: 0.5rem;width: 85px;" />원
						</div>
						<div>
							<button type="button" class="btn btn-primary">장바구니</button>
							<button type="button" class="btn btn-primary">바로결제</button>
						</div>
					</div>
					</div>
				</c:if>
		<div class="card" style="width: 50rem;">
		
			<div id="carouselExampleControls" class="carousel slide"
				 data-bs-ride="carousel">
				<div class="carousel-inner " style="width: 100%;">
					<c:forEach items="${vo.filesVOs}" var="i" varStatus="status">

						<c:if test="${status.first}">
							<div class="carousel-item active">
								<img src="/resources/upload/product/${i.fileName}"
									class="d-block w-100" alt="...">
							</div>
						</c:if>
						<c:if test="${not status.first}">
							<div class="carousel-item">
								<img src="/resources/upload/product/${i.fileName}"
									class="d-block w-100" alt="...">
							</div>
						</c:if>

					</c:forEach>

					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>


				
			</div>

			<div class="card-body">
				<h5 class="card-title" id="name" data-name="${vo.name}">${vo.name}</h5>
				<p class="card-text">${vo.contents}</p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item" id="address"
					data-address="${vo.address}">주소 : ${vo.address}</li>
				<li class="list-group-item">홈페이지 : <a href="${vo.homePage}">${vo.homePage}</a></li>
				<li class="list-group-item">입장료 : <fmt:formatNumber
						type="currency" value="${vo.price}" />원
				</li>
			</ul>
			<!-- 지도생성 -->
			<div id="map" style="width: 100%; height: 400px;"></div>

			<a href="/product/list">List</a> <a
				href="./update?productNum=${vo.productNum}">Update</a> <a
				href="./delete?productNum=${vo.productNum}">Delete</a>


		</div>
	</div>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<!-- kakao map js -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64cdb28bf8dab29f38f663d6acaaeb38&libraries=services"></script>
	<script type="text/javascript" src="../resources/js/map.js"></script>

	<!--  제이쿼리 ui js -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../resources/js/calendar.js"></script>
	<script type="text/javascript">
		calendar();
		
		$('#select').change(function(){
			console.log($('#select').val());
			let totalPrice=$('#select').val()*${vo.price};
			console.log(totalPrice);
			$('#total').val(totalPrice);
			
		})
	
	</script>


</body>
</html>