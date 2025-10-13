<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/allCommunity/css/communityWrite.css" />
<script src="${pageContext.request.contextPath}/allCommunity/js/communityWrite.js"></script>
<script>
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

    /********** 작성 완료 모달 **********/
    /* $('#btn-complete').click(function() {
        $('#completeModal').show();
    });

    $('#modalCloseComplete, #modalCancelComplete').click(function() {
        $('#completeModal').hide();
    }); */
    
    /********** 작성 완료 모달 **********/
    /* $('#btn-complete').off('click').on('click', function(e) {
	    var categoryNo = $('#categoryNo').val();
	    if (!categoryNo || categoryNo === "") {
	        alert('카테고리를 선택해주세요.');
	        e.preventDefault();   // 폼 제출 방지
	        return false;         // 모달 뜨는 거 방지
	    }
	    $('#completeModal').show();
	}); */
	
	$('#btn-complete').off('click').on('click', function(e) {
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
</script>
</head>
<body>
<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>

    <c:choose>
	    <c:when test="${empty community}">
	        <!-- 수정 모드 -->
	        <form id="writeForm" action="${pageContext.request.contextPath}/write" method="post">
	         <div id="section-title">
		        <div><span>커뮤니티 작성</span></div>
		    </div>
	    </c:when>
	    <c:otherwise>
	        <!-- 새 글 작성 모드 -->
	        <form id="writeForm" action="${pageContext.request.contextPath}/comDetailMo" method="post">
	         <div id="section-title">
		        <div><span>커뮤니티 수정</span></div>
		    </div>
	    </c:otherwise>
	</c:choose>

    <div class="community-title">
        <div id="title-header">제목</div>
        <div class="category-btn" onclick="toggleCategory()">
            <span class="category-text">
            	<c:out value="${category.categoryName}" default="카테고리"/>
            </span> <span class="arrow"><<</span>
        </div>
    </div>

    <div class="community-content">
        <div id="title-write">
            <input type="text" id="title" name="title" placeholder="제목" maxlength="53"
            	value="<c:out value='${community.commuTitle}'/>">
        </div>
        <div id="content-header">내용</div>
        <div>
            <textarea id="content-write" name="content" placeholder="내용" maxlength="3000">${fn:trim(community.commuContent)}</textarea>      
        </div>
    </div>

    <div id="btn-event">
        <button type="button" id="btn-cancellation">작성 취소</button>
        <button type="button" id="btn-complete">작성 완료</button>
    </div>

	<!-- 기존 글 번호 hidden (수정 모드에서만 필요) -->
    <c:if test="${not empty community}">
        <input type="hidden" name="no" value="<c:out value='${community.commuNo}'/>"/>
    </c:if>
    <!-- 선택 카테고리 hidden -->
    <input type="hidden" id="categoryNo" name="categoryNo" value="<c:out value='${community.categoryNo}'/>"/>
	

    <!-- 작성 완료 모달 -->
    <div class="modal-main-div" id="completeModal" style="display:none;">
        <div class="modal-div-over">
            <div class="modal-header-div">
                <span class="modal-header-div-span">알림</span>
                <button type="button" class="x-button" id="modalCloseComplete">✖</button>
            </div>
            <div class="modal-content-div">
                <span class="modal-content-div-span">완료 하시겠습니까?</span>
            </div>
            <div class="modal-div-under">
                <div class="modal-btn-div">
                    <button type="button" class="modal-btn-left modal-btn" id="modalCancelComplete">취소</button>
                    <button type="button" class="modal-btn-right modal-btn" id="modalOkComplete">완료</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 작성 취소 모달 -->
    <div class="modal-main-div" id="cancelModal" style="display:none;">
        <div class="modal-div-over">
            <div class="modal-header-div">
                <span class="modal-header-div-span">알림</span>
                <button type="button" class="x-button" id="modalCloseCancel">✖</button>
            </div>
            <div class="modal-content-div">
                <span class="modal-content-div-span">작성 내용을 저장하지 않고 나가시겠습니까?</span>
            </div>
            <div class="modal-div-under">
                <div class="modal-btn-div">
                    <button type="button" class="modal-btn-left modal-btn" id="modalCancelCancel">취소</button>
                    <button type="button" class="modal-btn-right modal-btn" id="modalOkCancel">확인</button>
                </div>
            </div>
        </div>
    </div>

	 

    <!-- 카테고리 선택 박스 -->
    <div class="category-box" id="categoryBox" style="display:none;">
        <p>사연 종류</p>
        <c:forEach var="cat" items="${categoryList}">
            <span data-no="${cat.categoryNo}">${cat.categoryName}</span>
        </c:forEach>
    </div>

</form>


<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>
