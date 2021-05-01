<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GreenLight</title>
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
<link href="/market/css/offcanvas.css" rel="stylesheet">

<style type="text/css">
.container {
	overflow: hidden;
}

notice {
	text-align: center;
}

table {
	margin: 0px auto;
}

th {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script src="/market/js/offcanvas.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var side = $('#sidebar').height();
	var cont = $('.container').height();
	if (cont < side) {
		$('.container').height(side);
	} else {
		$('#sidebar').height(cont);
	}
});
</script>
</head>
<body>
	<div class="header">
		<%@ include file="../../header/header.jsp"%>
	</div>
	<div class="container">
		<div class="row marketing row-offcanvas row-offcanvas-right">
			<jsp:include page="../mypage/pageside.jsp" />
			<div class="col-xs-12 col-sm-10">
				<p class="pull-right visible-xs">
					<button type="button" id="side_btn" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">
						<span class="glyphicon glyphicon-list" aria-hidden="true" />
					</button>
				</p>
				<div class="cnt_mid">
					<div class="notice">
						<h3>1:1문의 답변</h3>
					</div>


					<div class="table-responsive">
						<table class="table table-bordered">
							<tr>
								<th width="10%" class="active">제목</th>
								<td>${bean.voctitle }</td>
							</tr>
							<tr>
								<th width="10%" class="active">문의내용</th>
								<td>${bean.voccontent }</td>
							</tr>
							<tr>
								<th width="10%" class="active">답변</th>

								<c:if test="${empty bean.answer  }">
									<td>빠린시일내로 답변 드리겠습니다.</td>
								</c:if>
								<c:if test="${!empty bean.answer  }">
									<td >${bean.answer }</td>
								</c:if>

							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<%@ include file="../../footer/footer.jsp"%>
	</footer>
</body>
</html>