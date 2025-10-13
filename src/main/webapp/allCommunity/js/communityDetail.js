const contextPath = '${contextPath}'; // JS에서 사용할 contextPath
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
    

    // 게시글 하트 색 변경
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
                    heartSpan.html('<img src="' + contextPath + '/img/빨간하트.png" alt="좋아요" width="15" height="15"/>');
                } else {
                    heartSpan.html('<img src="' + contextPath + '/img/횐색하트.png" alt="좋아요" width="15" height="15"/>');
                }
            }, "json"); // JSON으로 받기
        });
    });

  //댓글 하트 색 변경
	$('.comment-action-item').click(function(e){
	    e.preventDefault(); // 버튼 기본 submit 막기
	    let form = $(this).closest('form');
	    let commeNo = form.find('input[name="commeNo"]').val();
	    let countSpan = form.find('.comment-action-count');
	    let heartSpan = form.find('.heart1');
	
	    $.post(form.attr('action'), {commeNo: commeNo}, function(data){
	        countSpan.text(data.newCount);
	        if (data.liked) {
	            heartSpan.html('<img class="heart1-img" src="' + '${pageContext.request.contextPath}/img/빨간하트.png' + '" width="15" height="15"/>');
	        } else {
	            heartSpan.html('<img class="heart1-img" src="' + '${pageContext.request.contextPath}/img/횐색하트.png' + '" width="15" height="15"/>');
	        }
	    }, "json");
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
             alert("당신 게시글 아니잖아 저리가");
         });
    });


    /* 모달 닫기 */
   $('#modalCloseComplete, #modalCancelComplete, #modalCloseBlockCom').click(function() {
    $('#completeModal').hide();
});
    
    
// 신고하기 메뉴 클릭 시
   $(document).on('click', '.userMenu .menu-item1:contains("신고하기")', function (e) {
       e.preventDefault();
       var commentBox = $(this).closest('.comment-box');
       var commeNo = commentBox.attr('data-comme-no'); // 댓글 번호 가져오기
       
       // hidden input에 값 설정
       $('#reportCommeNo').val(commeNo);

       $('#blockReportModal').show();
   });
   
// 신고하기 모달 AJAX 처리
   $('#reportForm').submit(function(e){
    e.preventDefault(); // 기본 submit 막기
    var form = $(this);
    var commeNo = $('#reportCommeNo').val();

    $.post(form.attr('action'), { commeNo: commeNo }, function(data){
        alert(data.message); // 서버에서 받은 메시지 출력
        if(data.success){
            $('#blockReportModal').hide();  // 성공하면 모달 닫기
        }
    }, "json")
    .fail(function(){
        alert("서버 오류 발생");
    });
});
   
   
   $('#modalClosereportBlock, #modalCancelreportBlock').click(function() {
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
    
//댓글 차단 모달에서 "차단" 버튼 클릭 시 AJAX 처리
$('#blockCommentForm').submit(function(e){
    e.preventDefault(); // 기본 submit 막기
    var form = $(this);
    var commuNo = $('#blockCommuNo').val();
    var commeNo = $('#blockCommeNo').val();
    var blockedNo = $('#blockBlockedNo').val();

    $.post(form.attr('action'), { commuNo: commuNo, commeNo: commeNo, blockedNo: blockedNo })
     .done(function(data){
         if(data.success){
             // 해당 댓글 DOM 제거
             // $('.comment-box[data-comme-no="'+commeNo+'"]').remove();  // 기존 DOM 제거는 필요 없으면 주석 처리
             
             // 페이지 자동 새로고침
             location.reload();  
         } else {
             alert("응 차단못해~ 나가!!");
         }
     })
     .fail(function(){
         alert("서버 오류 발생");
     });
});  
    
    
    /* 모달 닫기 */
    $('#modalCloseBlock, #modalCancelBlock').click(function() {
        $('#blockModal').hide();
    });
    
    /* 관리 메뉴 숨기기 */
    $('.hide-if-user').hide();

});