<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>GreenLight</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<link href="/market/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
@import url("/market/cscenter/notice.css");
</style>

</head>
<body>
   <div class="header">
      <%@ include file="../header/header.jsp"%>
   </div>

   <div class="container">
      <div class="contents">
         <div class="jumbotron">
            <div class="row marketing">
               <div class="center col-md-8 col-xs-12">
                  <!-- <h1 class="h1">GREENLIGHT<br/>고객센터</h1> -->
                  <img alt="" src="/market/img/cscenter.png" class="img-responsive">
               </div>
               <div class="talkbox col-xs-12 col-md-4">
                  <div class="katalk col-xs-6 col-md-12">
                     <img alt="" src="/market/img/katalk.png" class="img-responsive">
                  </div>
                  <div class="call col-xs-6 col-md-12">
                     <img alt="" src="/market/img/callimg.png" class="img-responsive">
                  </div>
               </div>
            </div>
         </div>
         <div class="row marketing">
            <div class="menubar col-md-12  col-xs-12">
               <div class="col-md-4 col-xs-12">
                  <a href="/market/notice/noticelist/"> 
                  <img src="/market/img/notice1-1.png"
                      onmouseover="this.src='/market/img/notice1-2.png'"
                      onmouseout="this.src='/market/img/notice1-1.png'"
                      onclick="this.src='/market/img/notice1-2.png'"
                      class="menuimg img-responsive" border="0" /></a>
               </div>
               <div class="col-md-4 col-xs-12">
                  <a href="/market/notice/qna/">
                  <img src="/market/img/notice2-1.png"
                      onmouseover="this.src='/market/img/notice2-2.png'"
                      onmouseout="this.src='/market/img/notice2-1.png'"
                       onclick="this.src='/market/img/notice2-2.png'"
                      class="menuimg img-responsive" border="0" /></a>
               </div>
               <div class="col-md-4 col-xs-12">
                  <a href="/market/notice/event/">
                  <img src="/market/img/notice3-1.png"
                      onmouseover="this.src='/market/img/notice3-2.png'"
                      onmouseout="this.src='/market/img/notice3-1.png'"
                       onclick="this.src='/market/img/notice3-2.png'"
                      class="menuimg img-responsive" border="0" /></a>
               </div>
            </div>
         </div>
         <!-- row marketing end -->
      </div>
   </div>
   <div class="footer">
      <jsp:include page="../footer/footer.jsp" />
   </div>
</body>
</html>