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


$(function () {

    /* 댓글 메뉴 토글 */
    $(document).on('click', '.comment-box .menu-button', function (e) {
        e.stopPropagation();
        $('.userMenu').hide();
        $(this).closest('.comment-box').find('.userMenu').css('display', 'flex');
    });
    $(document).on('click', function (e) {
        if ($(e.target).closest('.userMenu, .menu-button').length === 0) {
            $('.userMenu').hide();
        }
    });

    /* 삭제 버튼 클릭 → 모달 표시 */
    $(document).on('click', '#btn-delete', function(e) {
        e.preventDefault();
        const commuNo = $(this).data('communo');  
        $('#completeModal').data('communo', commuNo).show();
    });

    /* 삭제 모달 닫기 */
    $('#modalCloseComplete, #modalCancelComplete').click(function() {
        $('#completeModal').hide();
    });

    /* 신고 모달 */
    $(document).on('click', '.userMenu .menu-item1:contains("신고하기")', function (e) {
        e.preventDefault();
        $('#blockReportModal').show();
    });
    $('#modalClosereportBlock, #modalCancelreportBlock, #modalOkreportBlock').click(function() {
        $('#blockReportModal').hide();
    });

    /* 댓글 차단 모달 */
    $(document).on('click', '.userMenu .menu-item2:contains("댓글차단")', function (e) {
        e.preventDefault();
        var commentBox = $(this).closest('.comment-box');
        var commuNo = "${community.commuNo}";
        var commeNo = commentBox.attr('data-comme-no'); 
        var blockedNo = commentBox.find('.comNick span').attr('data-no');

        $('#blockCommuNo').val(commuNo);
        $('#blockCommeNo').val(commeNo);
        $('#blockBlockedNo').val(blockedNo);
        $('#blockModal').show();
    });

    /* 댓글 차단 모달 닫기 */
    $('#modalCloseBlock, #modalCancelBlock').click(function() {
        $('#blockModal').hide();
    });

    /* 관리 메뉴 숨기기 */
    $('.hide-if-user').hide();
   
    $('#btn-complete').off('click').on('click', function(e) {
        console.log("클릭됨"); // 클릭 확인용 로그

        var categoryNo = $('#categoryNo').val();
        var title = $('#title').val().trim();
        var content = $('#content-write').val().trim();

        // 카테고리 체크
        if (!categoryNo || categoryNo === "") {
            alert('카테고리를 선택해주세요.');
            e.preventDefault();
            return false;
        }

        // 제목 체크
        if (!title || title.length === 0) {
            alert('제목을 입력해주세요.');
            e.preventDefault();
            return false;
        }

        // 내용 체크
        if (!content || content.length === 0) {
            alert('내용을 입력해주세요.');
            e.preventDefault();
            return false;
        }

        // 모두 통과하면 모달 표시
        $('#completeModal').show();
    });

   
   

    $('#modalOkComplete').click(function() {
        $('#writeForm').submit();
    });
    
    // 모달 닫기
    $('#modalCloseComplete, #modalCancelComplete').click(function() {
        $('#completeModal').hide();
    });

    /********** 작성 취소 모달 **********/
    $('#btn-cancellation').click(function() {
        // 수정 모드인지 확인
        var isEditMode = "${not empty community}" === "true";
        if(isEditMode){
            $('#cancelModalcorrection').show();  // 수정 모드 모달
        } else {
            $('#cancelModal').show();            // 새 글 작성 모드 모달
        }
    });

    // 취소 모달 닫기
    $('#modalCloseCancel, #modalCancelCancel').click(function() {
        $('#cancelModal').hide();
    });
    $('#modalCloseCancelcorrection, #modalCancelCancelcorrection').click(function() {
        $('#cancelModalcorrection').hide();
    });

    // 수정 모드 취소 → 확인 시 이동
    $('#modalOkCancelcorrection').click(function() {
        window.location.href = "${pageContext.request.contextPath}/myCom"; 
    });

    // 새 글 작성 모드 취소 → 확인 시 이동
    $('#modalOkCancel').click(function() {
        window.location.href = "${pageContext.request.contextPath}/myCom"; 
    });
    

});