
// write.jsp의 글쓰기 양식 관련 함수
$(document).ready(function() {
    // 제목 입력 필드에서 키보드 입력이 있을 때 실행되는 함수
    $('#title').keyup(function() {
        var titleLength = $(this).val().length; // 현재 입력된 제목의 길이
        var remain = 50 - titleLength; // 남은 글자 수 계산

        // 남은 글자수를 화면에 표시
        $('#titleCount').html(remain);

        // 남은 글자수에 따라 글자색 변경
        if (remain >= 0) {
            $('#titleCount').css('color', 'green');
        } else {
            $('#titleCount').css('color', 'red');
        }

        // 제한 글자수를 초과하는 경우 경고창 표시
        if (remain < 0) {
            swal("", "제목은 한글기준 50자까지만 쓸 수 있습니다.", "warning");
        }
    });
});

// 공지사항 게시판의 게시글 작성하기 버튼의 동작을 위한 함수
function createB() {
    // 작성자, 제목, 내용을 입력 필드에서 가져옴
    var writer = $("#writer").val();
    var title = $("#title").val();
    var content = CKEDITOR.instances.content.getData(); // CKEDITOR에서 내용 데이터 가져오기
    var titleLength = title.length; // 제목의 길이 계산

    // 제목이 비어있는 경우 경고창 표시
    if (!title) {
        swal("", "제목을 입력하세요.", "error");
    // 제목의 길이가 50자를 초과하는 경우 경고창 표시
    } else if (titleLength > 50) {
        swal("", "제목이 너무 깁니다.", "error");
    // 내용이 비어있는 경우 경고창 표시
    } else if (content == "") {
        swal("", "글내용을 입력해 주세요!!", "error");
        return false; 
    } else {
        // 모든 조건이 충족되면 게시글 등록 여부를 묻는 확인창 표시
        swal({
             icon: "warning",
             text: "지금 게시글 등록을 하시겠습니까?",
             closeOnClickOutside: false,
             closeOnEsc: false, 
             buttons: ["돌아가기", "작성 완료!"],
        }).then(function(isConfirm) {
            if (isConfirm) {
                // 등록을 선택한 경우, 등록 완료 메시지 표시 및 서버로 데이터 전송
                swal('등록 완료!', '게시글 등록을 완료했습니다.^^', 'success').then(function(isConfirm) {
                    $.ajax({
                        type: "POST",
                        url: "createBoard",
                        data: {
                            "writer": writer,
                            "title": title,
                            "content": content
                        }, success: function(data) {
                            // 데이터 전송 성공 시, 지정된 페이지로 리다이렉션
                            location.href = 'board';
                        }
                    });
                });
            }
        })
    }
}

//고객센터 게시판의 게시글 작성하기 버튼의 동작을 위한 함수
function createB2() {
	var writer=$("#writer").val();
	var title=$("#title").val();
	var content=CKEDITOR.instances.content.getData();
	var titleLength=title.length;
	
	if(!title) {
		swal("", "제목을 입력하세요.", "error");
	} else if(titleLength>50) {
		swal("", "제목이 너무 깁니다.", "error");
	} else if(content==""){ 
		 swal("", "글내용을 입력해 주세요!!.", "error");
		 return false; 
	} else {
		swal({
			 icon: "warning",
			 text: "지금 게시글 등록을 하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["돌아가기", "작성 완료!"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('등록 완료!','게시글 등록을 완료했습니다.^^','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "createBoard2",
							data : {
								"writer" : writer,
								"title" : title,
								"content" : content
						}, success : function(data) {
							location.href='board2';
						}
						});
			    	});
			  }
			})
	}
}