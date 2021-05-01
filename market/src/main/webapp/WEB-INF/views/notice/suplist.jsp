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
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
#faqimg{
   margin-top: 5%;
   margin-bottom: 2%;
}

.faqlist{
   margin-bottom: 20%;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
   $(function(){
      $('#faq').addClass("active");
   });
   </script>
</head>
<body>
 <div class="header">
      <%@ include file="../../header/csheader.jsp"%>
   </div> 
<div class="container">
      <div class="contents col-md-12">
         <div class="faq col-md-8 col-md-offset-2">
            <img id="faqimg" src="/market/img/faq.png" class="img-responsive">
         </div>
      </div>

      <div class="faqlist col-md-8 col-md-offset-2">
         <div class="panel-group" id="accordion" role="tablist"
            aria-multiselectable="false">
            <c:forEach items="${list }" varStatus="status" var="faq">
               <div class="panel panel-default">
                  <div class="panel-heading" role="tab" id="heading${status.count }" style="background-color:  rgb(61, 117 ,74); color: white;">
                     <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapse${status.count}" aria-expanded="false"
                           aria-controls="collapse${status.count}"> <strong>[ #
                              ${status.count} ] </strong> ${faq.voctitle}
                        </a>
                     </h4>
                  </div>
                  <div id="collapse${status.count}" class="panel-collapse collapse"
                     role="tabpanel" aria-labelledby="heading${status.count}">
                     <div class="panel-body">
                        <strong>Q . </strong> ${faq.voccontent}
                     </div>
                     <div class="panel-body">
                        <c:if test="${faq.answer ne null }">
                           <strong>A . </strong> ${faq.answer}
                        </c:if>
                        <c:if test="${faq.answer eq null }">
                           <strong>A . </strong> 답변을 준비중입니다.
                        </c:if>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>
</div>

<div class="footer">
      <%@ include file="../../footer/footer.jsp"%>
   </div>
</body>
</html>