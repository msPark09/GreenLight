<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
 <style type="text/css">
   @import url("/market/cscenter/noticedetail.css");
</style>
<title>GreenLight</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <script type="text/javascript">
   $(function(){
      $('#notice').addClass("active");
   });
 </script>
 

</head>
<body>
   <div class = "header" >
      <%@ include file = "../../header/csheader.jsp" %>
   </div>
 <div class="container">
 <div class="contents col-md-12">
  <div class="notice col-md-8 col-md-offset-2">
   <img src="/market/img/notice.png" class="img-responsive notimg2">
  </div>

<div class="notable  col-md-12" >
<div class="tablecon  col-md-8 col-md-offset-2">
<div class="table-responsive">
  <table class="table  table-bordered">
    <tr>
         <th width="15%">번호</th>
         <td width="20%">${bean.notid }</td>
         <th width="15%">작성일</th>
         <td width="50%">${bean.notday }</td>
    </tr>
    <tr>
       <th>제목</th>
       <td width="90%" colspan="3">${bean.notitle }</td>
    </tr>
    <tr>
       <th>내용</th>
       <td id="neayong" width="90%"  height="300px" colspan="3">${bean.notcontent }</td>
    </tr>
  </table>
</div>
</div>
</div>

</div><!-- contents div end -->
</div><!-- container div end -->

  <div class = "footer" >
      <%@ include file = "../../footer/footer.jsp" %>
   </div>
</body>
</html>