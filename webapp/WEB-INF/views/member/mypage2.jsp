<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html lang="ko">
	<head>
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css?">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
		
		<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!</title>
	</head>
	<body>
		<%@ include file="../include/menu.jsp"%>
		<h2>비밀번호 확인</h2>
		<table class="pwcheck" style="float: center;">
		<!-- 회원정보 수정 페이지(mypage.js) -->
			<tr>
				<td width="80" id="mytd">회원 아이디</td>
				<td width="180">${member.member_id}</td>
			</tr>
			<tr>
				<td id="mytd">비밀번호</td>
				<td><input type="password" size="20" id="member_pwd1" placeholder="비밀번호 확인" /></td>
			</tr>
		</table>
		<br><br>
		<div class="checkbtn" align="center">
			<form id="myInfo">
				<!-- 회원 비밀번호 체크 -->
				<input type="button" id="mybt" class="confirm" value="확인" onClick="mypg2()" />&nbsp;&nbsp;&nbsp;
				<input type="button" id="mybt" class="cancel" value="취소" onClick="" />
			</form>
		</div>
		<%@ include file="../include/quickmenu.jsp"%>
		<%@ include file="../include/csinfo.jsp"%>
		<script src="resources/js/mypage.js"></script>
	</body>
</html>