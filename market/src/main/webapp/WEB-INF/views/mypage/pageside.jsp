<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	var id='${id }';
	if(id==""){
		alert("접속이 종료되었습니다.");
		window.location.replace("/market/logform");
	}else{
		$.ajax({
			'url':'/market/cashcheck?id='+id,
			'error' : function(jqXHR, textStatus) {
				alert("마일리지를 불러오지 못하였습니다.");
// 				alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);
				},
			'success' : function(data) {
				var msg = (data);
				$('.mile').text(msg);
			}
		});

        $.ajax({
           'url':'/market/gradeck?id='+id,
           'error' : function(jqXHR, textStatus) {
              alert("통신실패 " + textStatus + "(code): "   + jqXHR.status);},
           'success' : function(data) {
              var msg = (data);
              $('.grade').text(msg);
              
           }
        }); // gradeck end
		
		$.ajax({
			'url':'/market/copcheck?id='+id,
			'error' : function(jqXHR, textStatus) {
				alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
			'success' : function(data) {
				var msg = (data);
				$('.coupon').text(msg);
				
			}
		}); // copcheck end
	}
	
</script>
	<div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar">
		<div class="list-group">
			<div class="list-group-item">
				<p>${name }님의<br/>마이페이지</p>
				<p>등급 <span class="grade">0</span></p>
				<p>적립금<span class="mile">0</span>Point</p>
				<p>보유쿠폰<span class="coupon">0</span>개</p>
			</div>
			<a href="/market/julist?idx=1" class="list-group-item">상품주문내역</a>
			<a href="/market/wishlist?idx=1" class="list-group-item">위시리스트</a>
			<a href="/market/basket?idx=1" class="list-group-item">장바구니</a>
			<a href="/market/coplist?idx=1" class="list-group-item">쿠폰함</a>
			<a href="/market/cnllist?idx=1" class="list-group-item">결제취소내역</a>
			<a href="/market/editform" class="list-group-item">개인정보수정</a>
			<a href="/market/outform" class="list-group-item">회원탈퇴</a>
			<a href="/market/notice/voc/" class="list-group-item">1:1문의</a>
		</div>
	</div>