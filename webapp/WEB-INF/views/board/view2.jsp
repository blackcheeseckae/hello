<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/view.css?">
<title>${board2.title}</title> <!-- board2의 제목을 사용 -->
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<center>
    <div style="width:1180px;">
        <br/><br/>
    <form>
    <!-- 저장된 글 확인페이지 -->
        <input type="hidden" name="bno" value="${board2.bno}"> <!-- board2의 게시글 번호 -->
        <table border="1" bordercolor="#E1DCDC" id="listtable" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="70">제목</td>
                <td colspan='3' align="left">${board2.title}</td> <!-- board2의 제목 -->
            </tr>
                
            <tr>
                <td>작성자</td>
                <td colspan='3' align="left">${board2.writer}</td> <!-- board2의 작성자 -->
            </tr>
                
            <tr>
                <td>작성일</td>
                <td colspan='3' align="left">
                    <div style="width:150px;float:left;">
                        ${board2.regdate} <!-- board2의 작성일 -->
                    </div>
                    <div>|&nbsp;&nbsp;&nbsp;조회수 : ${board2.viewcnt}</div> <!-- board2의 조회수 -->
                </td>
            </tr>
                
            <tr valign="top">
                <td colspan='4' height="500px">${board2.content}</td> <!-- board2의 내용 -->
            </tr>
        </table>
    </form>
    <div style="margin-top: 10px; margin-bottom:20px;">
        <div align="center" style="float:left; ">
            <c:if test="${map.previousB2 != null}">
                <button class="buttons" onClick="location.href='view2?bno=${map.previousB2.bno}&show=Y'">이전글</button> <!-- board2의 이전글 -->
            </c:if>
            <c:if test="${map.nextB2 != null}">
                <button class="buttons" onClick="location.href='view2?bno=${map.nextB2.bno}&show=Y'">다음글</button> <!-- board2의 다음글 -->
            </c:if>
            &nbsp;&nbsp;&nbsp;게시글 번호 : ${board2.bno} <!-- board2의 게시글 번호 -->
        </div>

        <div style="float:right;">
        <!-- 모든 로그인한 사용자에게 글쓰기 버튼 표시 -->
        <c:if test="${not empty member.member_id}">
            <button class="buttons" onClick="location.href='write2'">글쓰기</button>&nbsp;&nbsp;&nbsp;
        </c:if>
        <!-- 본인 또는 관리자만 수정, 삭제 버튼 표시 -->
        <c:if test="${member.member_id == board2.writer or member.member_id eq 'Administrator'}">
            <button class="buttons" onClick="location.href='updateWrite2'">수정</button>&nbsp;&nbsp;&nbsp;
            <button class="buttons" id="deleteButton2" data-bno="${board2.bno}">삭제</button>&nbsp;&nbsp;&nbsp;
        </c:if>
        
        <button type="button" class="buttons" onClick="location.href='board2'">목록</button> <!-- 고객센터용 목록 경로 -->
        </div>
    </div>
</center>
<%@ include file="../include/quickmenu.jsp"%>
<%@ include file="../include/csinfo.jsp" %>
<script src="resources/js/view.js"></script>
</body>
</html>