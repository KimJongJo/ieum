$(function () {
    // 1️⃣ '관리 메뉴' 숨기기
    $(".menu span:nth-child(5)").hide();

    // 2️⃣ 탭 클릭 시 active 바꾸기
    $(".tab").on("click", function() {
        $(".tab").removeClass("active"); // 모든 탭에서 active 제거
        $(this).addClass("active");      // 클릭한 탭에 active 추가
    });
});