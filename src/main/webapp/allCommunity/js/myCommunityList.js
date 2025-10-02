$(document).ready(function() {

    // 댓글 길면 짤리게
    const maxChars = 50;
    const $p = $("#text");
    if ($p.text().length > maxChars) {
        $p.text($p.text().slice(0, maxChars) + '...');
    }

    const $tabCommu = $('.tab-commu');
    const $tabComment = $('.tab-comment');
    const $tabHeart = $('.tab-heart');

    const $frame = $('.frame');      // 게시판 영역
    const $comment = $('.comment');  // 댓글 영역

    // 처음에는 작성한 게시판만 active
    $tabCommu.addClass('active');
    $frame.show();
    $comment.hide();

    // 탭 클릭 이벤트
    $tabCommu.click(function() {
        $tabCommu.addClass('active');
        $tabComment.removeClass('active');
        $tabHeart.removeClass('active');
        $frame.show();
        $comment.hide();
    });

    $tabComment.click(function() {
        $tabComment.addClass('active');
        $tabCommu.removeClass('active');
        $tabHeart.removeClass('active');
        $frame.hide();
        $comment.show();
    });

    $tabHeart.click(function() {
        $tabHeart.addClass('active');
        $tabCommu.removeClass('active');
        $tabComment.removeClass('active');
        $frame.show();
        $comment.hide();
    });
});


// 숨김 요소 처리
$(document).ready(function() {
    $('.hide-if-user').hide();
});
