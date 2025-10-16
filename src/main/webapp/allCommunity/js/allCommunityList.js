window.addEventListener("pageshow", function(event) {
    if (event.persisted) {
        window.location.reload();
    }
});




$(function () {
	const $grid = $('.community-grid'); // 공통으로 선언

    // 최신순
    $('#latest').on('click', function () {
    const $boxes = $grid.children('.boxes').get();
    $boxes.sort(function (a, b) {
        const dateA = new Date($(a).find('.text-wrapper-3').text().trim());
        const dateB = new Date($(b).find('.text-wrapper-3').text().trim());
        const noA = parseInt($(a).find('input[name="commuNo"]').val(), 10);
        const noB = parseInt($(b).find('input[name="commuNo"]').val(), 10);

        // 날짜가 같으면 글번호로 정렬
        if (dateA.getTime() === dateB.getTime()) {
            return noB - noA;
        }
        return dateB - dateA;
    });
    $.each($boxes, function (_, box) {
        $grid.append(box);
    });
});

    // 공감순
    $('#empathy').on('click', function () {
        const $boxes = $grid.children('.boxes').get();
        $boxes.sort(function (a, b) {
            const countA = parseInt($(a).find('.actions .action-item:nth-child(1) .action-count').text(), 10);
            const countB = parseInt($(b).find('.actions .action-item:nth-child(1) .action-count').text(), 10);
            return countB - countA;
        });
        $.each($boxes, function (_, box) {
            $grid.append(box);
        });
    });

    // 조회순
    $('#by-view').on('click', function () {
        const $boxes = $grid.children('.boxes').get();
        $boxes.sort(function (a, b) {
            const countA = parseInt($(a).find('.actions .action-item:nth-child(3) .action-count').text(), 10);
            const countB = parseInt($(b).find('.actions .action-item:nth-child(3) .action-count').text(), 10);
            return countB - countA;
        });
        $.each($boxes, function (_, box) {
            $grid.append(box);
        });
    });

    // ✅ 카테고리 필터
	$('.category-list input[type="radio"]').on('change', function () {
	    const selectedCategory = $(this).next('label').text().trim(); // 라벨 텍스트로 카테고리 가져오기
	
	    $('.right-container .boxes').each(function () {
	        const boxCategory = $(this).find('.text-wrapper-2').text().trim();
	
	        // "모든 사연"이면 전체 표시, 아니면 일치하는 카테고리만 표시
	        if (selectedCategory === "모든 사연" || boxCategory === selectedCategory) {
	            $(this).show(); // display:flex; 대신 show() 사용 (기본 display 유지)
	        } else {
	            $(this).hide();
	        }
	    });
	});
    // ✅ '관리 메뉴' 숨기기
    $('.menu span:nth-child(5)').hide();
});




// 게시글 하트 색 변경
$(function() {
    $('.actions form').submit(function(e){
        e.preventDefault(); // 새로고침 막기
        let form = $(this);
        let commuNo = form.find('input[name="commuNo"]').val();
        let countSpan = form.find('.action-count');
        let heartSpan = form.find('.heart'); // ❤️ 담는 곳

        $.post(form.attr('action'), {commuNo: commuNo}, function(data){
            // 공감 수 갱신
            countSpan.text(data.newCount);


            // 하트 이미지 갱신
            if (data.liked) {
                heartSpan.html('<img src="' + contextPath + '/img/빨간하트.png" alt="좋아요" width="15" height="15"/>');
            } else {
                heartSpan.html('<img src="' + contextPath + '/img/횐색하트.png" alt="좋아요" width="15" height="15"/>');
            }
        }, "json"); // JSON으로 받기
    });
});


$(document).ready(function() {
    $('.hide-if-user').hide();
});