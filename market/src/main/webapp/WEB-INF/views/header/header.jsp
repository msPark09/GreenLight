<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header페이지</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style type="text/css">
body {
	position: relative;
}

.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix ~ .container-fluid {
	position: relative;
	top: 300px;
}

.navbar {
	margin-bottom: 0px
}

#myCarousel  .item {
	height: 600px;
}

#myCarousel img {
	position: absolute;
	top: 0;
	left: 0;
	min-width: 100%;
	height: 800px;
}

#wrap>.container {
	padding: 60px 15px 0;
}

.container .credit {
	margin: 20px 0;
}

.carousel-caption {
	z-index: 100;
}

.navbar-brand #t {
	margin: 0px;
	padding: 0px;
}
</style>
<!-- jQuery -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script> -->
</head>




<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar" id="btnNav">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<!-- <a class="navbar-brand" id="t" href="/market/"> -->
				<img alt="Logo" src="/market/img/logo2_77x15.png" />
			</div>

			<%-- <form class="navbar-form navbar-center" role="search">
				 <ul class="nav navbar-nav navbar-right">
					<li class="form-group"><input type="text" class="form-control"
						placeholder="장소 또는 목적을 입력하세요"></li>
					<li><button type="submit" class="btn btn-default">검색</button></li>
					<c:if test="${sessionScope.id eq null }">
					<li><a href="./logform">로그인</a></li>
					</c:if>
					<c:if test="${sessionScope.id ne null }">
					<li><a href="./logout">로그아웃</a></li>
					</c:if>
					
					<li><a href="./gaip">회원가입</a></li>
					<li><a href="#">고객센터</a></li>
				</ul> 
			</form> --%>

			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="/login/mylist">핫딜</a></li>
					<li><a href="./mylist">전체보기</a></li>
					<li><a href="./mylist">국내</a></li>
					<li><a href="./mylist">국외</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">테마
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#section41">테마1</a></li>
							<li class="divider"></li>
							<li><a href="#section41">테마2</a></li>
						</ul></li>
					<<!-- li>
						<form class="navbar-form navbar-center" role="search">
							<input type="text" class="form-control"
								placeholder="장소 또는 목적을 입력하세요">
							<button type="submit" class="btn btn-default">검색</button>
						</form>
					</li> -->
					<c:if test="${sessionScope.id eq null }">
						<li><a href="./logform">로그인</a></li>
					</c:if>
					<c:if test="${sessionScope.id ne null }">
						<li><a href="./logout">로그아웃</a></li>
					</c:if>
					

					<li><a href="./gaip">회원가입</a></li>
					<li><a href="#">고객센터</a></li>

				</ul>


			</div>
	</nav>
	<!-- menu end -->


</body>
</html>