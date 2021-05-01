<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
 .container{
 	margin-bottom:40px;
 }
</style>
<title>GreenLight</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
</head>
<body>
<div class="header">
		<%@ include file="../../header/header.jsp"%>
</div>
<div class="container">
<div class="row col-md-12">
	<div style="text-align:center" class="col-md-4 col-md-offset-4">
		<img src="/market/img/logo5_104x83.png" alt="thumblogo">
	</div>
	<div class="col-md-6 col-md-offset-3">
		<h3 style="text-align:center">결제가 성공되었습니다</h3>
		<h3 style="text-align:center">저희 그린라이트를 이용해 주셔서 감사합니다</h3>
	</div>
	<div  style="text-align:center" class="col-md-4 col-md-offset-4">
        <a class="btn btn-default" href="/market/" role="button">메인화면으로</a>
        <a class="btn btn-info" href="/market/go/total" role="button">다른상품보기</a>
	</div>
</div>	
</div>
<div class="footer">
		<%@ include file="../../footer/footer.jsp"%>
</div>
</body>
</html>