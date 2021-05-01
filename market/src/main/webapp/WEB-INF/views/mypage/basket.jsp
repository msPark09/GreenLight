<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	.container{
		overflow: hidden;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script src="/market/js/offcanvas.js"></script>
<script type="text/javascript">
	function cancel(data) {
		var basketid = data;
		if (confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?")) {
			window.location.href = "/market/bkcnl?idx="+basketid;
        }else {
            return false;
        }
		
	}
	
	function detail(data) {
		var proid2 = data;
		window.location.href = "/market/detail?id="+proid2;
	}
	
	function buygo(data1,data2) {
		var proid = data1;
		var basketid = data2;
		if (confirm("해당 상품을 구매 하시겠습니까?")) {
			$.ajax({
				'url': "/market/bkcnl?idx="+basketid,
				'error' : function(jqXHR, textStatus, errorThrown) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status+"(errorThrown):"+errorThrown);},
				'success' : function(data) {
					window.location.href = "/market/notice/buy?proid="+proid+"&ticket=&orderticket=";
					
				}		
			});
        }else {
            return false;
        }
	}
	$(document).ready(function() {
		var delurl = window.location.search.substring(1);
		var array = delurl.split('=');
		var cnt = array[1]-1;
		$('.pagecnt').eq(cnt).attr('class','active');
		
		var side = $('#sidebar').height();
		var cont = $('.container').height(); 
		if(cont<side){
			$('.container').height(side);
		}else{
			$('#sidebar').height(cont);
		}
		
	});
</script>
</head>
<body>
	<div class = "header" >
		<%@ include file = "../../header/header.jsp" %>
	</div>
	<div class="container">
		<div class="row marketing row-offcanvas row-offcanvas-right">
				<jsp:include page="pageside.jsp"/>
			<div class="col-xs-12 col-sm-10">
				<p class="pull-right visible-xs">
					<button type="button" id="side_btn" class="btn btn-primary btn-xs" data-toggle="offcanvas">
						<span class="glyphicon glyphicon-list" aria-hidden="true"/>
					</button>
				</p>
				<h3>장바구니</h3>
				<div class="basket_list">
						<div class="col-md-2 col-xs-3">등록일</div>
						<div class="col-md-4 col-xs-6">주문 상세 정보</div>
						<div class="col-md-3 col-xs-3">상품금액</div>
						<div class="col-md-3 visible-md-block visible-lg-block">주문</div>
					<c:if test="${bklist.size() != 0}">
						<c:forEach items="${bklist }" var="bean">
							<div class="col-md-2 col-xs-3">${bean.payd }</div>
							<div class="col-md-2 col-xs-3"><img src="/market/file/${bean.thumb }" alt="${bean.thumb }" class="img-thumbnail"></div>
							<div class="col-md-2 col-xs-3">${bean.proname }</div>
							<div class="col-md-3 col-xs-3">${bean.price }</div>
							<div class="col-md-3 col-xs-12">
								<button type="button" class="btn btn-primary" onclick="detail('${bean.proid }')">상세보기</button>
								<button type="button" class="btn btn-primary" onclick="buygo('${bean.proid }','${bean.basketid }');">주문하기</button>
								<button type="button" class="btn btn-primary" onclick="cancel('${bean.basketid }');">삭제하기</button>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${bklist.size() == 0}">
						<div class="col-md-12 col-xs-12">장바구니가 비었습니다.</div>
					</c:if>	
					<div class="col-md-12 col-xs-12">	
						<nav>
						  <ul class="pagination">
						    <li>
						      <a href="/market/basket?idx=1" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <c:forEach var="i" begin="1" end="${pTot }" step="1">
							    <li class="pagecnt"><a href="/market/basket?idx=${i }">${i }</a></li>
						    </c:forEach>
						    <li>
						      <a href="/market/basket?idx=${pTot }" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<div class="footer">
		<jsp:include page="../../footer/footer.jsp"/>
	</div>
</body>
</html>