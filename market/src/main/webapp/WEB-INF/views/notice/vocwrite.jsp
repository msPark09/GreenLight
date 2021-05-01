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
.container {
	overflow: hidden;
}
.notice{
 text-align: center;
 }
 table{
  margin: 0px auto;
 }
 
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/market/js/bootstrap.min.js"></script>
<script src="/market/js/offcanvas.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var side = $('#sidebar').height();
		var cont = $('.container').height();
		if (cont < side) {
			$('.container').height(side);
		} else {
			$('#sidebar').height(cont);
		}
		
		$('#ok').click(function() {
		var title = $('#title').val();
		var content = $('#content').val();	
			if(title==""){
				alert("제목을 입력해주세요");		
			}else if(title.length>20){
				alert("제목은 20자 이내로 입력해주세요");			
			}else if(content==""){
				alert("문의사항을 입력해주세요");			
			}else if(content.length>4000){
				alert("질문 내용은 4000자를 넘을수 없습니다.");			
			}
			else{		
			alert("문의 사항이 접수 되었습니다.");
			window.location.replace("/market/notice/voc/list?title="+title+"&content="+content);				
			}
			
				
		});
	});

	$(document).ready(function(){
		$('#re').click(function() {
			window.location.replace("/market/notice/voc/")
		});
	});
	</script>
</head>
<body>

	<div class="header">
		<%@ include file="../../header/header.jsp"%>
	</div>
	<div class="container">
		<div class="row marketing row-offcanvas row-offcanvas-right">
			<jsp:include page="../mypage/pageside.jsp" />
			<div class="col-xs-12 col-sm-10">
				<p class="pull-right visible-xs">
					<button type="button" id="side_btn" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">
						<span class="glyphicon glyphicon-list" aria-hidden="true" />
					</button>
				</p>
				<div class="cnt_mid">
					<div class="notice">
						<h3>1:1 문의 작성</h3>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered">
							<tr>
								<th width="10%" class="active">제 목</th>
								<td><textarea rows="1" style="overflow: hidden"
										id="title" name="title" class="form-control"></textarea></td>
							</tr>
							<tr>
								<th width="10%" class="active">문의내용</th>
								<td><textarea rows="30" style="overflow: hidden"
										id="content" name="content" class="form-control"></textarea></td>
							</tr>
						</table>
					</div>
					 <input id="ok" type="button" value="문 의" class="btn btn-success" role="button"> <input
						id="re" type="button" value="취 소" class="btn btn-default">
						<p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<%@ include file="../../footer/footer.jsp"%>
	</footer>
</body>
</html>