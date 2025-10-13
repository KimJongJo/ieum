$(function () {
    // 1️⃣ '관리 메뉴' 숨기기
    $(".menu span:nth-child(5)").hide();

    // 2️⃣ 탭 클릭 시 active 바꾸기
    $(".tab").on("click", function() {
        $(".tab").removeClass("active"); // 모든 탭에서 active 제거
        $(this).addClass("active");      // 클릭한 탭에 active 추가
    });
});




$(document).ready(function () {
    // 차단 해제 버튼 클릭
    $(document).on("click", ".unblock-btn", function (e) {
        e.preventDefault(); // 폼 제출 막기
        $("#completeModalBlack").fadeIn(); // 모달 열기

        // 클릭한 버튼의 폼 저장
        window.currentForm = $(this).closest("form");
    });

    // 모달 닫기 (X 버튼, 취소 버튼)
    $("#modalCloseCompleteBlack, #modalCancelCompleteBlack").click(function () {
        $("#completeModalBlack").fadeOut();
    });

    // 모달 확인 버튼 클릭 시 폼 제출
    $("#modalOkCompleteBlack").click(function () {
        if(window.currentForm) {
            window.currentForm.submit(); // 실제 POST 요청
        }
        $("#completeModalBlack").fadeOut();
    });
});


$(document).ready(function() {
    $('.hide-if-user').hide();
});