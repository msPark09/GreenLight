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

<style type="text/css">
@import url("/market/cscenter/eventlist.css");
a{
text-align: center;
}
#eimg{
   margin: 0 auto;
   margin-bottom: 3%;
}

.btnbox{
  text-align: center;
}

.btn{ 
  display:inline-block; 
  background-color:rgb(61, 117, 74); 
  border-style: none;
  border-radius: 0px;
  
}



</style>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(function() {
      $('#event').addClass("active");
   });
</script>
</head>
<body>
   <div class="header">
      <%@ include file="../../header/csheader.jsp"%>
   </div>

   <div class="container">

      <div class="contents col-md-12">
         <div class="event col-md-8 col-md-offset-2">
            <img id="evenimg" src="/market/img/event.png" class="img-responsive">
         </div>
      </div>

<c:forEach items="${list }" var="bean">

      <div class="col-md-12">
      <div class="col-md-8  col-md-offset-2">
         <img id="eimg" alt="${bean.eimg}" src="/market/file/${bean.eimg }" class="img-responsive">
      </div>
      </div>
      
      <div class="col-md-12">
      <div class="btnbox col-md-8 col-md-offset-2">
      <a href="http://${bean.eurl }" role="button" class="btn btn-success"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> 관련 화면으로 이동하기</a>
      </div>
      </div>
<div class="col-md-12 col-xs-12 clearfix">
            <hr>
         </div>
</c:forEach>
   </div>
   <!-- container end -->
   <div class="footer">
      <%@ include file="../../footer/footer.jsp"%>
   </div>

</body>
</html>