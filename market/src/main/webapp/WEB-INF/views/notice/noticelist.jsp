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
<style type="text/css">
    @import url("/market/cscenter/noticelist.css");
</style>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/market/js/bootstrap.min.js"></script>
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

   <div class="col-md-8 col-md-offset-2">
   <c:forEach items="${list }" var="pop">
      <c:if test="${!empty pop.notfile }">
      <img id="notimg" src="/market/file/${pop.notfile }"  class="img-responsive">
      </c:if>
   </c:forEach>
   </div>

</div>
<div class="notable  col-md-12" >
<div class="tablecon  col-md-8 col-md-offset-2">
<div class="table-responsive">
<table class="table table-bordered" >
   <tr>   
      <th>제  목</th>
      <th width="20%">작성일</th>
   </tr>
   <c:forEach items="${list }" var="bean">
      <c:if test="${empty bean.notfile }">
      <tr>
         <td><a href="/market/notice/detail/${bean.notid }" >${bean.notitle }</a></td>
         <td>${bean.notday }</td>
      </tr>
      </c:if>
   </c:forEach>
</table>
</div>
</div>
</div>   
</div>
   <div class = "footer" >
      <%@ include file = "../../footer/footer.jsp" %>
   </div>
</body>
</html>