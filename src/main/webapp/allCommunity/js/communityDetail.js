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
        const commuNo = $(this).data('communo');  // 클릭한 게시글 번호 저장
        $('#completeModal').data('communo', commuNo).show();
    });


    /* 모달 닫기 */
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
    // 실제 PK 를 읽어온다 (data-comme-no)
    var commeNo = commentBox.attr('data-comme-no'); 
    // 작성자 uNo
    var blockedNo = commentBox.find('.comNick span').attr('data-no');

    $('#blockCommuNo').val(commuNo);
    $('#blockCommeNo').val(commeNo);
    $('#blockBlockedNo').val(blockedNo);
    $('#blockModal').show();
});
    /* 모달 닫기 */
    $('#modalCloseBlock, #modalCancelBlock').click(function() {
        $('#blockModal').hide();
    });
    
    /* 관리 메뉴 숨기기 */
    $('.hide-if-user').hide();

});