<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!'s</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	</head>
	<body>
		<%@ include file="../include/menu.jsp" %>
		<section>
			<h2 align="center">상품 조회</h2>
			<form name="f3rm" id="f3rm" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<th>카테고리</th>
						<th>이미지</th>
						<th>품명</th>
						<th>품번</th>
						<th>가격</th>
						<th>이미지 경로</th>
					</tr>
					<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
						<c:set var="product" value="${map.list[i]}" />
						<c:if test="${not empty product}">
							<tr>
								<td>${product.cate_id}</td>
								<td><img src="${product.prd_img}" width="100" height="100"></td>
								<td>${product.prd_name}</td>
								<td>${product.prd_id}</td>
								<td>${product.prd_price}</td>
								<td>${product.prd_img}</td>
							</tr>
						</c:if>
					</c:forEach>
				<tr>
					<td colspan="7" align="center">
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('1')">[처음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<span style="color:red;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="list('${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock < map.pager.totPage}">
							<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
		</section>
		<%@ include file="../include/quickmenu.jsp"%>
		<%@ include file="../include/csinfo.jsp" %>
		<script src="resources/js/product.js" charset="UTF-8"></script>
	</body>
</html>