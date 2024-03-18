<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/signup.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!</title>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<section>
		<div></div>
		<form name="f1rm" id="f1rm">
		<!-- 회원가입 페이지(signup.js) -->
			<h2 align="center">회원가입</h2>
			<br><br>
			<table id="jointable">
				<tr>
					<th>아이디</th>
				</tr>
				<tr>
					<td><input type="text" id="member_id" class="input" onFocus="" />
						<input type="button" onClick="idChk()" style="cursor: pointer"
						value="중복확인" /><br> <label id="idchk"></label></td>
				</tr>
				<tr>
					<th>비밀번호</th>
				</tr>
				<tr>
					<td><input type="password" id="member_pwd" class="input"
						maxlength="20" /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
				</tr>
				<tr>
					<td><input type="password" id="chk_member_pwd" class="input"
						maxlength="20" /> <label id="checkPasswd"></label></td>
				</tr>
				<tr>
					<th>이름</th>
				</tr>
				<tr>
					<td><input type="text" id="member_name" class="input"><br>
						<label id="chkname"></label></td>
				</tr>
				<tr>
					<th>생년월일</th>
				</tr>
				<tr>
					<td><select id="birth_year">
							<option value="">년</option>
							<c:forEach var="i" begin="0" end="${2024-1900}">
								<c:set var="yearOption" value="${2024-i}" />
								<option value="${yearOption}">${yearOption}</option>
							</c:forEach>
					</select> <select id="birth_month">
							<option value="">월</option>
							<c:forEach var="j" begin="1" end="12">
								<option value="${j}">${j}</option>
							</c:forEach>
					</select> <select id="birth_day">
							<option value="">일</option>
					</select> 

					<label id="birchk"></label></td>
				</tr>
				<tr>
					<th>이메일(선택)</th>
				</tr>
				<tr>
					<td><input type="text" size="15" id="email_id" class="input">
						@ <input type="text" size="15" id="email_addr" class="input"
						disabled> <select id="email_select">
							<option value="" selected>::선택하세요::</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="1">직접입력</option>
					</select></td>
				</tr>
				<tr>
					<th>연락처(선택)</th>
				</tr>
				<tr>
					<td><select id="NUMst">
							<option value="" selected>::선택::</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
					</select> - <input type="text" id="NUMnd" class="input" maxlength="4"
						size="4" /> - <input type="text" id="NUMrd" class="input"
						maxlength="4" size="4" /></td>
				</tr>
				<tr>
					<th>주소</th>
				</tr>
				<tr>
					<td><input type="text" name="member_zipcode"
						id="member_zipcode" class="input" readonly size="10"> <input
						type="button" onclick="searchPost()" style="cursor: pointer"
						value="우편번호 찾기"><br>
					<br> <input type="text" name="member_faddr" id="member_faddr"
						class="input" size="60" readonly></td>
				</tr>
				<tr>
					<th>상세주소</th>
				</tr>
				<tr>
					<td><input type="text" name="member_laddr" id="member_laddr"
						class="input" size="60"></td>
				</tr>
				<tr>
					<td><input type="button" onclick="doSignup()"
						style="cursor: pointer" value="회원가입" /></td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="../include/quickmenu.jsp"%>
	<%@ include file="../include/csinfo.jsp"%>
	<script src="resources/js/signup.js" charset="UTF-8"></script>
</body>
</html>