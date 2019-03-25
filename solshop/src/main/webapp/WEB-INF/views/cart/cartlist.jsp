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
		$("#btnDeleteAll").click(function(){
			if(confirm("장바구니를 비우시겠습니까?")){
				location.href="${path}/cart/deleteAll.do";
			}
		});
	});
	

</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<div class="content">
		<div class="content2">
			<div class="wishtitle"><h2>WISH LIST</h2></div>
			<div class="blank"></div>
			<div class="wishcontainer">
				<div class="wishlist">
					<div class=w1><h4>일반상품</h4></div>
					<form name="wishform" method="post" action="${path}/cart/update.do">
					<table border="0" class="wishtable">
						<colgroup>
							<col style="width:30px">
							<col style="width:95px">
							<col style="width:350px">
							<col style="width:108px">
							<col style="width:100px">
							<col style="width:108px">
							<col style="width:120px">
						</colgroup>
						<thead>
							<tr style="height: 50px; border-bottom: 1px solid black;">
								<th scope="col"></th>
								<th scope="col">상품이미지</th>
								<th scope="col">상품 정보</th>
								<th scope="col">판매가</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col">선택</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="row" items="${map.list}">
							<tr>
								<td></td>
								<td><img src="${path}/resources/images/${row.picture_url}" width="100px" height="120px"></td>
								<td>
									${row.product_name}<br><br>							
									${row.description}
								</td>
								<td>${row.price}</td>
								<td>
									<input type="number" name="amount" value="${row.amount}" style="width: 40px; margin-bottom: 10px; ">
									<input type="hidden" name="cart_id" value="${row.cart_id}"><br>
									<button id="btnUpdate">수정</button>
								</td>
								<td>${row.money}</td>
								<td>
									<!-- <input type="button" id="btnDelete" value="삭제"> -->
									<a href="${path}/cart/delete.do?cart_id=${row.cart_id}" >삭제</a>
							</tr>
						</c:forEach>
						<tfooter class="wishright">
							<tr>
								<td></td>
								<td></td>
								<td>
									<c:choose>
										<c:when test="${map.count == 0}">
											장바구니가 비었습니다.	
										</c:when>
									</c:choose>
								</td>
								<td></td>
								<td></td>
								<td>총합계 : </td>
								<td>${map.sum}</td>
							</tr>
						</tfooter>
						</tbody>
					</table>
					</form>
					<div style="text-align: right;">
						<button type="button" id="btnDeleteAll">장바구니 비우기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>