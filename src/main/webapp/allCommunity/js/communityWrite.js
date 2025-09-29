function toggleCategory() {
    const $categoryBox = $("#categoryBox");
    const $arrow = $(".arrow");
    const $btn = $(".category-btn");

    if ($categoryBox.css("display") === "block") {
        $categoryBox.hide();
        $arrow.removeClass("rotate");
    } else {
        const rect = $btn[0].getBoundingClientRect();
        const scrollTop = $(window).scrollTop();
        const scrollLeft = $(window).scrollLeft();

        $categoryBox.css({
            top:  (rect.top + scrollTop - 14) + "px",
            left: (rect.right + scrollLeft + 20) + "px"
        }).show();

        $arrow.addClass("rotate");
    }
}

$(document).ready(function () {

    // 카테고리 클릭 시 hidden input 업데이트
    $("#categoryBox span").on("click", function () {
        const categoryNo = $(this).data("no");
        $("#categoryNo").val(categoryNo);      // hidden input 값 설정
        $(".category-btn .category-text").text($(this).text());
        $("#categoryBox").hide();
        $(".arrow").removeClass("rotate");
        console.log("선택된 카테고리:", categoryNo); // 디버깅용
    });

    // 작성 완료 모달
    $("#btn-complete").on("click", function () {
        $("#completeModal").css("display", "flex");
    });
    $("#modalCloseComplete").on("click", function () {
        $("#completeModal").hide();
    });

    // 작성 취소 모달
    $("#btn-cancellation").on("click", function () {
        $("#cancelModal").css("display", "flex");
    });
    $("#modalCloseCancel, #modalCancelCancel").on("click", function () {
        $("#cancelModal").hide();
    });
    $("#modalOkCancel").on("click", function () {
        $("#writeForm")[0].reset();
        $("#cancelModal").hide();
    });

});