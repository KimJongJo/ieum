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
    // 차단 해제 버튼 클릭 시 모달 열기
    $(document).on("click", ".unblock-btn", function () {
        $("#completeModalBlack").fadeIn(); // 모달 열기
    });

    // 모달 닫기 (X 버튼, 취소 버튼)
    $("#modalCloseCompleteBlack, #modalCancelCompleteBlack").click(function () {
        $("#completeModalBlack").fadeOut(); // 모달 닫기
    });

    // 해제 버튼 클릭 시 (추후 서버와 연동 가능)
    $("#modalOkCompleteBlack").click(function () {
        alert("차단 해제 처리 완료!"); 
        $("#completeModalBlack").fadeOut(); 
    });
});