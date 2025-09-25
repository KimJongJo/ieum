
$(document).ready(function() {

    // 1. 탭 클릭 시 active 바꾸기
    $(".tab").click(function() {
        $(".tab").removeClass("active");
        $(this).addClass("active");
    });

    // 2. 댓글 길면 짤리게
    const maxChars = 50;
    const $p = $("#text");
    if ($p.text().length > maxChars) {
        $p.text($p.text().slice(0, maxChars) + '...');
    }

    // 3. 헤더 숨기는 기능
    $('.menu span:nth-child(5)').hide();

    // 4. 클릭 이벤트 (탭에 따라 게시판/댓글 영역 전환)
    const $tabCommu = $('.tab-commu');
    const $tabComment = $('.tab-comment');
    const $tabHeart = $('.tab-heart');

    const $frame = $('.frame');      // 게시판 영역
    const $comment = $('.comment');  // 댓글 영역

    // 처음에는 게시판만 보이도록
    $frame.show();
    $comment.hide();

    function activateTab($selectedTab) {
        $tabCommu.add($tabComment).add($tabHeart).removeClass('active');
        $selectedTab.addClass('active');
    }

    $tabCommu.click(function() {
        activateTab($tabCommu);
        $frame.show();
        $comment.hide();
    });

    $tabComment.click(function() {
        activateTab($tabComment);
        $frame.hide();
        $comment.show();
    });

    $tabHeart.click(function() {
        activateTab($tabHeart);
        $frame.show();     // 좋아요 누른 게시판도 게시판처럼
        $comment.hide();
    });

});

