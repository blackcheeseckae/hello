//카테고리 페이지에서 페이지 번호를 눌렀을 때 리디렉팅 하는 함수
function list(cate_id, page) {
	location.href="category?cate_id="+cate_id+"&curPage="+page;
}