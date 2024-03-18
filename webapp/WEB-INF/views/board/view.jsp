<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/view.css?">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>${board.title}</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<center>
	<div style=" width:1180px;">	
		<br/><br/>
	<form>
		<!-- 저장된 글 확인페이지 -->
		<input type="hidden" name="bno" value="${board.bno}">
		<table border="1" bordercolor="#E1DCDC" id="listtable" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td width="70">제목</td>
			<td colspan='3' align="left">${board.title}</td>
			</tr>
				
			<tr>
			<td>작성자</td>
			<td colspan='3' align="left">${board.writer}</td>
			</tr>
				
			<tr>
			<td>작성일</td>
			<td colspan='3' align="left">
			<div style="width:150px;float:left;">
			${board.regdate}  
			</div>
			<div>
			|&nbsp;&nbsp;&nbsp;조회수 : ${board.viewcnt}
			</div>
			</td>
			</tr>
				
			<tr valign="top">
			<td colspan='4' height="500px">${board.content}</td>
			</tr>
		</table>
	</form>
	<div style="margin-top: 10px; margin-bottom:20px;">
	<div align="center" style="float:left; ">
			<c:if test="${map.previousB != null}">
			<button class="buttons" onClick="location.href='view?bno=${map.previousB.bno}&show=Y'">이전글</button>
			</c:if>
			<c:if test="${map.nextB != null}">
			<button class="buttons" onClick="location.href='view?bno=${map.nextB.bno}&show=Y'">다음글</button>
			</c:if>
			&nbsp;&nbsp;&nbsp;게시글 번호 : ${board.bno}
		</div>

		<div style="float:right;">
		<!-- 관리자만 공지 -->
		<c:if test="${member.member_id eq 'Administrator'}">
			<button class="buttons" onClick="location.href='write'">글쓰기</button>&nbsp;&nbsp;&nbsp;
		</c:if>
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${member.member_id == board.writer}">
			<button class="buttons" onClick="location.href='updateWrite'">수정</button>&nbsp;&nbsp;&nbsp;
			<button class="buttons" id="deleteButton" data-bno="${board.bno}">삭제</button>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<button type="button" class="buttons" onClick="location.href='board'">목록</button>
		</div>
		</div>
		</div>
	</div>
	
	
	<br/><br/><br/>
	<!-- 현재 글을 기준으로 이전글,다음글 리스트 -->
	<div align="center">
		<table class="simpleView" width="800">
			<c:if test="${map.previousB != null}">
			<tr class="a">
				<td onClick="location.href='view?bno=${map.previousB.bno}&show=Y'"
				style="cursor: pointer">이전글</td>
				<td onClick="location.href='view?bno=${map.previousB.bno}&show=Y'"
				style="cursor: pointer;width:400px;">${map.previousB.title}</td>
				<td class="tdS">${map.previousB.writer}</td><td class="tdS">${map.previousB.regdate}</td>
			</tr>
			</c:if>
			<c:if test="${map.nextB != null}">
			<tr class="b">
				<td onClick="location.href='view?bno=${map.nextB.bno}&show=Y'" style="cursor: pointer">다음글</td>
				<td  onClick="location.href='view?bno=${map.nextB.bno}&show=Y'" 
				style="cursor: pointer;width:400px;">${map.nextB.title}</td>
				<td class="tdS">${map.nextB.writer}</td><td class="tdS">${map.nextB.regdate}</td>
			</tr>
			</c:if>
		</table>
	</div>
</center>
<%@ include file="../include/quickmenu.jsp"%>
<%@ include file="../include/csinfo.jsp" %>
<script src="resources/js/view.js"></script>
</body>
</html>