<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GreenLight</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.logo {
	font-size: 40px;
	position: absolute;
	z-index: 1200;
	color: white;
	top: 150px;
	text-align: center;
	width: 100%;
}

.thumbnail .caption {
	width: 100%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript">
	$(document).ready(function() {	
		$('.item').eq(0).addClass('active');
		$('.carousel').carousel({
			interval: 2000
		});
		$('.cat').on("click",function() {
			//alert($(this).attr("href"));
			var url = $(this).attr("href");
			var target = $(".contents");
			$.ajax({
				'url' : url,
				'success' : function(data,textStatus,jqXHR) {
					target.html("");
					data = data.replace(/\+/gi,'%20');
					data = decodeURIComponent(data);
					target.append(data);
				},
				'error' : function(jqXHR,textStatus) {
					alert("통신실패 "+ textStatus+ "(code): "+ jqXHR.status);
				}
			});
			return false;
		});
		$(document).on("click",".wish",function() {
			var wishtext = $(this).html().split(" ");
			//var heartW = wishtext[3].text();
			var proid = $(this).attr("href");
			var customid = '${sessionScope.id}';
			//alert(wishtext[4] =='heartE');

			if (customid != "") {
				if (wishtext[4] =='heartE') {
					$.ajax({
						'url' : "/market/wishIn",
						'data' : {
							"proid" : proid,
							"customid" : customid
						},
						'success' : function(data,textStatus,jqXHR) {
							$("#msg").text("위시리스트에 저장하였습니다.");
							$("#myModal").modal();
						},
						'error' : function(jqXHR,textStatus) {
							alert("통신실패 "+ textStatus+ "(code): "+ jqXHR.status);
						}
					});
					$(this).html(" <span class=\"glyphicon glyphicon-heart heart\" aria-hidden=\"true\"></span>");
					return false;
				} else {
					$.ajax({
						'url' : "/market/wishOut",
						'data' : {
							"proid" : proid,
							"customid" : customid
						},
						'success' : function(data,textStatus,jqXHR) {
							$("#msg").text("위시리스트 삭제 완료.");
							$("#myModal").modal();
						},
						'error' : function(jqXHR,textStatus) {
							window.console.log("통신실패 "+ textStatus+ "(code): "+ jqXHR.status);
						}
					});
							window.console.log("start");
					$(this).html(" <span class=\"glyphicon glyphicon-heart-empty heartE \" aria-hidden=\"true\"></span>");
							window.console.log("end");
					return false;
				}
				
			} else {
				$("#msg").text("로그인 후 사용 가능합니다.");
				$("#myModal").modal();
			}
			return false;
		});
	});
</script>
</head>
<body class="body">

	<!-- Carousel=========-->
	<div id="myCarousel" class="carousel slide">
	<!-- Indicators -->
		 <ol class="carousel-indicators">
		 <c:forEach var="i" begin="0" end="${cnt-1 }">	
			<li data-target="#myCarousel" data-slide-to="${i }"></li>
		</c:forEach>
		</ol>
		<div class="carousel-inner">
			<c:forEach items="${mainImg }" var="mImg">			
			<div class="item">
				<img src="/market/file/${mImg.IMG }">
				<div class="container">
					<div class="carousel-caption">
						<h2>${mImg.TITLE }</h2>
						<p></p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<!-- /.carousel-inner -->


		<div class="logo">GREENLIGHT</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	<!-- /.carousel -->
	 <div class="header">
		<%@ include file="../header/header.jsp"%>
	</div> 
	<div class="container">
		<div class="col-md-12 col-xs-12 starter-template">
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a class="cat"
					href="/market/cat/total">테마여행</a></li>
				<li role="presentation"><a class="cat" href="/market/cat/HU">휴양지</a></li>
				<li role="presentation"><a class="cat" href="/market/cat/FM">가족여행</a></li>
				<li role="presentation"><a class="cat" href="/market/cat/FO">맛집탐방</a></li>
				<li role="presentation"><a class="cat" href="/market/cat/OD">당일치기</a></li>
			</ul>
		</div>

		<div class="row">
			<div class="contents">
				<c:forEach items="${list }" var="bean">
					<div class="col-xs-12 col-md-4">
						<div class="thumbnail">
							<a href="detail?id=${bean.proid}"> <img
								src="/market/file/${bean.thumb }"
								alt="${bean.thumb }">
							</a>
							<div class="caption">
								<h3>${bean.proname }</h3>
								<c:if test="${!empty wishlist}">
									<p>
										<c:set var="cnt" value="0" />
										<c:forEach items="${wishlist }" var="wishbean">
											<c:if test="${wishbean.proid eq bean.proid}">
												<c:set var="cnt" value="1" />
											</c:if>
										</c:forEach>
										<c:if test="${cnt eq 0}">
											<a href="${bean.proid}" class="wish btn btn-danger"
												role="button"> <span
												class="glyphicon glyphicon-heart-empty heartE "
												aria-hidden="true"></span></a>
										</c:if>
										<c:if test="${cnt eq 1}">
											<a href="${bean.proid}" class="wish btn btn-danger"
												role="button"> <span
												class="glyphicon glyphicon-heart heart" aria-hidden="true"></span></a>
										</c:if>
								</c:if>
								<c:if test="${empty wishlist}">
									<a href="${bean.proid}" class="wish btn btn-danger"
										role="button"> <!-- //data-toggle="modal" data-target="#myModal" -->
										<span class="glyphicon glyphicon-heart-empty heartE "
										aria-hidden="true"></span>
									</a>
								</c:if>
								<a href="detail?id=${bean.proid}" class="btn btn-default"
									role="button">자세히 보기</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<div class="footer">
		<%@ include file="../footer/footer.jsp"%>
	</div>
	 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">GreenLight</h4>
        </div>
        <div class="modal-body">
          <p id="msg"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>