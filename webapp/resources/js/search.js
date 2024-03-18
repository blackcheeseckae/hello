//검색어 sPrd를 받아서 검색한 상품의 페이지로 이동시키는 함수
function list(sPrd, page) {
	location.href = "searchPrd?sPrd=" + sPrd + "&curPage=" + page;
}