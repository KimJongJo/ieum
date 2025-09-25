function toggleCategory() {
    const $categoryBox = $("#categoryBox");
    const $arrow = $(".arrow");
    const $btn = $(".category-btn");

    if ($categoryBox.css("display") === "block") {
        $categoryBox.hide();
        $arrow.removeClass("rotate");
    } else {
        // 버튼 위치 계산
        const rect = $btn[0].getBoundingClientRect();
        const scrollTop = $(window).scrollTop();
        const scrollLeft = $(window).scrollLeft();

        // 🔥 버튼 바로 옆에 위치시키기
        $categoryBox.css({
            top:  (rect.top + scrollTop - 14) + "px",
            left: (rect.right + scrollLeft + 20) + "px"
        }).show();

        $arrow.addClass("rotate");
    }
}

$(document).ready(function () {

    /* ✅ 카테고리 클릭 시 버튼 텍스트 변경 */
    $("#categoryBox span").on("click", function () {
        $(".category-btn .category-text").text($(this).text());
        $("#categoryBox").hide();
        $(".arrow").removeClass("rotate");
    });

    /* ✅ '관리 메뉴' 숨기기 */
    $(".menu span:nth-child(5)").hide();

    /* ✅ 작성 완료 모달 */
    $("#btn-complete").on("click", function () {
        $("#completeModal").css("display", "flex");
    });
    $("#modalCloseComplete, #modalCancelComplete, #modalOkComplete").on("click", function () {
        $("#completeModal").hide();
    });

    /* ✅ 작성 취소 모달 */
    $("#btn-cancellation").on("click", function () {
        $("#cancelModal").css("display", "flex");
    });
    $("#modalCloseCancel, #modalCancelCancel, #modalOkCancel").on("click", function () {
        $("#cancelModal").hide();
    });

});