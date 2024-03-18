<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!</title>
<script type="text/javascript" src="resources/js/login.js?129"
	charset="UTF-8"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<!-- membercontroller, login.js 참조 => 로그인 페이지 -->
	<section>
		<div class="login-container">
			<p id ="logop" style="text-align: center;"><img src="resources/img/Logo.png" width="160px" height="65px"></p>
			<input type="text" name="member_id" id="member_id" placeholder="아이디" required>
			<input type="password" name="member_pwd" id="member_pwd" placeholder="비밀번호" required>
			<input type="button" value="Login" onclick="memberCheck()">
			<div class="footer">
				<span onclick="location.href='term'" style="cursor: pointer">회원가입</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span href="#" onclick="forgotPWView()" style="cursor: pointer">비밀번호 찾기</span>
			</div>
		</div>
		<!-- end login-form -->
	</section>
	<%@ include file="../include/quickmenu.jsp"%>
	<%@ include file="../include/csinfo.jsp"%>
</body>
</html>