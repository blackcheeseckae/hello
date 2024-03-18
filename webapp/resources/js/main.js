/**
 * 메인화면 대형 이미지 슬라이드 관련 함수
 */
$(document).ready(function() {
    // 사용할 배너 선택
    var $banner = $(".banner").find("ul");
    // 배너 이미지의 폭
    var $bannerWidth = $banner.children().outerWidth();
    // 배너 이미지의 높이
    var $bannerHeight = $banner.children().outerHeight();
    // 배너 이미지의 갯수
    var $bannerLength = $banner.children().length;
    // 정해진 시간마다 함수를 실행하기 위한 변수
    var rollingId;

    // 이미지 롤링을 시작하는 함수
    function startRolling() {
        rollingId = setInterval(function() {
            rollingStart();
        }, 5000); // 정해진 초(5000ms=5초)마다 함수를 실행
    }

    // 이미지 롤링을 멈추는 함수
    function stopRolling() {
        clearInterval(rollingId);
    }

    // 롤링 애니메이션을 실행하는 함수
    function rollingStart() {
        $banner.css("width", $bannerWidth * $bannerLength + "px");
        $banner.css("height", $bannerHeight + "px");
        $banner.animate({
            left: -$bannerWidth + "px"
        }, 2000, function() { // 2000ms=2초 동안 애니메이션 실행
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
            $(this).find("li:first").remove();
            $(this).css("left", 0);
        });
    }

    // 마우스 오버시 롤링을 멈춤
    $banner.mouseover(function() {
        stopRolling();
        $(this).css("cursor", "pointer");
    });

    // 마우스 아웃되면 롤링을 다시 시작
    $banner.mouseout(function() {
        startRolling();
        $(this).css("cursor", "default");
    });

    // 초기 롤링 시작
    startRolling();
});



/**
 * 신상품,가성비 등등의 이미지 슬라이드를 위한 함수
 */
$(document).ready(function() {
    // 슬라이드를 위한 변수 선언
    var imgs;
    var img_count;
    var img_position = 1;

    // 특정 슬라이드 선택 (예: ".slide ul")
    imgs = $(".slide ul");
    img_count = imgs.children().length;

    // 이전 버튼 클릭 시 함수 실행
    $('#back').click(function() {
        back();
    });
    // 다음 버튼 클릭 시 함수 실행
    $('#next').click(function() {
        next();
    });

    // 이전 이미지로 이동하는 함수
    function back() {
        if (1 < img_position) {
            imgs.animate({
                left: '+=1000px'
            });
            img_position--;
        }
    }

    // 다음 이미지로 이동하는 함수
    function next() {
        if (img_count > img_position) {
            imgs.animate({
                left: '-=1000px'
            });
            img_position++;
        }
    }
});


$(document).ready(function() {
	var imgs;
	var img_count;
	var img_position = 1;

	imgs = $(".slide2 ul");
	img_count = imgs.children().length;

	$('#back2').click(function() {
		back();
	});
	$('#next2').click(function() {
		next();
	});

	function back() {
		if (1 < img_position) {
			imgs.animate({
				left : '+=1000px'
			});
			img_position--;
		}
	}
	function next() {
		if (img_count > img_position) {
			imgs.animate({
				left : '-=1000px'
			});
			img_position++;
		}
	}
});


$(document).ready(function() {
	var imgs;
	var img_count;
	var img_position = 1;

	imgs = $(".slide3 ul");
	img_count = imgs.children().length;

	$('#back3').click(function() {
		back();
	});
	$('#next3').click(function() {
		next();
	});

	function back() {
		if (1 < img_position) {
			imgs.animate({
				left : '+=1000px'
			});
			img_position--;
		}
	}

	function next() {
		if (img_count > img_position) {
			imgs.animate({
				left : '-=1000px'
			});
			img_position++;
		}
	}
});


/**
 * 브랜드별 상품 데이터 쿼리를 위한 함수
 */
function searchBrand(brand) {
	var sea = brand;
	self.location = "searchPrd?sPrd=" + sea; 
}

