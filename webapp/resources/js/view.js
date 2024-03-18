// 공지사항 게시판의 글삭제 버튼 동작을 위한 함수
$(document).ready(function() {
    // 'deleteButton' id를 가진 요소가 클릭되면 다음 함수를 실행
    $('#deleteButton').on('click', function() {
        // 해당 글의 글번호 값을 변수 bno에 저장
        var bno = $(this).data('bno');

        // SweetAlert를 사용하여 경고창을 띄웁니다.
        swal({
            icon: "warning", // 경고 아이콘 종류 설정
            text: "정말 게시글을 삭제하시겠습니까?", // 표시할 텍스트
            closeOnClickOutside : false, // 바깥 클릭 시 창이 닫히지 않도록 설정
            closeOnEsc : false, // ESC 키로 창이 닫히지 않도록 설정
            buttons: ["돌아가기", "삭제하기"], // 버튼 옵션
        }).then(function(isConfirm) {
            // '삭제하기' 버튼이 클릭되면 (isConfirm가 true일 때) 실행
            if (isConfirm) {
                // 삭제가 완료되었다는 SweetAlert 창을 띄웁니다.
                swal('삭제 완료!','게시글을 삭제했습니다.','success').then(function(isConfirm) {
                    // 사용자에게 알림을 주고, 'delete?bno='+bno URL로 리디렉션합니다.
                    location.href='delete?bno='+bno;
                });
            }
        });
    });
});

// 목록 버튼 동작을 위한 함수
$("#list_btn").click(function(){
    // 페이지를 리디렉팅 합니다. URL에 'board?'를 사용해서 검색어 keyword와 현재 페이지 curPage를 반영한 특정 글목록을 페이지에 출력합니다.
	self.location="board?"
			+ "searchOption=${searchOption}&keyword=${keyword}"
			+ "&search=${search}&curPage=${curPage}";
});

// 고객센터 게시판의 글삭제 버튼 동작을 위한 함수
$(document).ready(function() {
    $('#deleteButton2').on('click', function() {
        // 클릭된 요소의 data-bno 값을 변수 bno에 저장합니다.
        var bno = $(this).data('bno');

        // SweetAlert를 사용하여 경고창을 띄웁니다.
        swal({
            icon: "warning",
            text: "정말 게시글을 삭제하시겠습니까?",
            closeOnClickOutside : false,
            closeOnEsc : false, 
            buttons: ["돌아가기", "삭제하기"],
        }).then(function(isConfirm) {
            if (isConfirm) {
                // 삭제가 완료되었다는 SweetAlert 창을 띄우고, 사용자를 'delete2?bno='+bno URL로 리디렉션합니다.
                swal('삭제 완료!','게시글을 삭제했습니다.','success').then(function(isConfirm) {
                    location.href='delete2?bno='+bno;
                });
            }
        });
    });
});