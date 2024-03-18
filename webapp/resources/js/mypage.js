// 비밀번호 일치 여부를 확인하는 변수 초기화
var checkPWD = false;

// 개인정보 수정 관련 함수
$(document).ready(function() {
    // 비밀번호 입력 필드에 키를 입력할 때마다 실행
    $("#member_pwd").keyup(function() {
        // 비밀번호 확인 메시지를 초기화
        $("#checkPasswd").text("");
    });
    
    // 비밀번호 확인 필드에 키를 입력할 때마다 실행
    $("#chk_member_pwd").keyup(function() {
        var checkText = $("#checkPasswd");
        // 비밀번호 또는 비밀번호 확인 필드가 비어있으면 필수 정보임을 알림
        if ($("#member_pwd").val() == "" || $("#chk_member_pwd").val() == "") {
            checkText.css("color", "red");
            checkText.text("필수정보입니다.");
            checkPWD = false;
        } else if ($("#member_pwd").val() != $("#chk_member_pwd").val()) {
            // 비밀번호와 비밀번호 확인이 일치하지 않으면 경고 메시지 출력
            checkPWD = false;
            checkText.text("패스워드가 동일하지 않습니다.");
            checkText.css("color", "red");
        } else {
            // 비밀번호와 비밀번호 확인이 일치하면 성공 메시지 출력
            checkPWD = true;
            checkText.text("패스워드가 동일합니다.");
            checkText.css("color", "green");
        }
    });

    // 이메일 선택 드롭다운 변경 시 실행
    $("#email_select").change(function() {
        // 사용자가 직접 입력 선택 시
        if ($("#email_select").val() == "1") {
            $("#email_addr").val("");
            $("#email_addr").prop("disabled", false);
        } else if ($("#email_select").val() == "") {
            // 선택하지 않았을 때
            $("#email_addr").val("");
            $("#email_addr").prop("disabled", true);
        } else {
            // 특정 도메인 선택 시 해당 도메인으로 설정하고 입력 불가능하게 함
            $("#email_addr").val($("#email_select").val());
            $("#email_addr").prop("disabled", true);
        }
    });

});

// 회원가입 및 개인정보수정에 사용되는 주소 검색 기능 (다음 포스트코드 활용)
function searchPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색 완료 시 동작
            var fullAddr = '';
            var extraAddr = '';

            // 도로명 주소 선택 시
            if (data.userSelectedType == 'R') {
                fullAddr = data.roadAddress;
            } else {
                // 지번 주소 선택 시
                fullAddr = data.jibunAddress;
            }

            // 도로명 주소의 경우 추가 주소 정보가 있을 때 처리
            if (data.userSelectedType == 'R') {
                if (data.bname !== '') {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
            }
            // 주소 정보를 입력 필드에 설정
            document.getElementById('member_zipcode').value = data.zonecode;
            document.getElementById('member_faddr').value = fullAddr;
            document.getElementById('member_laddr').value = '';
        }
    }).open();
}

// 마이페이지3 회원정보 수정 함수
function myinfoUp() {
    // 입력 필드에서 값을 가져옴
    var member_id = $("#member_id").val();
    var member_pwd = $("#member_pwd").val();
    var member_email = $("#email_id").val() + "@" + $("#email_addr").val();
    var member_phone = $("#NUMst").val() + "-" + $("#NUMnd").val() + "-" + $("#NUMrd").val();
    var member_zipcode = $("#member_zipcode").val();
    var member_faddr = $("#member_faddr").val();
    var member_laddr = $("#member_laddr").val();
    var myp = $("#myp").val();
    
    // 비밀번호가 일치하지 않을 경우 알림
    if (checkPWD == false) {
        console.log("비밀번호 다름");
    }
    if (checkPWD == false) {
        swal("", "비밀번호 확인란이 일치하지 않습니다.", "warning");
    } else {
        // 비밀번호가 일치할 경우 수정 여부를 묻는 알림창 표시
        swal({
            icon: "warning",
            text: "정말 수정 하시겠습니까?",
            closeOnClickOutside: false,
            closeOnEsc: false,
            buttons: ["돌아가기", "수정 완료!"],
        }).then(function(isConfirm) {
            if (isConfirm) {
                // 수정 완료 알림
                swal('수정 완료!', '회원정보 수정을 완료했습니다.^^', 'success').then(function(isConfirm) {
                    // 서버에 데이터 전송
                    $.ajax({
                        type: "POST",
                        url: "mypage3",
                        data: {
                            "member_id": member_id,
                            "member_pwd": member_pwd,
                            "member_email": member_email,
                            "member_phone": member_phone,
                            "member_zipcode": member_zipcode,
                            "member_faddr": member_faddr,
                            "member_laddr": member_laddr,
                            "myp": myp
                        },
                        success: function(data) {
                            window.location.href = "mypage?member_id=" + member_id + "&myp=" + myp;
                        },
                        error: function(data) {
                            console.log(member_id);
                            console.log(myp);
                        }
                    });
                });
            }
        })
    }
}

// 마이페이지2 비밀번호 확인 함수
function mypg2() {
    // 입력 필드에서 값을 가져옴
    var member_id = $("#member_id").val();
    var member_pwd = $("#member_pwd").val();
    
    var mypPwd = $("#member_pwd1").val();
    
    // 필수 필드가 비어있으면 에러 알림
    if (!member_id || !mypPwd) {
        swal("", "패스워드를 입력해주세요.", "error");
    } else {
        // 서버에 비밀번호 확인 요청
        $.ajax({
            type: "POST",
            url: "checkMember",
            data: {
                "member_id": member_id,
                "member_pwd": member_pwd
            }, success: function(data) {
                if (data != 0) {
                    // 비밀번호 확인 성공 시 다음 페이지로 이동
                    $.ajax({
                        type: "POST",
                        url: "mypage2",
                        data: {
                            "member_id": member_id,
                            "member_pwd": member_pwd
                        }, success: function() { window.location.href = "mypage3"; }
                    });
                } else {
                    // 비밀번호가 틀렸을 경우 경고 알림
                    swal("", "패스워드를 확인해주세요.", "warning")
                }
            }, error: function(data) {
                console.log(data);
            }
        });
    }
}