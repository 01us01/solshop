<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
<script>
	$(function(){
		$("#btnJoin").click(function(){
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			var name = $("#name").val();
			var email = $("#email").val();
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
			if (name == ""){
				alert("이름을 입력하세요");
				$("#name").focus();
				return;
			}
			if (email == ""){
				alert("이메일을 입력하세요");
				$("#email").focus();
				return;
			}
			document.joinform.action = "${path}/member/insert.do";
			document.joinform.submit();
			alert("회원가입이 완료되었습니다.");
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp" %>
	<div class="content">
		<div class="titlename">
			<h2>JOIN</h2>
			<form name="joinform" method="post">
				<div class="join-box">
					<ul>
						<li>아이디</li>
						<li><input type="text" name="userid" id="userid" placeholder="아이디 4글자이상"></li>
						<li>비밀번호</li>
						<li><input type="password" name="passwd" id="passwd" placeholder="비밀번호 8글자이상"></li>
						<li>이름</li>
						<li><input type="text" name="name" id="name" placeholder="이름"></li>
						<li>이메일</li>
						<li><input type="email" name="email" id="email"	 placeholder="이메일"></li>
					</ul>
				</div>
				<input type="button" id= btnJoin value="가입하기">
			</form>
		</div>
	</div>
</body>
</html>