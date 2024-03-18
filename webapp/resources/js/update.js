// 게시글 수정버튼 동작을 위한 함수
function updateB() {
    // 입력 폼에서 값 가져오기
    var bno = $("#bno").val(); // 게시글 번호
    var title = $("#title").val(); // 게시글 제목
    var content = CKEDITOR.instances.content.getData(); // CKEditor로부터 게시글 내용 가져오기
    var titleLength = title.length; // 제목의 길이 계산

    // 제목이 비어있는 경우 경고 창 표시
    if (!title) {
        swal("error", "제목을 입력하세요.", "error");
    // 제목의 길이가 50자를 초과하는 경우 경고 창 표시
    } else if (titleLength > 50) {
        swal("", "제목이 너무 깁니다.", "error");
    // 내용이 비어있는 경우 경고 창 표시
    } else if (content == "") {
        swal("error", "글내용을 입력해 주세요!!.", "error");
        return false; // 함수 실행 종료
    } else {
        // 수정 여부를 묻는 경고 창 표시
        swal({
            icon: "warning",
            text: "정말 수정 하시겠습니까?",
            closeOnClickOutside: false, // 밖을 클릭하면 창이 닫히지 않도록 설정
            closeOnEsc: false, // Esc 키를 눌러도 창이 닫히지 않도록 설정
            buttons: ["돌아가기", "수정 완료!"], // 버튼 설정
        }).then(function(isConfirm) {
            // 수정 완료를 선택한 경우
            if (isConfirm) {
                swal('수정 완료!', '게시글 수정을 완료했습니다.^^', 'success').then(
                    function(isConfirm) {
                        // 성공 메시지 표시 후, AJAX를 이용해 서버에 수정 요청 전송
                        $.ajax({
                            type: "POST",
                            url: "updateBoard", //boardcontroller의 updateBoard 호출
                            data: {
                                "bno": bno,
                                "title": title,
                                "content": content
                            },
                            success: function(data) {
                                // 요청 성공 시, 해당 게시글 보기 페이지로 리디렉트
                                location.href = "view?bno=" + bno + "&show=Y";
                            }
                        });
                    });
            }
        })
    }
}


// 고객센터 게시글 수정버튼 동작을 위한 함수
function updateB2() {
    // 입력 폼에서 값 가져오기
    var bno = $("#bno").val(); // 게시글 번호
    var title = $("#title").val(); // 게시글 제목
    var content = CKEDITOR.instances.content.getData(); // CKEditor로부터 게시글 내용 가져오기
    var titleLength = title.length; // 제목의 길이 계산

    // 제목이 비어있는 경우 경고 창 표시
    if (!title) {
        swal("error", "제목을 입력하세요.", "error");
    // 제목의 길이가 50자를 초과하는 경우 경고 창 표시
    } else if (titleLength > 50) {
        swal("", "제목이 너무 깁니다.", "error");
    // 내용이 비어있는 경우 경고 창 표시
    } else if (content == "") {
        swal("error", "글내용을 입력해 주세요!!.", "error");
        return false; // 함수 실행 종료
    } else {
        // 수정 여부를 묻는 경고 창 표시
        swal({
            icon: "warning",
            text: "정말 수정 하시겠습니까?",
            closeOnClickOutside: false, // 밖을 클릭하면 창이 닫히지 않도록 설정
            closeOnEsc: false, // Esc 키를 눌러도 창이 닫히지 않도록 설정
            buttons: ["돌아가기", "수정 완료!"], // 버튼 설정
        }).then(function(isConfirm) {
            // 수정 완료를 선택한 경우
            if (isConfirm) {
                swal('수정 완료!', '게시글 수정을 완료했습니다.^^', 'success').then(
                    function(isConfirm) {
                        // 성공 메시지 표시 후, AJAX를 이용해 서버에 수정 요청 전송
                        $.ajax({
                            type: "POST",
                            url: "updateBoard2", //boardcontroller의 updateBoard 호출
                            data: {
                                "bno": bno,
                                "title": title,
                                "content": content
                            },
                            success: function(data) {
                                // 요청 성공 시, 해당 게시글 보기 페이지로 리디렉트
                                location.href = "view2?bno=" + bno + "&show=Y";
                            }
                        });
                    });
            }
        })
    }
}




// 글 수정 페이지의 동작을 위한 각종 함수
$(document).ready(function() {
    // 제목 입력 필드에 키업 이벤트 핸들러 등록
    $('#title').keyup(function() {
        // 현재 입력된 제목의 길이 계산
        var titleLength = $(this).val().length; // 현재 글자수
        var remain = 50 - titleLength; // 남은 글자 수 계산

        // 남은 글자수를 표시할 요소에 남은 글자수 표시
        $('#titleCount').html(remain);

        // 남은 글자수에 따라 글자 색상 변경
        if (remain >= 0) {
            $('#titleCount').css('color', 'green'); // 긍정적인 경우, 녹색 표시
        } else {
            $('#titleCount').css('color', 'red'); // 초과하는 경우, 빨간색 표시
        }

        // 제목 글자수가 초과했을 때 경고 창 표시
        if (remain < 0) {
            swal("", "제목은 한글기준 50자 까지만 쓸 수 있습니다.", "warning");
        }
    })
})