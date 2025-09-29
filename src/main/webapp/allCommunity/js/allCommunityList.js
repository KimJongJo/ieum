$(function () {
	const $grid = $('.community-grid'); // 공통으로 선언

    // 최신순
    $('#latest').on('click', function () {
        const $boxes = $grid.children('.boxes').get();
        $boxes.sort(function (a, b) {
            const dateA = new Date($(a).find('.text-wrapper-3').text().trim());
            const dateB = new Date($(b).find('.text-wrapper-3').text().trim());
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
        const selectedCategory = $(this).next().text().trim();
        $('.right-container .boxes').each(function () {
            const boxCategory = $(this).find('.text-wrapper-2').text().trim();
            if (selectedCategory === "모든 사연" || boxCategory === selectedCategory) {
                $(this).css('display', 'flex');
            } else {
                $(this).css('display', 'none');
            }
        });
    });

    // ✅ '관리 메뉴' 숨기기
    $('.menu span:nth-child(5)').hide();
});
