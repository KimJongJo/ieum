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

    // 작성 완료 버튼 클릭 → 모달 열기
    $("#btn-complete").on("click", function () {
        $("#completeModal").css("display", "flex");
    });

    // 작성 완료 모달 닫기 버튼
    $("#modalCloseComplete").on("click", function () {
        $("#completeModal").hide();
    });

    // 모달 완료 클릭 시 hidden input 체크 후 form submit
    $("#modalOkComplete").on("click", function () {
        const categoryNo = $("#categoryNo").val();
        console.log("전송 직전 hidden input: ", categoryNo);
        if (!categoryNo) {
            alert("카테고리를 선택해주세요.");
            return;
        }
        $("#writeForm")[0].submit();
    });

    // 작성 취소 버튼 → 모달 열기
    $("#btn-cancellation").on("click", function () {
        $("#cancelModal").css("display", "flex");
    });

    // 작성 취소 모달 닫기 버튼
    $("#modalCloseCancel, #modalCancelCancel").on("click", function () {
        $("#cancelModal").hide();
    });

    // 작성 취소 확인 버튼 → form reset
    $("#modalOkCancel").on("click", function () {
        $("#writeForm")[0].reset();
        $("#cancelModal").hide();
        // 카테고리 버튼 텍스트 초기화
        $(".category-btn .category-text").text("카테고리");
        $("#categoryNo").val("");
    });
});
