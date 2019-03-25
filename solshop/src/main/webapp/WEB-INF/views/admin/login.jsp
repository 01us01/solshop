<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>
	$(function(){
		$("#btnlogin").click(function(){
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return;
			}
			if (passwd == "") {
				alert("패스워드를 입력하세요");
				$("#passwd").focus();
				return;
			}
			document.loginform.action = "${path}/admin/login_check.do";
			document.loginform.submit();
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<div class="titlename">
			<h2>ADMIN LOGIN</h2>
			<form name="loginform" method="post">
				<div class="join-box">
					<ul>
						<li><input type="text" id="userid" name="userid" placeholder="관리자 아이디 입력" style="background: #f8c7c7"></li>
						<li><input type="password" id="passwd" name="passwd" placeholder="비밀번호 입력" style="background: #f8c7c7"></li>
					</ul>
				</div>
					<input type="button" id="btnlogin" value="LOGIN"><br> 
					<input type="button" id="btnjoin" value="JOIN">
				<div>
					<c:if test="${message == 'error' }">
					<script>alert("로그인 정보가 맞지 않습니다.")</script>
					</c:if>
				</div>
			</form>
		</div>
	</div>

</body>
</html>