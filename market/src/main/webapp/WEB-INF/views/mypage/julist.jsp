<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function cancel(data) {
		var ordid = data;
		if (confirm("주문을 취소 하시겠습니까?")) {
			window.location.href = "./jucnl?idx="+ordid;
        }else {
            return false;
        }
		
	}

	$(document).ready(function() {
		var delurl = window.location.search.substring(1);
		var array = delurl.split('=');
		var cnt = array[1]-1;
		$('.pagecnt').eq(cnt).attr('class','active');
		
	});
</script>
</head>
<body>
	<div class="content">
		<div class="row marketing">
			<div class="col-lg-2">
				<jsp:include page="pageside.jsp"/>
			</div>
			<div class="col-lg-10">
				<h3>상품주문내역</h3>
				<div class="jumun_list">
					<table class="table table-bordered">
						<tr>
							<td>주문일자</td>
							<td colspan="2">주문 상세 정보</td>
							<td>상품금액</td>
							<td>주문확인/취소</td>
						</tr>
					<c:if test="${julist.size() != 0}">
						<c:forEach items="${julist }" var="bean">
						<tr>
							<td>${bean.payd }</td>
							<td>${bean.thumb }</td>
							<td>${bean.proname }</td>
							<td>${bean.paycash }</td>
							<td>
								<button type="button" class="btn btn-primary">상세보기</button>
								<c:if test="${bean.cancel == 0 }">
								<button type="button" class="btn btn-primary" onclick="cancel('${bean.orderid }');">주문취소</button>
								</c:if>
								<c:if test="${bean.cancel == 1 }">
								<p>취소중</p>
								</c:if>
								<c:if test="${bean.cancel == 2 }">
								<p>취소완료</p>
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${julist.size() == 0}">
						<tr>
							<td colspan="5">주문내역이 없습니다.</td>
						</tr>
					</c:if>		
					</table>
					<nav>
					  <ul class="pagination">
					    <li>
					      <a href="./julist?idx=1" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach var="i" begin="1" end="${pTot }" step="1">
						    <li class="pagecnt"><a href="./julist?idx=${i }">${i }</a></li>
					    </c:forEach>
					    <li>
					      <a href="./julist?idx=${pTot }" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
	</div>
</body>
</html>