<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE htm>
<html lang="ko">
	<head>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/js/mypage.js" charset="UTF-8"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!</title>
	</head>
	<body>
		<%@ include file="../include/menu.jsp"%>
		<div align="center">
			<h2 class="my">MY PAGE</h2>
			<table class="list">
			
			</table>
		</div>	
		<div class="order">
			<table cellpadding="0" cellspacing="0" class="orderlist" align="center" width="950">
			<tr align="right">
			<td colspan="4" width="70%"></td>
			<td><input type="button" class="revise" value="회원 정보 수정" onClick="location.href='mypage2'">
			<input type="button" class="delete" value="회원 정보 삭제" onClick=""></td>
			</tr>
			<!-- 주문한 상품 정보 -->
				<tr class="orderbar" align="center">
					<td>번호</td>
					<td>주문일자</td>
					<td>상품명</td>
					<td>결제금액</td>
					<td>배송현황</td>
				</tr>
				<!-- 마이페이지 "주문내역" -->
				<c:forEach begin="0" end="${(fn:length(map.mypL))}" var="i">
					<c:set var="row" value="${map.mypL[i]}" />
					<c:choose>
						<%-- 검색결과가 있을 때 --%>
						<c:when test="${not empty row}">
							<tr bgcolor="#fff" height="50">
								<td align="center">${row.payment_id}</td>
								<td align="center">${row.payment_date}
								<td>${row.prd_name}</td>
								<td align="center"><fmt:formatNumber value="${row.prd_sum}" pattern="#,###"/>원</td>
								<td align="center">${row.delivery}</td>
							</tr>
						</c:when>
						<%-- 검색결과가 없을 떄 --%>
						<c:when test="${map.count == 0}">
							<tr style="text-align: center;">
								<td colspan='5'><b>주문내역이 없습니다.</b></td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</table>
			<!-- 페이지 네비게이션 출력 -->
			<div align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="mypL?myp=1&member_id=${member_id}">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="mypL?myp=${map.pager.prevPage}&member_id=${member_id}">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color: red;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="mypage?member_id=${member_id}&myp=${num}">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="mypL?myp=${map.pager.nextPage}&member_id=${member_id}">[다음]</a>
				</c:if>
				<c:if test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
					<a href="mypL?myp=${map.pager.totPage}&member_id=${member_id}">[끝]</a>
				</c:if>
			</div>
		</div>
		
		<%@ include file="../include/quickmenu.jsp"%>
		<%@ include file="../include/csinfo.jsp"%>
	</body>
</html>