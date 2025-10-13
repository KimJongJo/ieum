$(document).ready(function() {

    // -----------------------------
    // 1️⃣ 테이블 안 view-more 버튼 클릭 → 같은 행 콘텐츠 토글
    // -----------------------------
$(document).on("click", ".view-more", function() {
    const $contentDiv = $(this).closest("tr").find(".patient-comment-content");
    const $img = $(this).find("img");

    // 내용 보이기/숨기기
    $contentDiv.toggle();

    // 이미지 회전 토글
    $img.toggleClass("rotated");
});

    // -----------------------------
    // 2️⃣ show-btn 클릭 → 모달 열기 -> 이건 각자 js 에서 해야함 넣으려는 div id가 다름
    // -----------------------------
//    $(document).on("click", ".show-btn", function() {
//        $("#show-dia-info").css("display", "flex");
//    });

    // -----------------------------
    // 3️⃣ 모달 닫기 버튼 클릭 → 모달 닫기
    // -----------------------------
    $(document).on("click", "#more-dia-x", function() {
        $("#show-dia-info").hide();
    });

    // -----------------------------
    // 4️⃣ 모달 배경 클릭 → 모달 닫기
    // -----------------------------
    $(document).on("click", "#p-info-div", function() {
        $("#show-dia-info").hide();
        $("#modal-dia2").hide(); // modalProfile2에 해당
    });

});
