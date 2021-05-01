<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GreenLight</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
@import url("/market/login/gaip.css");
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#allYN').click(function() {
			if ($("#allYN").is(':checked') == true) {
				$('input[type="checkbox"]').prop('checked', true);
			} else {
				$('input[type="checkbox"]').prop('checked', false);
			}
		});
		$('#nextbtn').click(function() {
			if ($("#serviceYN").is(':checked') != true) {
				alert("서비스이용 약관 동의가 필요합니다.");
				$("#serviceYN").focus();
				return;
			}
			if ($("#privacyYN").is(':checked') != true) {
				alert("개인정보 수집/이용 약관 동의가 필요합니다.");
				$("#privacyYN").focus();
				return;
			}

			$('#bfjoin').attr('method', 'post');
			$('#bfjoin').attr('action', './joinform');
			$('#bfjoin').submit();
		});
	});
</script>


</head>
<body>
	<div class="head"><%@ include file="../foothead/loghead.jsp"%></div>
	<div class="container">
	    <div class="col-md-3"></div>
		<div class="contents col-md-6">
				<form id="bfjoin">
					<div class="cont_top">
						<h1>회원가입</h1>
						<p id="signup">SIGN UP</p>
					</div>
					<div class="cont_mid">
						<div class="cont">
							<h3>서비스이용 약관 동의(필수)</h3>
							<div class="agreebox">
								<div class="inner" id="service"><%@ include file="./service.jsp"%></div>
							</div>

							<input type="checkbox" name="serviceYN" id="serviceYN"> <label
								for="serviceYN">약관에 동의합니다.</label>

							<hr>
							<h3>개인정보 수집/이용 약관 동의(필수)</h3>
							<div class="agreebox">
								<div class="inner" id="privacy"><%@ include file="./service.jsp"%></div>
							</div>
							<input type="checkbox" name="privacyYN" id="privacyYN"> <label
								for="privacyYN">약관에 동의합니다.</label>
							<div>
								<input type="checkbox" name="allYN" id="allYN"> <label
									for="allYN">전체 동의</label>
							</div>
						</div>
					</div>
					<div class="cont_low">
						<button type="button" class="btn btn-success" id="nextbtn">
							<span>다음</span>
						</button>
					</div>
				</form>

		</div>
		<div class="col-md-3"></div>
	</div>
	<div class="foot"><%@ include file="../foothead/logfoot.jsp"%></div>
</body>
</html>