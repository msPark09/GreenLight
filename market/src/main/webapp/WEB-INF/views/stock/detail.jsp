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
td, th {
	text-align: center;
}
.thumbnail .caption {
	width: 100%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
		remain();
	$('.showQ').hide();
	 $('.qProVoc').hide();
		
	$( "#selDetail" ).change(function() {
		window.console.log($(this).val());
		var params=$(this).val().split("&");
		remain();
	});
	 $('.QnA').click(function(){
		var whos = $(this).attr('class').split(" ")
		window.console.log(whos[1]);
		$('.S'+whos[1]).toggle();
		return false;
	}); 
	

	 $('.qBtn').click(function(){
		 var id='${sessionScope.id}';
		 if(id==""){
			 alert("로그인 후 이용 가능합니다.");
		 }else{			 
		 $('.qProVoc').toggle();
		 }
	 });
	 $('#vocinser').submit(function(){
		 var customid='${sessionScope.id}';
		 var proid='${bean.proid}';
		 var voctitle=$('#voctitle').val();
		 var voccontent=$('#voccontent').val();
		 //alert(proid);
		 $.ajax({
				'url' : "/market/insertVoC",
				'data' : {
					"proid":proid,
					"voctitle" :voctitle,
					"voccontent" : voccontent,
					"customid":customid
				},
				'success' : function(data,textStatus,jqXHR) {
					alert("문의가 등록되었습니다. 답변에는 1~5일 소요됩니다.\n문의하신 내용은 마이페이지에서 확인 가능합니다.");
					location.reload();
				},
				'error' : function(jqXHR,textStatus) {
					window.console.log("통신실패 "+ textStatus+ "(code): "+ jqXHR.status);
				}
			});
			return false;
	 });
	 $('#buyGo').submit(function(){
		 var customid='${sessionScope.id}';
		 if(customid == ""){
			 alert("로그인 후 결제 가능합니다.");
			 location.replace("/market/logform");
			 return false;
		 }else{
			 $("#buyGo").attr("method","post");
			 $("#buyGo").attr("action","/market/notice/buy");
			 return;
		 }
		 
	 });
	 $('#cart').click(function(){
		 var customid='${sessionScope.id}';
		 var proid='${bean.proid}';
		 if(customid == ""){
			 alert("로그인 후 사용 가능합니다.");
			 location.replace("/market/logform");
		 }else{
			 $.ajax({
					'url' : "/market/insertBasket",
					'data' : {
						"proid":proid,
						"customid":customid,						
					},
					'success' : function(data,textStatus,jqXHR) {
						data = data.replace(/\+/gi,'%20');
						data = decodeURIComponent(data);
						 var result = window.confirm(data+"\n장바구니로 이동하시겠습니까?");
						 if(result){
							 location.replace("/market/basket?idx=1");
						 }
					},
					'error' : function(jqXHR,textStatus) {
						window.console.log("통신실패 "+ textStatus+ "(code): "+ jqXHR.status);
					}
				});			 
		 }
			 return false;
	 });
	 
	 $(document).on("click",".wish",function() {
			var wishtext = $(this).html().split(" ");
			//var heartW = wishtext[3].text();
			var proid = '${bean.proid}';
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
function remain(){
		var params=$('#selDetail').val().split("&");
		var proid='${bean.proid}';
    	var maxp = '${bean.maxp}';
		$.ajax({
			'url' : "/market/remainTicket",
			'data' : {
				"proid":proid,
				"startday" : params[0],
				"trans" : params[1]
			},
			'success' : function(data,textStatus,jqXHR) {
				var remainp = maxp - data;
				$('#remain').text(remainp);
				$('#orderticket').attr("value",remainp);
				if(remainp<=4){
					$('.Eventtag').text("매진 임박! 서두르세요! :)");
				}
			},
			'error' : function(jqXHR,textStatus) {
				window.console.log("통신실패 "+ textStatus+ "(code): "+ jqXHR.status);
			}
		});
		return false;
};

</script>
</head>
<body>
	<div class="header">
		<%@ include file="../../header/header.jsp"%>
	</div> 
	<div class="container">
		<div class="section-header">
			<br>
			<h2 class="section-title text-center">${bean.proname }</h2>
		
			<!-- 상품 네비게이션바 -->
			<ol class="breadcrumb">
				<li><a href="/market/">Home</a></li>
				<li><a href="/market/go/total">전체 리스트</a></li>
				<li><a href="/market/go/${bean.cat }">${cat }</a></li>
				<li class="active">${bean.loc }</li>
			</ol>
			<!-- 상품 네비게이션바 end-->

		</div>
		<div class="row">
			<div class="col-md-6 wow fadeInLeft col-xs-12">
				<img
					src="/market/file/${bean.thumb }" alt="${bean.proid }"  class="img-thumbnail">
			</div>
			<div class="col-xs-12 col-md-6">
			<c:if test="${bean.event eq 1 }">
			<h3>핫딜 상품입니다! 핫딜 기회를 놓치지 마세요! :)</h3>
			</c:if>
				<c:if test="${bean.event eq 2 }">
			<h3>마감임박!</h3>
			</c:if>
				<c:if test="${bean.event eq 3 }">
			<h3>신규 상품입니다! 신규 이벤트를 확인하세요 :)</h3>
			</c:if>
			<h3 class="Eventtag"></h3>
				<form name="prodetail" id="buyGo">
				<input hidden="hidden" name="proid" value="${bean.proid }">
				<input hidden="hidden" id="orderticket" name="orderticket">
					<div style="overflow-x: auto;">
						<table class="table table-border table-hover">
							<tr>
								<td class="active"><strong>지역</strong></td>
								<td colspan="3">${bean.loc }</td>
							</tr>
							<tr>
								<td class="active"><strong>여행기간</strong></td>
								<td colspan="3">${bean.peris }</td>
							</tr>
							<tr>
								<td colspan="4" class="active"><strong>출발일&교통편</strong></td>
							</tr>
							<tr>
								<td colspan="4">
									<select id="selDetail" name = "ticket" class="form-control input-default">
										<c:forEach items="${detail }" var="dbean">
											<option value="${dbean.startday }&${dbean.trans }">${dbean.startday }&${dbean.trans }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td class="active">남은 티켓 수</td>
								<td id="remain"></td>
								<td class="active">최대출발인원</td>
								<td>${bean.maxp }</td>
							</tr>
							<tr>
								<td class="active"><center><strong>가격</strong></center></td>
								<td colspan="3">
								<c:if test="${bean.discount eq 0 }">
									<fmt:formatNumber
										value="${bean.price-(bean.price%10) }"
										type="currency" currencySymbol="￦" />
								</c:if>
								<c:if test="${bean.discount ne 0 }">
									<small><s><fmt:formatNumber
										value="${bean.price-(bean.price%10) }"
										type="currency" currencySymbol="￦" /></s></small>
										<strong><em><fmt:formatNumber
											value="${(bean.price*(1-bean.discount))-((bean.price*(1-bean.discount))%10) }"
											type="currency" currencySymbol="￦" /></em></strong>
								</c:if>
								</td>
							</tr>
						</table>
					</div>
					<div class="container show-grid" style="width: 700px;">
						<input class="btn btn-success" type="submit" value="결제하기">
						<a href="#" role="button" class="btn btn-danger wish">
						<c:if test="${wishOk eq 0}">
						 <span class="glyphicon glyphicon-heart-empty heartE "></span>
						</c:if>
						<c:if test="${wishOk ne 0}">
						 <span class="glyphicon glyphicon-heart heart "></span>
						</c:if>
						</a>
						<a class="btn btn-primary" id="cart" role="button" href="#"><span class="glyphicon glyphicon-shopping-cart"> 장바구니</span></a>
						<input class="btn btn-default" type="reset" value="취소">
					</div>
				</form>
			</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-xs-12 clearfix">
					<hr>
				</div>
				<div class="col-md-12 col-xs-12">
					<div class="col-md-1">&nbsp;</div>
					<div class="col-md-10">
						<img alt="${bean.img }" src="/market/file/${bean.img }" style="width: 100%; text-align: center; margin: 5px;">
					</div>
					<div class="col-md-1">&nbsp;</div>
 				</div>
			</div>
		<div class="row">
			<div class="col-md-12 col-xs-12 clearfix">
				<hr>
			</div>
			<div class="col-xs-12 col-md-12">
				<h3>상품 리뷰</h3>
				<c:if test="${bean.point ne 0 }">
					<h5>별점 : ${bean.point } 점</h5>
					<div class="col-xs-12 col-md-12">
				<div class="panel-group" id="accordionR" role="tablist" aria-multiselectable="false">
					<c:forEach items="${relist }" varStatus="status" var="review">
			 		 <div class="panel panel-default">
			   			<div class="panel-heading" role="tab" id="Rheading${status.count }">
			     		<h4 class="panel-title">
			       		<a data-toggle="collapse" data-parent="#accordionR" href="#Rcollapse${status.count}" aria-expanded="false" aria-controls="Rcollapse${status.count}">
			         		<strong>${review.customid } : </strong> ${review.title}
			        	</a>
			      		</h4>
			    		</div>
			    		<div id="Rcollapse${status.count}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="Rheading${status.count}">
			      			<div class="panel-body">
			      			<strong>[ ${review.score }점 ]</strong> ${review.contents}
			      			</div>
			    		</div>
			  		</div>
			 	</c:forEach>
			</div>
			</div>
				</c:if>
				<c:if test="${bean.point eq 0 }">
					<h5>별점 : 아직 점수가 없습니다. 상품 리뷰를 작성해 별점을 주세요 :)</h5>			
				</c:if>
			</div>
			<div class="col-md-12 col-xs-12 clearfix">
					<hr>
			</div>
			<div class="col-xs-12 col-md-12">
				<h3>상품 문의</h3>
				<button class="btn btn-info qBtn" style="float: right">상품 문의하기</button>
				<p>&nbsp;</p>
			</div>
			<div class="qProVoc col-md-12 col-xs-12">
				<form action="insertVoC" method="post" id="vocinser">
						<div class="form-group col-md-3">
						<label for="customid" class="control-label">아이디 </label>
							<input
								type="text" class="form-control" id="customid" name="customid"
								value="${sessionScope.id }" readonly="readonly">
						</div>
						<div class="form-group col-md-9">
							<label for="voctitle" class="control-label">문의 제목</label> <input
								type="text" class="form-control" id="voctitle" name="voctitle">
						</div>
						<div class="col-md-3">
						&nbsp;
						</div>
						<div class="form-group col-md-9">
							<label for="voccontent" class="control-label">문의 내용</label>
							<textarea class="form-control" rows="10" id="voccontent"
								name="voccontent"></textarea>
						</div>
						<div class="form-group col-md-9">
						<button type="submit" class="btn btn-success">입력</button>
						<button type="reset" class="btn btn-default">취소</button>
						</div>
						</form>
						
			</div>
			<div class="col-xs-12 col-md-12">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
					<c:forEach items="${vocPro }" varStatus="status" var="voc">
			 		 <div class="panel panel-default">
			   			<div class="panel-heading" role="tab" id="heading${status.count }">
			     		<h4 class="panel-title">
			       		<a data-toggle="collapse" data-parent="#accordion" href="#collapse${status.count}" aria-expanded="false" aria-controls="collapse${status.count}">
			         		<strong>${voc.customid } : </strong> ${voc.voctitle}
			        	</a>
			      		</h4>
			    		</div>
			    		<div id="collapse${status.count}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${status.count}">
			      			<div class="panel-body">
			      			<strong>Q . </strong> ${voc.voccontent}
			      			</div>
			      			<div class="panel-body">
			      			<c:if test="${voc.answer ne null }">
			       				<strong>A . </strong> ${voc.answer}
			      			</c:if>			      
			      			<c:if test="${voc.answer eq null }">
			       				<strong>A . </strong> 답변을 준비중입니다.
			      			</c:if>
			      			</div>
			    		</div>
			  		</div>
			 	</c:forEach>
			</div>
			</div>
			<div class="col-md-12 col-xs-12 clearfix">
					<hr>
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
