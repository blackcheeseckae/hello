<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<script src="http://code.jquery.com/jquery-latest.js"></script>

		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/productpage.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!</title>
	</head>
	<body>
		<%@ include file="../include/menu.jsp" %>
		<div class="productdetail">
			<!-- 해당 상품의 자세한 페이지 (resource/js 참조)-->
			<form>
			
				<img class="productLeft" src="${product.prd_img}">
				<div class="productRight">
					<p align="left" class="p1">${product.prd_name}</p>
					<p align="left" class="p2">가격: <fmt:formatNumber value="${product.prd_price}" pattern="#,###"/>원</p>
					<p align="left">상품코드: ${product.prd_id}</p>
					<p align="left">수량: <input type="number" id="buy_quantity" min="1" maxlength="2" max="99" value="1" oninput="mxNum(this)" /></p>
					<p align="left">옵션: 
						<select id="prd_opt">
						<!-- 데이터베이스의 옵션 값을 "," 기준으로 나눠서 옵션바에 추가 -->
							<c:forEach items="${fn:split(product.prd_option, ',')}" var="opt">
								<option value="${opt}">${opt}</option>
							</c:forEach>
						</select>
					</p>
					<br><br><br>
					<input type="hidden" name="prd_img" id="prd_img" value="${product.prd_img}" />
					<input type="hidden" name="member_id" id="member_id" value="${member.member_id}" />
					<input type="hidden" name="prd_id" id="prd_id" value="${product.prd_id}" />
					<p align="left">
						<input type="button" name="buy" id="buy" onclick="buyProduct()" value="구매하기" />&nbsp;&nbsp;&nbsp;
						<input type="button" name="cart" id="cart" onclick="insertCart()" value="장바구니" />
						<input type="hidden" name="hiddenbtn" id="hiddenbtn" value="prdpage" />
					</p>
				</div>
			</form>
		</div>
		<br><br><br>
		<div class="detail">
			<table id="proinfo">
				<tr>
					<th><span class="p3">상품 설명</span></th>
				</tr>
				<tr>
					<td>${product.prd_explain}</td>
				</tr>
			</table>
		</div>
		<div class="danger">
			<table style="width: 700px; text-align: left;">
				<tr>
					<th><span class="p1">주의 사항</span></th>
				</tr>
				<tr>
				<td><span class="p1">&nbsp;&nbsp;12시 이전 결제 완료시 당일 배송</span></td>			
				</tr>
				<tr>
				<td><span class="p1">&nbsp;&nbsp;반품 및 교환 요청시 배송비 고객 부담</span></td>
				</tr>
			</table>
		</div>
		<!-- 우측 퀵메뉴 / quickmenu.jsp 참조 -->
		<%@ include file="../include/quickmenu.jsp"%>
		<!-- footer / csinfo.jsp 참조 --> 
		<%@ include file="../include/csinfo.jsp" %>
		<!-- 장바구니 관련 자바스크립트 / cart.js 참조 -->
		<script type="text/javascript" src="resources/js/cart.js" charset="UTF-8"></script>
		<!-- 상품정보 관련 자바스크립트 / product.js 참조 -->
		<script type="text/javascript" src="resources/js/product.js" charset="UTF-8"></script>
	</body>
</html>