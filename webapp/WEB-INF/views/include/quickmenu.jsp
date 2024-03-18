<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/include.css">
</head>

<body>
 <!-- 플로팅 메뉴 설정 -->
<div id="floatMenu">

<p class="quickmenu" onclick="location.href='board'" >공지사항</p>

<p class="quickmenu" onclick="location.href='board2'" style="cursor: pointer">고객센터</p>

<p class="quickmenu" onclick="alert('Baseball Wave 문의전화 번호는 1522-1234 입니다.')" style="cursor: pointer">문의전화</p>

</div>

 <!-- 맨 위로 이동 -->
<button class="scroll-top" id="js-button">
    <i class="fa fa-chevron-up" id="topbutton">TOP</i>
</button>
<script src="resources/js/menu.js" charset="UTF-8"></script>
</body>
</html>