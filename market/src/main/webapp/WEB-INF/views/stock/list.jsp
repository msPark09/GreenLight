<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.container{
overflow: hidden;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){

	$(document).on("click",".wish",function() {
		var wishtext = $(this).html().split(" ");
		//var heartW = wishtext[3].text();
		var proid = $(this).attr("href");
		var customid = '${sessionScope.id}';
		//alert(wishtext[4] =='heartE');
		window.console.log(wishtext[4]);

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
<body>
		<div class="header">
		<%@ include file="../../header/header.jsp"%>
	</div>
	<div class="container">
	<p>&nbsp;</p>
		<div class="section-header">
			<!-- 상품 네비게이션바 -->
			<ol class="breadcrumb">
				<li><a href="/market/">Home</a></li>
				<c:if test="${cat ne null }">
					<li><a href="/market/go/total">전체 리스트</a></li>
					<li class="active"> ${cat }</li>
				</c:if>
				<c:if test="${cat eq null }">
					<li class="active">전체 리스트</li>				
				</c:if>
			</ol>
			<!-- 상품 네비게이션바 end-->
		</div>
		<div class="row">
		<div class="contents">
		<c:if test="${!empty list }">
				<c:forEach items="${list }" var="bean">
					<div class="col-xs-12 col-md-4">
						<div class="thumbnail">
							<a href="/market/detail?id=${bean.proid}"> <img
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
										role="button"> <span class="glyphicon glyphicon-heart-empty heartE "
										aria-hidden="true"></span>
									</a>
								</c:if>
								<a href="/market/detail?id=${bean.proid}" class="btn btn-default"
									role="button">자세히 보기</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</c:if>
				<c:if test="${empty list }">
				
				<h1>해당 여행이 없습니다.</h1>
				<h1>더 좋은 상품을 준비해 돌아오겠습니다.</h1>
				<h1>감사합니다. :)</h1>
				</c:if>
			</div>
		
		
		
		</div>
	</div>
	<!-- container end -->
	<div class="footer">
		<%@ include file="../../footer/footer.jsp"%>
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
