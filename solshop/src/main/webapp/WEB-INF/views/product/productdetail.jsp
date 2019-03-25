<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="longcontent">
		<div class="titlename">
			<h2>PRODUCT LIST </h2>
			<div class="item-box">
				<ul class="prdlist">
					<li id="item_${dto.product_id}" class="itemdetail">
						<div><img src="${path}/images/${dto.picture_url}" width="350px" height="465px"></a></div>
					</li>
				</ul>
				<ul style="text-align: left">
					<li>
						<div class="prdtitle">${dto.product_name}</div>
						<div class="prdcomm">
							상품명 ${dto.product_name}<br>
							가격 <fmt:formatNumber value="${dto.price}" pattern="#,###" />
						</div>
						<div class="prddesc">
							${dto.description}
						</div>
					</li>
					<li>
						<form name="wishform1" method="post" action="${path}/cart/cartinsert.do">
						<div class="amountpart">수량
							<select name="amount">
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<input type="hidden" name="product_id" value="${dto.product_id}">
							<input type="submit" value="WISHLIST">
						</div>
						</form>
					</li>
				</ul>
			</div>
			<div class="line">
				<hr>
			</div>
			<div class="detailshot">
				<ul>
					<li><img src="${path}/resources/images/${dto.picture_url}" width="700" height="932"></li>
					<li><img src="${path}/resources/images/${dto.picture_url}" width="700" height="932"></li>
					<li><img src="${path}/resources/images/${dto.picture_url}" width="700" height="932"></li>
				</ul>
			</div>
		</div>
</div>
</body>
</html>