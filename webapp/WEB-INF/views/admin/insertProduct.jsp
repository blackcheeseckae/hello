<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/ckeditor/ckeditor.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%@ include file="../include/menu.jsp" %>
		<section>
			<h2 align="center">상품등록</h2>
			<form id="fileForm" action="insertProduct" method="POST" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<th>카테고리</th>
						<td>
							<select name="cate_id" id="cate_id" style="width: 150px; height: 24px;">
								<option value="" selected>::선택::</option>
								<option value="HBL">경식구</option>
								<option value="SBL">연식구</option>
								<option value="BTG">배팅 장갑</option>
								<option value="RNG">주루 장갑</option>
								<option value="ALB">알루미늄 배트</option>
								<option value="CBB">카본 배트</option>
								<option value="WDB">나무 배트</option>
								<option value="PTG">투수 글러브</option>
								<option value="DFG">수비용 글러브</option>
								<option value="CTG">포수 미트</option>
								<option value="PRE">보호용품/보호장구</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>품명</th>
						<td>
							<input type="text" name="prd_name" id="prd_name" />
						</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td>
							<input type="text" name="prd_price" id="prd_price" />
						</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>
							<input type="text" name="prd_delivery" id="prd_delivery" />
						</td>
					</tr>
					<tr>
						<th>재고</th>
						<td>
							<input type="text" name="prd_stock" id="prd_stock" />
						</td>
					</tr>
					<tr>
						<th>상품옵션</th>
						<td>
							<input type="text" name="prd_option" id="prd_option" />
						</td>
					</tr>
					<tr>
						<th>할인금액</th>
						<td>
							<input type="text" name="prd_discount" id="prd_discount" />
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="uploadFile" id="uploadFile" />
						</td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>
							<textarea name="prd_explain" id="prd_explain" cols="88" rows="80"></textarea>
							<script>
								CKEDITOR.replace('prd_explain', {});
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" class="buttons" value="물품등록" onclick="doInsertProduct()" />
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