<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>야구를 사랑하는 이들을 위한 완벽한 온라인 쇼핑몰! Baseball Wave!</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400,700,800&amp;subset=korean" rel="stylesheet">
</head>
<body>
	<!-- 메뉴바 / menu.jsp 참조 -->
	<%@ include file="include/menu.jsp"%>
	
	<section>
		<!-- 메인 이미지 슬라이드 -->
		<div class="contents">
			<article>
				<div class="banner">
					<ul>
						<!-- searchPrd: 데이터베이스의 PRD_NAME에서 검색값을 쿼리해서 카테고리 페이지로 이동시키는 함수 -->
						<li>
							<img src="https://www.yagooshop.com/shop/data/skin/designbook_giftmall_C/img/banner/1.jpg"
							width="1380px" height="550px" onclick="searchBrand('모리모토')">
						</li>
						<li>
							<img src="https://www.yagooshop.com/shop/data/skin/designbook_giftmall_C/img/banner/4.jpg"
							width="1380px" height="550px" onclick="searchBrand('윌슨')">
						</li>
						<li>
							<img src="https://www.yagooshop.com/shop/data/skin/designbook_giftmall_C/img/banner/7.jpg"
							width="1380px" height="550px" onclick="searchBrand('제트')">
						</li>
						<li>
						<img src="https://yagumania.net/web/upload/NNEditor/20220105/858a4802668519aaaa0d1e1d3abed5f8.jpg"
							 width="1380px" height="550px" onclick="searchBrand('하타케야마')">
						</li>		
					</ul>
				</div>
			</article>
		</div>
		
		<!-- 브랜드 모음 항목 -->
		<div>
			<p class="firstString">Our Brand</p>
			<p class="secondString">브랜드 모음</p>
			<hr>
			<table>
				<tr id="brtr">
					<!-- searchPrd: 데이터베이스의 PRD_NAME에서 검색값을 쿼리해서 카테고리로 이동시키는 함수 -->
					<td id="brtd">
						<img src="resources/img/brand/mizno.png" onclick="searchBrand('미즈노')" 
							style="cursor: pointer" width="250px" height="100px">
					</td>
					<td id="brtd">
						<img src="resources/img/brand/morimoto.png" onclick="searchBrand('모리모토')"
						 style="cursor: pointer" width="250px" height="100px">
					</td>
					<td id="brtd">
						<img src="resources/img/brand/hitake.png" onclick="searchBrand('하타케야마')"
						 style="cursor: pointer" width="250px" height="100px">
					</td>
					<td id="brtd">
						<img src="resources/img/brand/wilson.png" onclick="searchBrand('윌슨')"
						 style="cursor: pointer" width="250px" height="100px">
					</td>
				</tr>
				<tr>
					<td id="brtd">
						<img src="resources/img/brand/zett.png" onclick="searchBrand('제트')"
						 style="cursor: pointer" width="250px" height="100px">
					</td>
					<td id="brtd">
						<img src="resources/img/brand/incojava.png" onclick="searchBrand('인코자바')"
						 style="cursor: pointer" width="250px" height="100px">
					</td>
					<td id="brtd">
						<img src="resources/img/brand/rollings.png" onclick="searchBrand('롤링스')"
						 style="cursor: pointer" width="250px" height="100px">
					</td>
					<td id="brtd">
						<img src="resources/img/brand/gold.png" onclick="searchBrand('골드')"
						 style="cursor: pointer" width="250px" height="100px">
					</td>
				</tr>
			</table>
		</div>
		<br> <br> <br> <br> <br>
		
		
		<!-- 신상품 모음 항목 -->
		<p class="firstString">New! Arrival</p>
		<p class="secondString">언제나 새로운 신상품 모음</p>
		<hr align="center" width="1400px">
		<img id="back" src="resources/img/slider/left.png">
		
		<!-- 신상품 슬라이드 내부에 들어가는 이미지 리스트 -->
		<div class="slide">
			<ul>
				<li id="a">
					<!-- productController의 @RequestMapping("/productpage")를 호출해서 prd_id가 ALB03인 상품의 상세 페이지로 이동 -->
					<a href="productpage?prd_id=ALB000003">
						<img src="resources/img/slider/discount/dc01.png">
					</a>	 
					<a href="productpage?prd_id=ALB000001">
						<img src="resources/img/slider/discount/dc02.png">
					</a> 
					<a href="productpage?prd_id=WDB000003">
						<img src="resources/img/slider/discount/dc03.png">
					</a> 
					<a href="productpage?prd_id=CBB000002">
						<img src="resources/img/slider/discount/dc04.png">
					</a> 
					<a href="productpage?prd_id=PTG000003">
						<img src="resources/img/slider/discount/dc05.png">
					</a>
				</li>
				
				<li id="a">
					<a href="productpage?prd_id=DFG000002">
						<img src="resources/img/slider/discount/dc06.png">
					</a> 
					<a href="productpage?prd_id=CTG000003">
						<img src="resources/img/slider/discount/dc07.png">
					</a> 
					<a href="productpage?prd_id=SBL000004">
						<img src="resources/img/slider/discount/dc08.png">
					</a> 
					<a href="productpage?prd_id=BTG000002">
						<img src="resources/img/slider/discount/dc09.png">
					</a> 
					<a href="productpage?prd_id=PRE000002">
						<img src="resources/img/slider/discount/dc10.png">
					</a>
				</li>
			</ul>
		</div>
		<img id="next" src="resources/img/slider/right.png">

		
		<!-- 가성비 상품 항목 -->
		<p class="firstString">Best! Pick</p>
		<p class="secondString">가성비 좋은 상품 추천</p>
		<hr align="center" width="1400px">
		<img id="back2" src="resources/img/slider/left.png">
		
		<!-- 가성비 상품 슬라이드에 들어가는 이미지 리스트 -->
		<div class="slide2">
			<ul>
				<li id="a">
					<a href="productpage?prd_id=ALB000006">
						<img src="resources/img/slider/cheap/ch1.png">
					</a> 
					<a href="productpage?prd_id=WDB000001">
						<img src="resources/img/slider/cheap/ch2.png">
					</a> 
					<a href="productpage?prd_id=PTG000004">
						<img src="resources/img/slider/cheap/ch3.png">
					</a> 
					<a href="productpage?prd_id=DFG000003">
						<img src="resources/img/slider/cheap/ch4.png">
					</a> 
					<a href="productpage?prd_id=BTG000001">
						<img src="resources/img/slider/cheap/ch5.png">
					</a>
				</li>
				<li id="a">
					<a href="productpage?prd_id=PRE000007">
						<img src="resources/img/slider/cheap/ch6.png">
					</a>
				</li>
			</ul>
		</div>
		<img id="next2" src="resources/img/slider/right.png">
		
		
		<!-- 배송비 무료 상품 항목 -->
		<p class="firstString">Delivery Free!</p>
		<p class="secondString">배송비 무료 상품</p>
		<hr align="center" width="1400px">
		<img id="back3" src="resources/img/slider/left.png">
		
		<!-- 배송비 무료 상품 이미지 슬라이드 -->
		<div class="slide3">
			<ul>
				<li id="a">
					<a href="productpage?prd_id=ALB000007">
						<img src="resources/img/slider/free/fr1.png">
					</a> 
					<a href="productpage?prd_id=WDB000002">
						<img src="resources/img/slider/free/fr2.png">
					</a> 
					<a href="productpage?prd_id=CBB000004">
						<img src="resources/img/slider/free/fr3.png">
					</a> 
					<a href="productpage?prd_id=PTG000001">
						<img src="resources/img/slider/free/fr4.png">
					</a> 
					<a href="productpage?prd_id=DFG000001">
						<img src="resources/img/slider/free/fr5.png">
					</a>
				</li>
				<li id="a">
					<a href="productpage?prd_id=CTG000001">
						<img src="resources/img/slider/free/fr6.png">
					</a> 
					<a href="productpage?prd_id=PRE000001">
						<img src="resources/img/slider/free/fr7.png">
					</a> 
					<a
					href="productpage?prd_id=RNG000001">
						<img src="resources/img/slider/free/fr8.png"> 
					</a>
				</li>
			</ul>
		</div>
		<img id="next3" src="resources/img/slider/right.png">
		
	</section>
	<!-- 우측 퀵메뉴 / quickmenu.jsp 참조 -->
	<%@ include file="include/quickmenu.jsp"%>
	<!-- footer / csinfo.jsp 참조 --> 
	<%@ include file="include/csinfo.jsp"%>
	<!-- 메인페이지 자바스크립트 / mypage.js 참조 -->
	<script src="resources/js/main.js"></script>
</body>
</html>