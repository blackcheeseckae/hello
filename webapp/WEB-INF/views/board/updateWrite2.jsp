<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="resources/css/view.css?">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/menu.jsp" %>
<title>${board2.title}</title>
</head>
<body>
<center>
	<div style="width:1180px;">
		<div style="float:right;">
		</div>
		<br/><br/>
	<!-- 수정 페이지 -->
	<form>
		<input type="hidden" name="bno" id="bno" value="${board2.bno}"/>
		<table border="1" bordercolor="#E1DCDC" cellpadding="0" cellspacing="0" width="100%" id="uptable">
			<tr>
			<td width="70">제목</td>
			<td align="left">
			<input type="text" name="title" id="title" size="70%" maxlength="100" 
			value="${board2.title}" />
			<span id="titleCount" style="color:green;">50</span><span>/50</span>
			</td>
			</tr>
				
			<tr>
			<td>작성자</td>
			<td align="left">${board2.writer}</td>
			</tr>
				
			<tr>
			<td>작성일</td>
			<td align="left">${board2.regdate}</td>
			</tr>
				
			<tr>
			<td>조회수</td>
			<td align="left">${board2.viewcnt}</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="content" id="content" cols="88" rows="80">${board2.content}</textarea>
		<script>
   		 	CKEDITOR.replace( 'content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input id="list_btn" class="buttons" type="button" value="저장" onclick="updateB2()" />
	</form>
		<button id="list_btn" class="buttons" style="float:right;" onclick="location.href='board'">목록</button>
	</div>
</center>
<%@ include file="../include/quickmenu.jsp"%>
<%@ include file="../include/csinfo.jsp" %>
<script src="resources/js/update.js"></script>
</body>
</html>