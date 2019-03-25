<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.admin_name != null }">
<div style="text-align: left; width:956px; margin:0 auto">관리자 로그인중(${sessionScope.admin_userid})</div>
</c:if>
<div id="head">
<div class="navbar">
	<div id="topleft">
		<ul>
			<li><a href="${path}/home/about.do">About</a></li>
			<li><a href="${path}/product/productlist.do">SHOP</a></li>
			<c:if test="${sessionScope.admin_userid != null }">
			<li><a href="${path}/product/product_write.do">REG</a></li>
			</c:if>
			<li><a href="${path}/board/boardlist.do">BOARD</a></li>
		</ul>
	</div>
	<div id="topcenter">
		<ul id="image">
			<li><a href="${path}"><img src="${path}/resources/images/Asset 12.png" width="65px" height="60px"></a></li>
		</ul>
	</div>
	<div id="topright">
		<ul>
			<c:choose>
				<c:when test="${sessionScope.userid == null}">
					<li><a href="${path}/member/login.do">LOGIN</a></li>
					<li><a href="${path}/member/join.do">JOIN</a></li>
					<li><a href="${path}/admin/login.do">ADMIN LOGIN</a>
				</c:when>
				<c:otherwise>
					<li><a href="${path}/cart/cartlist.do">WISH</a></li>
					<li><a href="${path}/member/logout.do">LOGOUT</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
<div style="height: 92px"></div>
</div>