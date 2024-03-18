// 마이페이지 버튼 클릭 시 실행되는 함수
function mypBtn() {
    // 입력된 회원 ID 및 마이페이지 정보를 가져옴
    var member_id = $("#member_id").val();
    var myp = $("#myp").val();
    // AJAX를 이용하여 서버에 데이터 전송
    $.ajax({
        type: "POST", // 보안 유지를 위해 POST로 전송
        url: "mypL",  // membercontroller에서 mypL요청을 받아서 처리
        data: {
            "member_id": member_id,
            "myp": myp
        },
        success: function(data) {
            // 성공 시, 마이페이지로 이동
        	window.location.href = "mypage";
        }
    });
}

// 메뉴바의 검색상에서 상품 검색 시 실행되는 함수
function searchPrd() {
    // 검색어를 가져옴
    var sea = $("#sPrd").val();
    // AJAX를 이용하여 서버에 데이터 전송
    $.ajax({
        type: "GET",
        url: "searchPrd", // 상품 검색을 처리할 서버 측 URL
        data: {
            "sPrd": sea // 검색어를 데이터로 전송
        },
        success: function(data) {
            // 성공 시, 검색 페이지로 이동
            window.location.href = "searchPrd?sPrd=" + sea;
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 경고 메시지 표시
            alert("검색 오류 발생");
        }
    });
}

// 페이지 로드 시 메뉴바의 배너를 그리는 캔버스 함수
document.addEventListener("DOMContentLoaded", function() {
    // Canvas 요소 생성
    var canvasContainer = document.getElementById("canvasContainer");
    var canvas = document.createElement("canvas");
    canvasContainer.appendChild(canvas);

    var context = canvas.getContext("2d");

    // 원의 초기 위치 및 속도 설정
    var x1 = 0, x2 = 0, x3 = 0, x4 = 0;	//원의 초기 위치 좌표 설정
    var speed1 = 2, speed2 = 1, speed3 = 3, speed4 = 1.5;	//각각의 원들의 속도 지정
    var circleRadius = 20;	//원의 지름 기본값 설정

    // 애니메이션 함수 정의
    function animate() {
        clearCanvas();
        drawCircle(x1, 100, circleRadius, "#f00");	//원의 x,y좌표와 반지름, 색상 설정
        drawCircle(x2, 65, circleRadius + 10, "#ff00ff");
        drawCircle(x3, 40, circleRadius - 5, "#0f0");
        drawCircle(x4, 75, circleRadius + 5, "#0ff");

        // 원의 위치 업데이트
        x1 += speed1;
        x2 += speed2;
        x3 += speed3;
        x4 += speed4;

        // Canvas의 너비를 벗어나면 초기 위치로 설정
        if (x1 > canvas.width + circleRadius) {
            x1 = -circleRadius;
        }
        if (x2 > canvas.width + circleRadius) {
            x2 = -circleRadius;
        }
        if (x3 > canvas.width + circleRadius) {
            x3 = -circleRadius;
        }
        if (x4 > canvas.width + circleRadius) {
            x4 = -circleRadius;
        }

        requestAnimationFrame(animate); // 다음 애니메이션 프레임 요청
    }

    // Canvas 초기화 함수
    function clearCanvas() {
        context.clearRect(0, 0, canvas.width, canvas.height);
    }

    // 원 그리기 함수
    function drawCircle(x, y, radius, color) {
        context.strokeStyle = color;
        context.lineWidth = 2;
        context.beginPath();
        context.arc(x, y, radius, 0, 2 * Math.PI);
        context.closePath();
        context.stroke();
    }

    animate(); // 애니메이션 시작
});

// 배너의 배경색과 글자색 변경 함수
document.addEventListener("DOMContentLoaded", function() {
    var banner = document.querySelector('.MM');

    var isFontWhite = true; // 초기 글씨 색상이 흰색인지 여부

    // 색상 변경 함수
    function changeColors() {
        if (isFontWhite) {
            banner.style.color = '#FFFFFF'; // 글씨를 흰색으로
            banner.style.backgroundColor = '#000000'; // 배경을 검은색으로
        } else {
            banner.style.color = '#000000'; // 글씨를 검은색으로
            banner.style.backgroundColor = '#FFFFFF'; // 배경을 흰색으로
        }

        isFontWhite = !isFontWhite; // 다음 변경을 위해 상태 전환

        setTimeout(changeColors, 2000); // 2초 후에 색상 변경
    }

    changeColors(); // 색상 변경 함수 호출
});

// 플로팅 메뉴바
$(document).ready(function() {
    var floatPosition = parseInt($("#floatMenu").css('top')); // 플로팅 배너 위치(top)값을 가져와 저장

    $(window).scroll(function() {
        var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치
        var newPosition = scrollTop + floatPosition + "px"; // 새로운 위치 계산

        $("#floatMenu").stop().animate({ // 플로팅 배너 애니메이션 설정
            "top": newPosition // 새로운 위치로 이동
        }, 200); // 애니메이션 시간 설정
    }).scroll(); // 스크롤 이벤트 발생 시, 바로 실행
});

// 탑버튼 스크롤 이동 함수
scrollTop('js-button', 300);
function scrollTop(elem, duration) {
    let target = document.getElementById(elem);

    target.addEventListener('click', function() {
        let currentY = window.pageYOffset; // 현재 스크롤 위치
        let step = duration / currentY > 1 ? 100 : 100; // 이동 거리 계산
        let timeStep = duration / currentY * step; // 시간 간격 계산
        let intervalID = setInterval(scrollUp, timeStep); // 스크롤 이동 간격 설정

        function scrollUp() {
            currentY = window.pageYOffset; // 현재 스크롤 위치 업데이트
            if (currentY === 0) {
                clearInterval(intervalID); // 스크롤이 맨 위에 도달하면 간격 설정 해제
            } else {
                scrollBy(0, -step); // 스크롤 이동
            }
        }
    });
}

// 상품 카테고리 목록 페이지로 이동하는 함수
function list(cate_id, page) {
    location.href = "category?cate_id=" + cate_id + "&curPage=" + page;
}