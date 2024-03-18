// 상품 구매 함수
function buyProduct() {
	// 입력된 값들을 변수에 저장
	var member_id = $("#member_id").val(); // 회원 ID
	var prd_id = $("#prd_id").val(); // 상품 ID
	var buy_quantity = $("#buy_quantity").val(); // 구매 수량
	var prd_opt = $("#prd_opt").val(); // 상품 옵션
	var hiddenbtn = $("#hiddenbtn").val(); // 숨겨진 버튼 값

	// 회원 확인 및 수량 선택 예외처리
	if (member_id == "Administrator") {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
	} else if (!member_id) {
		swal("", "비회원은 이용하실 수 없습니다.", "error");
	} else if (buy_quantity == 0) {
		swal("", "수량을 선택해주세요", "error");
	} else {
		// AJAX를 통해 구매 정보 전송
		$.ajax({
			type : "POST",
			url : "payment",
			data : {
				"member_id" : member_id,
				"prd_id" : prd_id,
				"buy_quantity" : buy_quantity,
				"prd_opt" : prd_opt,
				"hiddenbtn" : hiddenbtn
			},
			success : function(data) {
				console.log(data);
				window.location.href="payment"; // 결제 페이지로 이동
			}, error : function(data) {
				console.log(data);
			}
		});
	}
}

// 상품 등록 함수
function doInsertProduct() {
	// 카테고리 선택 여부 확인
	if (!cate_id) {
		swal("", "카테고리를 선택해주세요.", "error");
	} else {
		// 폼 데이터 및 CKEditor 내용 전송
		var formData = new FormData($("#fileForm")[0]); // 폼 데이터 객체 생성
		formData.append('prd_explain', CKEDITOR.instances.prd_explain.getData()); // CKEditor 내용 추가
		$.ajax({
			type : "POST",
			url : "insertProduct",
			data : formData, // 폼 데이터 전송
			processData : false, // 데이터 처리 방식 지정
			contentType : false, // 컨텐츠 타입 설정
			success : function(data) {
				swal("", "상품이 등록되었습니다.", "success")
				.then(function(isConfirm){
					location.href="prdinsert"; // 상품 등록 페이지로 이동
				});
			}, error : function(error) {
				swal("왜", "에러일까", "error");
			}
		});
	}
}

// 상품 ID 중복 확인 함수
function prdidChk() {
	var prd_id=$("#prd_id").val(); // 입력된 상품 ID 가져오기
	if (!prd_id) {
		swal("", "아이디를 입력해주세요.", "error");
	} else {
		// AJAX를 통해 상품 ID 중복 검사 요청
		$.ajax({
			type : "POST",
			url : "prdCheckID",
			data : { "prd_id" : prd_id }, // 상품 ID 전송
			dataType : "JSON", // 데이터 타입 지정
			success : function(data) {
				if (data == 0) {
					$("#prd_id").attr("disable", true); // 입력란 비활성화
					swal("", "사용가능한 아이디입니다.", "success"); // SweetAlert로 메시지 출력
				} else if (data != 0) {
					swal("", "이미 존재하는 아이디입니다.", "error");
				} else {
					swal("a", "a", "error");
				}
			}, error : function(error) {
				swal("", prd_id, "error");
			}
		});
	}
}

// 수량 입력란에 입력 시 두자리 숫자로 제한하는 함수
$("#buy_quantity").keyup(function(e){
	var regNumber = /^([0-9]{2})$/; // 두 자리 숫자 정규식
	var str = $(this).val(); // 입력된 값 가져오기
	if(!regNumber.test(str)) {
		var res = str.substring(0, str.length-1); // 두 자리를 초과하는 경우 마지막 한 글자 삭제
		$(this).val(res); // 입력값 갱신
	}
});

// 입력란의 자릿수 제한 함수
function mxNum(object) {
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength) // 입력된 값 자릿수 제한
	}
}

// 페이지 숫자로 리디렉팅 하는 함수
function list(page) {
	location.href="productList?curPage="+page; // 페이지 이동
}