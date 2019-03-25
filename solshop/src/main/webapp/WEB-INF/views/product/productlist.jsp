<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<div class="content">
		<div class="titlename">
			<div><h2>PRODUCT LIST </h2></div>
			<div class="item-box">
				<ul class="prdlist">
			<c:forEach var="row" items="${list}">
					<li id="item_${row.product_id}" class="item">
						<div><a href="${path}/product/detail/${row.product_id}"><img src="${path}/images/${row.picture_url}" width="220px" height="293px"></a></div>
						<div><a href="${path}/product/detail/${row.product_id}">${row.product_name}</a></div>
						<div><fmt:formatNumber value="${row.price}" pattern="#,###" /></div>
					</li>
			</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>