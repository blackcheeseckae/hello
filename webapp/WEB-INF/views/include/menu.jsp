<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/login.js" charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/include.css">

<table>
	<!-- 회원 정보 관련 메뉴 -->
	<tr>
		<td colspan="3">
			<div id="icon" align="left">
				<form name="frm" id="frm">
					<input type="hidden" id="myp" value="${myp}" />
					<!-- 사용자의 로그인 상태에 따라 회원정보 메뉴바의 내용을 변경 -->
					<c:choose>
						<c:when test="${member.member_id eq 'Administrator'}">
						<span class="menubutton">Administrator님 환영합니다.</span>
							<span class="menubutton"
								onclick="location.href='prdinsert'" style="cursor: pointer">상품등록</span>
							<span class="menubutton"
								onclick="location.href='productList'" style="cursor: pointer">상품조회</span>
							<span class="menubutton"
								onclick="location.href='logout'" style="cursor: pointer">로그아웃</span>
						</c:when>
						<c:when test="${member.member_id == null}">
							<span class="menubutton" onclick="location.href='term'" style="cursor: pointer">회원가입</span>
							<span class="menubutton" onclick="location.href='login'" style="cursor: pointer">로그인</span>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="member_id" name="member_id" value="${member.member_id}" />
							<span class="menubutton">${member.member_id} 님 환영합니다.</span>
							<span class="menubutton" onclick="location.href='logout'" style="cursor: pointer">로그아웃</span>
							<span class="menubutton" onclick="productCart()" style="cursor: pointer">장바구니</span>
							<span class="menubutton" onClick="mypBtn()" style="cursor: pointer">마이페이지</span>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
			<hr>
		</td>
	</tr>
	
	<tr>
		<!-- 로고 이미지 -->
		<td id="logo" style="width: 200px;">
			<a href="main">
				<img src="resources/img/Logo.png" width="160px" height="65px">
			</a>
		</td>
		<!-- 검색바 메뉴 -->
		<td style="width: 800px;">
			<div id="searchbar">
				<input type="text" name="sPrd" id="sPrd" placeholder="검색어 입력"
					onkeypress="if(event.keyCode == 13) {searchPrd(); return;}">
				<button type="button" id="searchBtn" onclick="searchPrd()"
					style="cursor: pointer">
					<strong>검색</strong>
				</button>
			</div>
		</td>
		<!-- 배너 이미지 -->
		<td style="width: 200px;">
			<a href="main">
				<p class="MM" id="canvasContainer">BASEBALL WAVE!</p>
			</a>	
		</td>
	</tr>
</table>


<!-- productController.java에서 해당 메뉴를  category.jsp 로 전송해서 출력-->
<div id="nav">
	<ul>
		<li>배트
			<ul>
				<li onclick="location.href='category?cate_id=ALB'">알루미늄 배트</li>
				<li onclick="location.href='category?cate_id=WDB'">나무 배트</li>
				<li class="liBot" onclick="location.href='category?cate_id=CBB'">카본/컴포짓
					배트</li>
			</ul>
		</li>
		<li>글러브
			<ul>
				<li onclick="location.href='category?cate_id=PTG'">투수용 글러브</li>
				<li onclick="location.href='category?cate_id=DFG'">수비용 글러브</li>
				<li class="liBot" onclick="location.href='category?cate_id=CTG'">포수용 미트</li>
			</ul>
		</li>
		<li>야구공
			<ul>
				<li onclick="location.href='category?cate_id=HBL'">경식 야구공</li>
				<li class="liBot" onclick="location.href='category?cate_id=SBL'">연식
					야구공</li>
			</ul>
		</li>
		<li>장갑
			<ul>
				<li onclick="location.href='category?cate_id=BTG'">배팅 장갑</li>
				<li class="liBot" onclick="location.href='category?cate_id=RNG'">주루 장갑</li>
			</ul>
		</li>
		<li onclick="location.href='category?cate_id=PRE'">보호용품</li>
		<li>게시판
			<ul>
				<li onclick="location.href='board'">공지사항</li>
				<li onclick="location.href='board2'">고객센터</li>
			</ul>
		</li>
	</ul>
	<hr>
</div>
<br>
<!-- 메뉴바 관련 자바스크립트 / menu.js 참조 -->
<script src="resources/js/menu.js" charset="UTF-8"></script>