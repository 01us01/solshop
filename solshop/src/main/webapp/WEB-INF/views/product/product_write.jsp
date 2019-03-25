<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
	function product_write(){
		//var product_name = document.writeform.product_name.value;
		var product_name=$("#product_name").val();
		var price=$("#price").val();
		var description=$("#description").val();
		if(product_name == ""){
			alert("상품이름을 입력하세요");
			$("#product_name").focus();
			return;
		}
		if(price == ""){
			alert("가격을 입력하세요");
			$("#product_name").focus();
			return;
		}
		if(description == ""){
			alert("상품설명을 입력하세요");
			$("#product_name").focus();
			return;
		}
		document.writeform.action="${path}/product/insert.do";
		document.writeform.submit();
	}
</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
	<div class="content">
		<div class="titlename">
			<h2>상품 등록</h2>
			<form name="writeform" method="post" enctype="multipart/form-data">
				<div class="join-box">
					<ul>
						<li>상품명 <input type="text" name="product_name" id="product_name"></li>
						<li>가격 <input type="number" name="price" id="price"></li>
						<li>상품설명</li>
						<li><textarea name="description" id="description"></textarea></li>
						<li>상품이미지</li>
						<li><input type="file" name="file1" id="file1"></li>
					</ul>
				</div>
				<input type="button" id= btnJoin value="등록" onclick="product_write()" style="width:100px">
				<input type="button" value="목록" onclick="location.href='${path}/product/productlist.do'" style="width:100px">
			</form>
		</div>
	</div>
</body>
</html>