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
		var wishid = data;
		if (confirm("해당 상품을 위시리스트에서 삭제 하시겠습니까?")) {
			window.location.href = "./wishcnl?idx="+wishid;
        }else {
            return false;
        }
		
	}
	
	function basketgo(pro,wish) {
		var proid = pro;
		var wishid = wish;
		if (confirm("해당 상품을 장바구니에 추가 하시겠습니까?")) {
			window.location.href = "./basketgo?proid="+proid+"&wishid="+wish;
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
				<h3>위시리스트</h3>
				<div class="basket_list">
					<table class="table table-bordered">
						<tr>
							<td colspan="2">상품 상세 정보</td>
							<td>상품금액</td>
							<td>주문</td>
						</tr>
					<c:if test="${whlist.size() != 0}">
						<c:forEach items="${whlist }" var="bean">
						<tr>
							<td>${bean.thumb }</td>
							<td>${bean.proname }</td>
							<td>${bean.price }</td>
							<td>
								<button type="button" class="btn btn-primary">상세보기</button>
								<button type="button" class="btn btn-primary" onclick="basketgo('${bean.proid }','${bean.wishid }');">장바구니로</button>
								<button type="button" class="btn btn-primary" onclick="cancel('${bean.wishid }');">삭제하기</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${whlist.size() == 0}">
						<tr>
							<td colspan="5">위시리스트가 비었습니다.</td>
						</tr>
					</c:if>		
					</table>
					<nav>
					  <ul class="pagination">
					    <li>
					      <a href="./wishlist?idx=1" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach var="i" begin="1" end="${pTot }" step="1">
						    <li class="pagecnt"><a href="./wishlist?idx=${i }">${i }</a></li>
					    </c:forEach>
					    <li>
					      <a href="./wishlist?idx=${pTot }" aria-label="Next">
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