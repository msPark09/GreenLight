<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.navbar {
	min-height: 35px;
	background-color: gray;
	outline: 0;
	border: 0;
	padding-top: 5px;
}

.submenu {
	color: white;
	font-size: 12px;
}

.submenu:link {
	text-decoration: none;
	color: #BDBDBD;
}

.submenu:hover {
	text-decoration: none;
	color: #BDBDBD;
}

.submenu:active {
	text-decoration: none;
	color: #BDBDBD;
}

.submenu:VISITED {
	text-decoration: none;
	color: #BDBDBD;
}

.bar {
	color: rgba(255, 255, 255, 0.2);
}

</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<!-- Single button -->
			<div class="nav navbar-nav col-md-12">
			    <div class="btnline col-md-1">

				<div class="btn-group dropup">
					<button type="button" class="btn btn-link btn-xs dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false">
						more greenlight <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/market/">홈으로</a></li>
						<li><a href="/maket/go/HD">핫딜</a></li>
						<li><a href="/market/go/total">전체보기</a></li>
						<li><a href="/market/go/KR">국내</a></li>
						<li><a href="/market/go/GL">해외</a></li>
						<li><a href="/market/go/theme">테마</a></li>
					</ul>
				</div>

				</div>
				<div class="col-md-4">
				<span class="bar">|</span> <a class="submenu" href="/market/privacy">개인정보취급방침</a>
				<span class="bar">|</span> <a class="submenu" href="/market/notice/">고객센터</a>
				</div>
				<div class="col-md-6"></div>
			</div>
		</div>
	</nav>
</body>
</html>