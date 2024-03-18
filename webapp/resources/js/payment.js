
// 결제정보 및 배송지 등을 처리하는 함수
$(document).ready(function() {
    // 최상단 체크박스 클릭
    $("#checkAll").click(function() { 
        // 클릭시 모든 체크박스 상태 변경
        if ($("#checkAll").prop("checked")) { 
            // 전체 체크박스가 체크된 경우
            $("input[name=chk]").prop("checked", true); // 모든 체크박스 체크
        } else {
            $("input[name=chk]").prop("checked", false); // 모든 체크박스 해제
        }
    });

    // 개별 체크박스 클릭 시
    $("input[name=chk]").click(function() {
        // 모든 개별 체크박스의 개수와 체크된 개별 체크박스의 개수 비교하여 전체 체크박스 상태 변경
        if ($("input[name=chk]").length == $("input[name=chk]:checkbox:checked").length) {
            $("#checkAll").prop("checked", true); // 모든 체크박스가 체크된 경우 전체 체크박스 체크
        } else {
            $("#checkAll").prop("checked", false); // 하나 이상의 체크박스가 체크 해제된 경우 전체 체크박스 해제
        }
    });

    // 선택한 라디오 버튼 변경 시
    $("input[type=radio][name=choice]").change(function() {
        if (this.value == "sameaddr") {
            // '동일한 주소 사용' 선택 시
            // 입력란에 이전 주소 및 연락처 정보 입력 및 읽기 전용 설정
            $("input[name=sn_member_name]").val($("#hidden_member_name").val()).attr("readonly", true);
            $("input[name=sn_member_zipcode]").val($("#hidden_member_zipcode").val()).attr("readonly", true);
            $("input[name=sn_member_faddr]").val($("#hidden_member_faddr").val()).attr("readonly", true);
            $("input[name=sn_member_laddr]").val($("#hidden_member_laddr").val()).attr("readonly", true);
            $("input[name=sn_member_phone]").val($("#hidden_member_phone").val()).attr("readonly", true);
            $("input[name=nn_searchPost]").css("visibility", "hidden"); // 우편번호 검색 버튼 숨김
        } else if (this.value == "newaddr") {
            // '새로운 주소 입력' 선택 시
            // 입력란 초기화 및 읽기/쓰기 가능 설정
            $("input[name=sn_member_name]").val("").attr("readonly", false);
            $("input[name=sn_member_zipcode]").val("").attr("readonly", true);
            $("input[name=sn_member_faddr]").val("").attr("readonly", true);
            $("input[name=sn_member_laddr]").val("").attr("readonly", false);
            $("input[name=sn_member_phone]").val("").attr("readonly", false);
            $("input[name=nn_searchPost]").css("visibility", "visible"); // 우편번호 검색 버튼 표시
        }
    });
});

// 약관 동의 체크 및 카드번호 입력 여부 확인 함수
function termChk() {
    var chk1 = $("#chk1").is(":checked");
    var chk2 = $("#chk2").is(":checked");
    var member_id = $("#member_id").val();
    var member_zipcode = $("input[name=sn_member_zipcode]").val();
    var member_faddr = $("input[name=sn_member_faddr]").val();
    var member_laddr = $("input[name=sn_member_laddr]").val();
    var member_phone = $("input[name=sn_member_phone]").val();
    var credit_number = $("#credit1").val() + "-" + $("#credit2").val() + "-" + $("#credit3").val() + "-" + $("#credit4").val();
    var prd_list = new Array();
    var chkbox = $("input[name=chkbox]");
    jQuery.ajaxSettings.traditional = true;

    // 약관에 모두 동의하고 카드번호가 입력된 경우
    if (chk1 == true && chk2 == true && $("#credit1").val() != "" && $("#credit2").val() != "" && $("#credit3").val() != "" && $("#credit4").val() != "") {
        swal({ // SweetAlert로 결제 확인 팝업 표시
            icon: "info",
            text: "결제를 진행 하시겠습니까?",
            closeOnClickOutside: false,
            closeOnEsc: false,
            buttons: ["취소", "결제"],
        }).then(function(isConfirm) {
            if (isConfirm) { // 결제 확인 시
                swal("결제 성공", "결제를 완료했습니다.", "success").then(function(isConfirm) {
                    chkbox.each(function(i) {
                        var tr = chkbox.parent().parent().eq(i).children();
                        var prd_id = tr.eq(1).text(); // 상품 ID
                        var prd_opt = tr.eq(3).text(); // 상품 옵션
                        var buy_quantity = tr.eq(5).text(); // 구매 수량
                        prd_list.push(prd_id, prd_opt, buy_quantity);
                    });
                    $.ajax({ // 결제 정보 전송
                        type: "POST",
                        url: "pay",
                        data: {
                            "prd_list": prd_list,
                            "member_id": member_id,
                            "member_zipcode": member_zipcode,
                            "member_faddr": member_faddr,
                            "member_laddr": member_laddr,
                            "member_phone": member_phone,
                            "credit_number": credit_number
                        },
                        success: function(data) {
                            window.location.href = "main"; // 결제 완료 후 메인 페이지로 이동
                        }
                    });
                    console.log(prd_list); // 콘솔에 상품 리스트 출력
                });
            }
        });
    } else if (chk1 == false || chk2 == false) { // 약관 동의를 하지 않은 경우
        swal("", "약관에 동의해야 합니다.", "info");
    } else { // 카드번호가 입력되지 않은 경우
        swal("", "카드번호를 입력해주세요.", "info");
    }
}

// 카드번호에 숫자만 입력 가능하도록 제어하는 함수
function onlyNumber() {
    if ((event.keyCode < 48) || (event.keyCode > 57)) {
        event.returnValue = false;
    }
}

// 배송지 검색을 위한 다음포스트 서비스를 참조하는 함수
function searchPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullAddr = '';
            var extraAddr = '';

            if (data.userSelectedType == 'R') {
                fullAddr = data.roadAddress;
            } else {
                fullAddr = data.jibunAddress;
            }
            if (data.userSelectedType == 'R') {
                if (data.bname !== '') {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
            }
            $("input[name=sn_member_zipcode]").val(data.zonecode); // 우편번호 입력란에 우편번호 값 설정
            $("input[name=sn_member_faddr]").val(fullAddr); // 상세주소 입력란에 주소 값 설정
            $("input[name=sn_member_laddr]").focus(); // 상세주소 입력란으로 포커스 이동
        }
    }).open();
}