<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>GreenLight</title>
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
<link href="/market/css/bootstrap-theme.css" rel="stylesheet">
<style type="text/css">
.focus-box{
   display: block;
    margin-bottom: 40px;
   vertical-align: middle;
    max-height: 320px;
    max-width: 320px;
}

</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      
      var id='${id }';
      if(id==""){
         alert("접속이 종료되었습니다.");
         window.location.replace("/market/logform");
         return false;
      }else{
         $.ajax({
            'url':'/market/cashcheck?id='+id,
            'error' : function(jqXHR, textStatus) {
               alert("통신실패 " + textStatus + "(code): "   + jqXHR.status);},
            'success' : function(data) {
               var msg = (data);
               $('.mile').text(msg);
               
            }
         }); // cashcheck end
         
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
               alert("통신실패 " + textStatus + "(code): "   + jqXHR.status);},
            'success' : function(data) {
               var msg = (data);
               $('.coupon').text(msg);
               
            }
         }); // copcheck end
         
      } //if end
   });
</script>

</head>
<body>
   <div class="header">
      <%@ include file="../../header/header.jsp"%>
   </div>
   <div class="container">
         <div class="row">
           <p>&nbsp;</p>
         </div>
         <div class="jumbotron">
         <div class="row marketing">
            <div class="col-md-3">
               <img src="/market/img/mypage.png" alt="avata.png" />
            </div>
            <div class="col-md-4">
           
               <h2>${name }님의 마이페이지</h2>
         
            </div>
            <div class="col-md-3 col-md-offset-2">
               <p>
					등급 <span class="grade">0</span><br/>
					적립금 <span class="mile">0</span>Point<br/>
					보유쿠폰 <span class="coupon">0</span>개
               </p>
            </div>
         </div>
      </div>
      <!-- list img col-lg-3 col-md-4 col-xs-6 -->
     <div class="row marketing">
      <!-- list img -->
      <div class="col-xs-12 col-md-12">
            <!-- 1.상품주문내역 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/julist?idx=1"> 
               <img src="/market/img/my1-2.png"
                  onmouseover="this.src='/market/img/my1-1.png'"
                  onmouseout="this.src='/market/img/my1-2.png'"
                  border="0" alt="" /></a>
         </div>
         <!-- 2.위쉬리스트 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/wishlist?idx=1"> 
               <img src="/market/img/my2-2.png"
                  onmouseover="this.src='/market/img/my2-1.png'"
                  onmouseout="this.src='/market/img/my2-2.png'"
                  border="0" alt="" /></a>
         </div>
         <!-- 3.장바구니 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/basket?idx=1"> 
               <img src="/market/img/my3-2.png"
                  onmouseover="this.src='/market/img/my3-1.png'"
                  onmouseout="this.src='/market/img/my3-2.png'"
                  border="0" alt="" /></a>
         </div>
         <!-- 4.쿠폰함 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/coplist?idx=1"> 
               <img src="/market/img/my4-2.png"
                  onmouseover="this.src='/market/img/my4-1.png'"
                  onmouseout="this.src='/market/img/my4-2.png'"
                  border="0" alt="" /></a>
         </div>
         <!-- 5.결제취소 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/cnllist?idx=1"> 
               <img src="/market/img/my5-2.png"
                  onmouseover="this.src='/market/img/my5-1.png'"
                  onmouseout="this.src='/market/img/my5-2.png'"
                  border="0" alt="" /></a>
         </div>
         <!-- 6.개인정보수정 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/editform"> 
               <img src="/market/img/my6-2.png"
                  onmouseover="this.src='/market/img/my6-1.png'"
                  onmouseout="this.src='/market/img/my6-2.png'"
                  border="0" alt="" /></a>
         </div>
         <!-- 7.회원탈퇴 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/outform"> 
               <img src="/market/img/my7-2.png"
                  onmouseover="this.src='/market/img/my7-1.png'"
                  onmouseout="this.src='/market/img/my7-2.png'"
                  border="0" alt="" /></a>
         </div>
         <!-- 8.고객센터 -->
          <div class="col-xs-6 col-md-3 focus-box">
               <a href="/market/notice/voc/"> 
               <img src="/market/img/my8-2.png"
                  onmouseover="this.src='/market/img/my8-1.png'"
                  onmouseout="this.src='/market/img/my8-2.png'"
                  border="0" alt="" /></a>
         </div>
       </div>
    </div>
         <!-- list img end -->
   </div>
   <!-- /container -->


   <footer class="footer">
      <%@ include file="../../footer/footer.jsp"%>
   </footer>

</body>
</html>