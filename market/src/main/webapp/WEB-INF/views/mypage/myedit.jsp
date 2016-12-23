<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">

	function onlynum() {
		if ((event.keyCode<48)||(event.keyCode>57)){
			alert ("숫자로 입력해주세요.");
		    event.returnValue = false;	
		   }
	};
	
	$(document).ready(function() {
		
		
		$('#nextbtn').click(function() {
			$('span').text("");
			if($('#editNic').val() == ""){
				$('.editNic').text("이름을 입력해주세요.");
				$('.editNic').focus();
				return;
			}
			if($('#editPw').val() == ""){
				$('.editPw').text("비밀번호를 입력해주세요.");
				$('.editPw').focus();
				return;
			}
			if($('#editPwRe').val() == ""){
				$('.editPwRe').text("비밀번호를 한번더 확인해주세요.");
				$('.editPwRe').focus();
				return;
			}
			if($('#editPw').val() != $('#editPwRe').val()){
				$('.editPwRe').text("비밀번호가 다릅니다.");
				$('.editPwRe').focus();
				return;
			}
			if($('#editPhone').val() == ""){
				$('.editPhone').text("전화번호를 입력해주세요.");
				$('.editPhone').focus();
				return;
			}
			if (confirm("회원정보를 수정 하시겠습니까?")) {
				$('#editform').attr('method','post');
				$('#editform').attr('action','./edit');
				$('#editform').submit();
	        }else {
	            return false;
	        }
		});
	});
</script>
</head>
<body>
	<div class="content">
		<div class="row marketing">
			<div class="col-lg-2">
				<jsp:include page="pageside.jsp"/>
			</div>
			<div class="col-lg-10">
				<form id="editform">
					<div class="cont_top">
						<h2>회원정보수정</h2>
					</div>
					<div class="cont_mid">
						<div class="cont">
							<div class="form-group">
								<input type="text" name="id" id="editId" class="form-control"value="${bean.id }" readonly="readonly"/>
								<span class="editId"></span>
							</div>
							<div class="form-group">
								<input type="text" name="name" id="editNic" class="form-control" placeholder="이름을 입력해주세요" value="${bean.name }"/>
								<span class="editNic"></span>
							</div>
							<div class="form-group">
								<input type="password" name="pw" id="editPw" class="form-control" placeholder="비밀번호를 입력해주세요(8~20자)"/>
								<span class="editPw"></span>
							</div>
							<div class="form-group">
								<input type="password" name="pwre" id="editPwRe" class="form-control" placeholder="비밀번호를 한번더 확인해주세요(8~20자)"/>
								<span class="editPwRe"></span>
							</div>
							<div class="form-group">
								<input type="text" name="phone" id="editPhone" class="form-control" placeholder="휴대폰 번호를 ‘–’ 없이 입력해주세요" onkeypress="onlynum();" value="${bean.phone }"/>
								<span class="editPhone"></span>
							</div>
						</div>
					</div>
					<div class="cont_low">
						<button type="button" class="btn btn-success" id="nextbtn">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>		
</body>
</html>