<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="resources/css/board.css?cv">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

</script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/menu.jsp" %>
<title>${board.title}</title>
</head>
<body>
<center>
	<div style="width:1180px;">
	<!-- 글쓰기 페이지 -->
		<br/><br/>
	<form>
		<input type="hidden" name="writer" id="writer" value="${member.member_id}"/>
		<table id="writetable" width="100%">
			<tr>
			<td class="asd" align="center">
			<input type="text" name="title" id="title" placeholder="제목을 입력해주세요" maxlength="70" size="70%" />
			<span id="titleCount" style="color:green;">50</span>/&nbsp;&nbsp;&nbsp;50
			</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="content" id="content" cols="88" rows="80"></textarea>
		<script>
			CKEDITOR.replace( 'content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input type="button" class="write" value="작성하기" onClick="createB()" />
	</form>
	
		<button style="float:right;" class="listp"onClick="location.href='board'">목록</button>
	</div>
</center>
<%@ include file="../include/quickmenu.jsp"%>
<%@ include file="../include/csinfo.jsp" %>
<script src="resources/js/write.js"></script>
</body>
</html>