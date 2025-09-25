$(document).ready(function () { // 준비(바인딩)된 순간 내부 코드 실행

    /* =======================
       카테고리 토글
    ======================= */
    function toggleCategory() {
        const $categoryBox = $("#categoryBox"); // 변수 선언
        const $arrow = $(".arrow");             // 변수 선언
        const $btn = $(".category-btn");        // 변수 선언

        if ($categoryBox.css("display") === "block") {  //display 속성값을 가져와서 block 인지 확인 즉, block -> 현재 카테고리 박스가 화면에 보이는 상태
            $categoryBox.hide(); //카테고리를 화면에서 숨김
            $arrow.removeClass("rotate"); // rotate를 제커 (즉, 원상복구)
        } else {
            // 버튼 위치 계산
            const rect = $btn[0].getBoundingClientRect(); // getBoundingClientRect();는 브라우저 화면에 대한 버튼의 상대 위치(상/하/좌/우)를 반환
            const scrollTop = $(window).scrollTop(); //스크롤 오프셋을 더해 문서 전체 기준(절대좌표)으로 변환 
            const scrollLeft = $(window).scrollLeft(); // '위 설명과 같음'

            // 버튼 바로 옆에 위치시키기
            $categoryBox.css({
                top:  (rect.top + scrollTop - 14) + "px", // 카테고리 박스의 위치 설정
                left: (rect.right + scrollLeft + 20) + "px"
            }).show(); 보여줌

            $arrow.addClass("rotate"); // transform으로 맞춘 css가 적용됨
        }
    }

    // 카테고리 버튼 클릭
    $(".category-btn").on("click", toggleCategory);

    // 카테고리 선택 시 버튼 텍스트 변경
    $("#categoryBox span").on("click", function () {
        $(".category-text").text($(this).text());
        $("#categoryBox").hide();
        $(".arrow").removeClass("rotate");
    });

    /* =======================
       관리 메뉴 숨기기
    ======================= */
    $(".menu span:nth-child(5)").hide();

    /* =======================
       작성 완료 모달
    ======================= */
    $("#btn-complete").on("click", function () {
        $("#completeModal").css("display", "flex");
    });
    $("#modalCloseComplete, #modalCancelComplete, #modalOkComplete").on("click", function () {
        $("#completeModal").hide();
    });

    /* =======================
       작성 취소 모달
    ======================= */
    $("#btn-cancellation").on("click", function () {
        $("#cancelModal").css("display", "flex");
    });
    $("#modalCloseCancel, #modalCancelCancel, #modalOkCancel").on("click", function () {
        $("#cancelModal").hide();
    });

});