$(function() {
    // =========================
    // 카테고리 토글
    // =========================
    $(".category-btn").on("click", function() {
        const $categoryBox = $("#categoryBox");
        const $arrow = $(this).find(".arrow"); // 클릭한 버튼 내부 화살표

        if ($categoryBox.is(":visible")) {
            $categoryBox.hide();
            $arrow.removeClass("rotate");
        } else {
            const rect = this.getBoundingClientRect();
            const scrollTop = $(window).scrollTop();
            const scrollLeft = $(window).scrollLeft();

            $categoryBox.css({
                top: (rect.top + scrollTop - 14) + "px",
                left: (rect.right + scrollLeft + 20) + "px"
            }).show();

            $arrow.addClass("rotate");
        }
    });

    // 카테고리 클릭 시 버튼 텍스트 변경
    $("#categoryBox span").on("click", function() {
        $(".category-btn .category-text").text($(this).text());
        $("#categoryBox").hide();
        $(".arrow").removeClass("rotate");
    });

    // =========================
    // 관리 메뉴 숨기기
    // =========================
    $('.menu span:nth-child(5)').hide();

    // =========================
    // 완료 모달
    // =========================
    $("#btn-complete").on("click", function() {
        $("#completeModal").css("display", "flex");
    });

    $("#modalCloseComplete, #modalCancelComplete, #modalOkComplete").on("click", function() {
        $("#completeModal").hide();
    });

    // =========================
    // 취소 모달
    // =========================
    $("#btn-cancellation").on("click", function() {
        $("#cancelModal").css("display", "flex");
    });

    $("#modalCloseCancel, #modalCancelCancel, #modalOkCancel").on("click", function() {
        $("#cancelModal").hide();
    });
});
