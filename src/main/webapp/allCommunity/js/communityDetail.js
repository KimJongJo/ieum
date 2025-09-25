$(function () {

    /* 1) 댓글 메뉴 토글 (동적 요소도 작동하도록 이벤트 위임 사용) */
    $(document).on('click', '.comment-box .menu-button', function (e) {
        e.stopPropagation();
        $('.userMenu').hide(); // 모든 메뉴 닫기
        $(this).closest('.comment-box').find('.userMenu').css('display', 'flex'); // 현재 것만 열기
    });

    // 바깥 클릭 시 메뉴 닫기 (단, 메뉴 내부 클릭은 무시)
    $(document).on('click', function (e) {
        if ($(e.target).closest('.userMenu, .menu-button').length === 0) {
            $('.userMenu').hide();
        }
    });


    /* 2) 완료 모달 (없어도 에러 안 남도록 위임 사용) */
    $(document).on('click', '#btn-delete', function (e) {
        e.preventDefault();
        $('#completeModal').css('display', 'flex');
    });

    $(document).on('click', '#modalCloseComplete, #modalCancelComplete, #modalOkComplete', function () {
        $('#completeModal').hide();
    });


    /* 3) '관리 메뉴' 숨기기 */
    // nth-child(5)가 의도한 요소인지 확인하세요 (index는 1부터)
    $('.menu span:nth-child(5)').hide();

});

