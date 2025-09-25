
$(function() {

    /* ===========================
       1️⃣ diagnosis-box 토글
    =========================== */
    var $diagnosisBox = $("#diagnosis-box");
    var $btn1 = $("#btn1");
    var $btnImg = $btn1.find("img");

    $diagnosisBox.hide(); // 처음 숨김

    $btn1.on("click", function() {
        $diagnosisBox.toggle(); // display: none <-> block 전환
        if ($diagnosisBox.is(":visible")) {
            $btnImg.css("transform", "rotate(0deg)");
        } else {
            $btnImg.css("transform", "rotate(180deg)");
        }
    });


    /* ===========================
       2️⃣ community-box 토글
    =========================== */
    var $frame = $("#community-box .frame");
    var $btn3 = $("#btn3");
    var $btn3Img = $btn3.find("img");

    $frame.hide(); // 처음 숨김

    $btn3.on("click", function() {
        $frame.toggle(); // display none <-> flex 전환
        if ($frame.is(":visible")) {
            $frame.css("display", "flex"); // toggle 후 flex 유지
            $btn3Img.css("transform", "rotate(0deg)");
        } else {
            $btn3Img.css("transform", "rotate(180deg)");
        }
    });


    /* ===========================
       3️⃣ '관리 메뉴' 숨기기
    =========================== */
    $(".menu span:nth-child(5)").hide();

});