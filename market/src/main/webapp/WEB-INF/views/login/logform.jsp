<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GreenLight</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
  @import url("/market/login/logform.css");
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $('#logbtn').click(function() {
         
         $.ajax({
            'url':'./logcheck?id='+$('#logId').val()+'&pw='+$('#logPw').val(),
            'error' : function(jqXHR, textStatus, errorThrown) {
               alert("통신실패 " + textStatus + "(code): "   + jqXHR.status+"(errorThrown):"+errorThrown);},
            'success' : function(data) {
               var msg = (data);
               if(msg>0){
                  $('#logform').attr('method','post');
                    $('#logform').attr('action','./login');
                    $('#logform').submit();
               }else{
                  alert("ID또는 PW가 틀렸습니다.");
               }
               
            }
         });
         
      });
   });
</script>
</head>
<body>
<div class=header><%@ include file = "../foothead/loghead.jsp" %></div>
<div class="container">
   <div class="contents col-md-12 col-sm-12">
   <div class="col-md-3 col-sm-2"></div>
   <form id="logform" class="col-md-6 col-sm-8">
      <div class="cont_top col-md-12">
      </div>
      <div class="logbox">
      <div class="cont_mid">
         <div class="form-group">
            <input type="text" name="id" id="logId" class="form-control" placeholder="아이디를 입력해주세요."/>
         </div>
         <div class="form-group">
            <input type="password" name="pw" id="logPw" class="form-control" placeholder="패스워드를 입력해주세요."/>
         </div>
         <div>
            <button type="button" class="btn btn-success btn-block" id="logbtn">로그인</button>
         </div>
      </div>
      <div class="cont_low">
         <a href="./gaip">회원가입</a>
         <span id="bar">|</span>
         <a href="./selidpw">ID/PW찾기</a>
      </div>
      </div>
   </form>
      <div class="col-md-3 col-sm-2" ></div>
   </div>
   </div>
   <div class=footer><%@ include file = "../foothead/logfoot.jsp" %></div>
</body>
</html>