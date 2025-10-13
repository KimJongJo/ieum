window.addEventListener("pageshow", function(event) {
    if (event.persisted) {
        // bfcache(뒤로가기 캐시)에서 불러온 경우
        window.location.reload();
    }
});

//게시글 하트 색 변경
$(function(){
    $('.actions form').submit(function(e){
        e.preventDefault(); // 새로고침 방지
        var form = $(this);
        var commuNo = form.find('input[name="commuNo"]').val();
        var countSpan = form.find('.action-count').first(); // 공감 수
        var heartSpan = form.find('.heart'); // 하트 이미지 span

        $.post(form.attr('action'), {commuNo: commuNo}, function(data){
            // 공감 수 갱신
            countSpan.text(data.newCount);

            // 하트 색상 갱신
            if(data.liked){
                heartSpan.html('<img src="' + '${pageContext.request.contextPath}/img/빨간하트.png' + '" alt="좋아요" width="15" height="15"/>');
            } else {
                heartSpan.html('<img src="' + '${pageContext.request.contextPath}/img/횐색하트.png' + '" alt="좋아요" width="15" height="15"/>');
            }
        }, "json");
    });
});



$(document).ready(function() {

    const $tabCommu = $('.tab-commu');
    const $tabComment = $('.tab-comment');
    const $tabHeart = $('.tab-heart');

    const $frame = $('.frame');      // 작성한 게시판
    const $comment = $('.comment');  // 작성한 댓글
    const $frame1 = $('.frame1');    // 좋아요 누른 게시판
    
    const $comPaging = $('.comPaging');
    const $commentPaging = $('.commentPaging');
    const $heartPaging = $('.heartPaging');

    // 처음에는 작성한 게시판만 active
    $tabCommu.addClass('active');
    $frame.show();
    $comment.hide();
    $frame1.hide();
    
    $comPaging.show();
    $commentPaging.hide();
    $heartPaging.hide();

    // 탭 클릭 이벤트
    $tabCommu.click(function() {
        $tabCommu.addClass('active');
        $tabComment.removeClass('active');
        $tabHeart.removeClass('active');
        $frame.show();
        $comment.hide();
        $frame1.hide();
        
        $comPaging.show();
        $commentPaging.hide();
        $heartPaging.hide();

    });

    $tabComment.click(function() {
        $tabComment.addClass('active');
        $tabCommu.removeClass('active');
        $tabHeart.removeClass('active');
        
        $frame.hide();
        $comment.show();
        $frame1.hide();
		
        $comPaging.hide();
        $commentPaging.show();
        $heartPaging.hide();
    });

    $tabHeart.click(function() {
        $tabHeart.addClass('active');
        $tabCommu.removeClass('active');
        $tabComment.removeClass('active');
        
        $frame.hide();
        $comment.hide();
        $frame1.show();
		
        $comPaging.hide();
        $commentPaging.hide();
        $heartPaging.show();
    });
});



// 숨김 요소 처리
$(document).ready(function() {
    $('.hide-if-user').hide();
});