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
    
    $(function() {
        $('.actions form').submit(function(e){
            e.preventDefault(); // 새로고침 막기
            let form = $(this);
            let commuNo = form.find('input[name="commuNo"]').val();
            let countSpan = form.find('.action-count');
            let heartSpan = form.find('.heart'); // ❤️ 담는 곳

            $.post(form.attr('action'), {commuNo: commuNo}, function(data){
                // 공감 수 갱신
                countSpan.text(data.newCount);

                // 하트 이미지 갱신
                if (data.liked) {
                    heartSpan.html('<img src="' + '${pageContext.request.contextPath}/img/빨간하트.png' + '" alt="좋아요" width="15" height="15"/>');
                } else {
                    heartSpan.html('<img src="' + '${pageContext.request.contextPath}/img/횐색하트.png' + '" alt="좋아요" width="15" height="15"/>');
                }
            }, "json"); // JSON으로 받기
        });
    });

    /* 삭제 버튼 클릭 → 모달 표시 */
    $(document).on('click', '#btn-delete', function(e) {
        e.preventDefault();
        const commuNo = $(this).data('communo');  // 클릭한 게시글 번호 저장
        $('#completeModal').data('communo', commuNo).show();
    });
    
 // 모달 삭제 버튼 클릭 시
    $('#modalOkComplete').click(function() {
        const commuNo = $('#completeModal').data('communo'); // 모달에 저장된 게시글 번호
        $.post("${pageContext.request.contextPath}/delComDetail", { commuNo: commuNo })
         .done(function() {
             // 삭제 후 페이지 이동
             window.location.href = "${pageContext.request.contextPath}/myCom";
         })
         .fail(function() {
             alert("삭제 실패");
         });
    });


    /* 모달 닫기 */
   $('#modalCloseComplete, #modalCancelComplete, #modalCloseBlockCom').click(function() {
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