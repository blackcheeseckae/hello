/**
 * 장바구니에 상품을 추가하는 함수
 */
function insertCart() {
	var member_id = $("#member_id").val(); // 회원 ID를 입력받습니다.
	var prd_id = $("#prd_id").val(); // 상품 ID를 입력받습니다.
	var buy_quantity = $("#buy_quantity").val(); // 상품 구매 수량을 입력받습니다.
	var prd_opt = $("#prd_opt").val(); // 상품 옵션을 입력받습니다.
	if (member_id == "Administrator") {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning"); // 관리자 계정으로는 장바구니 이용 불가 메시지 출력
	} else if (!member_id) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error"); // 비회원 이용 불가 메시지 출력
	} else if (buy_quantity == 0) {
		swal("", "수량을 선택해주세요", "error"); // 수량 미선택 시 오류 메시지 출력
	} else {
		$.ajax({
			type : "GET",
			url : "insertCart", // ProductCartController의 'insertCart' 경로로 AJAX 요청을 보냅니다.
			data : {
				"member_id" : member_id, // 회원 ID를 전송합니다.
				"prd_id" : prd_id,	// 상품 ID를 전송합니다.
				"buy_quantity" : buy_quantity, // 상품 수량을 전송합니다.
				"prd_opt" : prd_opt // 상품 옵션을 전송합니다.
			},
			success : function(data) {
				swal("", "장바구니에 저장되었습니다.", "success"); // 장바구니 저장 성공 메시지 출력
			}
		});
	}
}


/**
 * 구매할 상품들의 정보와 함께 결제페이지로 이동하는 함수입니다.
 */
function payCart() {
	var member_id = $("#member_id").val(); // 회원 ID를 입력받습니다.
	var hiddenbtn = $("#hiddenbtn").val(); // 결제 버튼의 상태를 입력받습니다.
	if ($("input[name=chk]:checkbox:checked").length == 0) {
		swal("", "결제할 상품을 선택해주세요.", "warning"); // 결제할 상품이 선택되지 않았다면 경고 메시지를 출력합니다.
	} else {
		$.ajax({
			type : "POST",
			url : "payment", // ProductCartController의 'payment' 경로로 POST 요청을 보냅니다.
			data : {
				"member_id" : member_id,
				"hiddenbtn" : hiddenbtn
			},
			success : function(data) {
				console.log(data); // 요청 성공 시 로그를 출력합니다.
				window.location.href = "payment"; // 결제 페이지로 이동합니다.
			}
		});
	}
}



/**
 * 장바구니에서 선택한 상품을 삭제하는 함수입니다.
 */
function delCart(prd_id, member_id) {
	if (!member_id) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error") // 비회원 이용 불가 메시지 출력
	} else {
		$.ajax({
			type : "POST",
			url : "delCart", // ProductCartController의 'delCart' 경로로 POST 요청을 보냅니다.
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id
			},
			success : function(data) {
				window.location.reload(); // 요청 성공 시 페이지를 새로고침합니다.
			}
		});
	}
}

/**
 * 장바구니에서 상품을 비우는 함수입니다.
 */
function cartClear() {
	var member_id = $("#member_id").val(); // 회원 ID를 입력받습니다.
	if (!member_id) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error") // 비회원 이용 불가 메시지 출력
	} else {
		$.ajax({
			type : "POST",
			url : "clearCart", // ProductCartController의 'clearCart' 경로로 POST 요청을 보냅니다.
			data : {
				"member_id" : member_id
			},
			success : function() {
				window.location.reload(); // 요청 성공 시 페이지를 새로고침합니다.
			}
		});
	}
}

/**
 * 장바구니 내의 상품들의 총 금액을 계산하는 함수입니다.
 */
function calCart() {
	var prd_delivery = 0; // 배송비를 0으로 초기화합니다.
	var prd_sum = 0; // 상품 합계 금액을 0으로 초기화합니다.
	for (i = 0; i < $("input[name=chk]").length; i++) {
		if ($("input[name=chk]")[i].checked == true) {
			prd_delivery += parseInt($("input[name=prd_delivery]")[i].value); // 선택된 상품의 배송비를 더합니다.
			prd_sum += parseInt($("input[name=prd_sum]")[i].value); // 선택된 상품의 가격을 더합니다.
		}
	}
	document.getElementById("prd_delivery").innerHTML = numberWithCommas(prd_delivery); // 배송비를 화면에 표시합니다.
	document.getElementById("prd_sum").innerHTML = numberWithCommas(prd_sum); // 상품 합계 금액을 화면에 표시합니다.
	document.getElementById("total").innerHTML = numberWithCommas(prd_delivery + prd_sum); // 총 금액을 화면에 표시합니다.
}

/**
 * 숫자를 3자리마다 콤마를 찍어서 문자열로 변환하는 함수입니다.
 */
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 페이지 로딩 시 실행되는 코드입니다.
$(document).ready(function() {
	$("#checkAll").click(function() { // 전체 선택 체크박스 클릭 시
		if ($("#checkAll").prop("checked")) {
			$("input[name=chk]").prop("checked", true); // 모든 체크박스를 선택 상태로 만듭니다.
		} else {
			$("input[name=chk]").prop("checked", false); // 모든 체크박스의 선택을 해제합니다.
		}
	})

	$("input[name=chk]").click(function() { // 개별 체크박스 클릭 시
		if ($("input[name=chk]").length == $("input[name=chk]:checkbox:checked").length) {
			$("#checkAll").prop("checked", true); // 모든 체크박스가 선택되면 전체 선택 체크박스도 선택 상태로 만듭니다.
		} else {
			$("#checkAll").prop("checked", false); // 하나라도 선택되지 않은 체크박스가 있으면 전체 선택 체크박스의 선택을 해제합니다.
		}
	})
})

