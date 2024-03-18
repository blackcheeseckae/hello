/**
 * 로그인 아이디와 패스워드를 체크하는 함수
 */
function memberCheck() {
	var member_id=$("#member_id").val(); // 입력받은 회원 ID 값을 가져옴
	var member_pwd=$("#member_pwd").val(); // 입력받은 회원 비밀번호 값을 가져옴
	if (!member_id || !member_pwd) { // 회원 ID 또는 비밀번호가 입력되지 않았을 경우
		swal("", "아이디 혹은 패스워드를 입력해주세요.", "error"); // 경고창을 띄움
	} else { // 둘 다 입력된 경우
		$.ajax({ // 비동기 요청 시작
			type : "POST", // POST 방식으로
			url : "checkMember", // 'checkMember' URL에 요청
			data : { // 데이터는 회원 ID와 비밀번호
				"member_id" : member_id,
				"member_pwd" : member_pwd
			}, success : function(data) { // 요청 성공 시
				if (data != 0) { // 반환된 데이터가 0이 아니면(로그인 성공)
					$.ajax({ // 다시 비동기 요청
						type : "POST", // POST 방식으로
						url : "login", // 'login' URL에 요청
						data : { // 데이터는 동일하게 회원 ID와 비밀번호
							"member_id" : member_id,
							"member_pwd" : member_pwd
						}, success : function() { // 요청 성공 시
							window.location.href = "main"; // 메인 페이지로 리디렉션
						}
					});
				} else { // 반환된 데이터가 0이면(로그인 실패)
					swal("","아이디 혹은 패스워드를 확인해주세요.","warning") // 경고창을 띄움
				}
			}, error : function(data) { // 요청 실패 시
				console.log(data); // 콘솔에 오류 데이터 출력
			}
		});
	}
}


/**
 * 로그인 상태에서 메뉴바의 장바구니 버튼을 이용해 productCart.jsp로 이동하는 함수
 */
function productCart() {
	var member_id=$("#member_id").val(); // 회원 ID 값을 가져옴
	document.frm.method="POST"; // 폼의 메소드를 POST로 설정
	document.frm.action="productCart"; // 폼의 액션을 'productCart'로 설정
	document.frm.submit(); // 폼을 제출
}


/**
 * 로그인 페이지에서 비밀번호 찾기를 눌렀을 때 동작하는 함수
 */
function forgotPWView() {
	var popupX = (window.screen.width / 2) - 200; // 팝업창의 X 좌표 계산
	var popupY = (window.screen.height / 2) - 125; // 팝업창의 Y 좌표 계산
	window.open("forgotPW", "비밀번호 찾기", "status = no, width = 400, height = 250, left = " + popupX + ", top = " + popupY); // 비밀번호 찾기 팝업창을 염
}

/**
 * 비밀번호 찾기 페이지에서 비밀번호 재발급을 눌렀을 때 동작하는 함수
 */
function forgotPW() {
	var member_id=$("#member_id").val(); // 입력받은 회원 ID 값을 가져옴
	var member_name=$("#member_name").val(); // 입력받은 회원 이름 값을 가져옴
	$.ajax({ // 비동기 요청 시작
		type : "POST", // POST 방식으로
		url : "forgotPWChkm", // 'forgotPWChkm' URL에 요청
		data : { // 데이터는 회원 ID와 이름
			"member_id" : member_id,
			"member_name" : member_name
		}, success : function(data) { // 요청 성공 시
			if (data != 0) { // 반환된 데이터가 0이 아니면(회원 정보 일치)
				$.ajax({ // 다시 비동기 요청
					type : "POST", // POST 방식으로
					url : "forgotPW", // 'forgotPW' URL에 요청
					data : { // 데이터는 동일하게 회원 ID와 이름
						"member_id" : member_id,
						"member_name" : member_name
					}, success : function() { // 요청 성공 시
						window.location.href = "main"; // 메인 페이지로 리디렉션
					}
				 });
			} else { // 반환된 데이터가 0이면(회원 정보 불일치)
				swal("", "존재하는 회원이 없습니다.", "warning"); // 경고창을 띄움
			}
		}
	});
}


/**
 * 로그인 상태에서 메뉴바의 로그아웃 버튼을 눌렀을때 동작하는 함수
 */
function logout() {
	$.ajax({ // 비동기 요청 시작
		type : "GET", // GET 방식으로
		url : "logout", // 'logout' URL에 요청
		data : {}, // 데이터는 빈 객체
		success : function(data) { // 요청 성공 시
			swal("로그아웃", "완료", "success"); // 성공 알림창을 띄움
			location.href="main"; // 메인 페이지로 리디렉션
		}
	});
}



function getCookie(name) { // 쿠키 값을 가져오는 함수
  var parts = document.cookie.split(name + '='); // 지정된 이름의 쿠키를 찾아 분리
  if (parts.length === 2) { return parts[1].split(';')[0]; } // 값을 반환
}