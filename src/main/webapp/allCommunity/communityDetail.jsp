<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/allCommunity/css/communityDetail.css" />
<script src="${pageContext.request.contextPath}/allCommunity/js/communityDetail.js"></script>

<style>
/* 전체 레이아웃 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #ffffff;
}

    .community {
        width: 1000px;
        margin: 10px auto;
    }

    .post-header {
        display: flex;
        margin-bottom: 10px;
    }

    .post-header h2 {
        font-size: 15px;
        margin: 0;
        font-weight: 400;
    }

    .post-meta {
        color: #999;
        font-size: 14px;
    }

    .Title {
        font-size: 20px;
        line-height: 1.6;
        margin-bottom: 5px;
        justify-content: space-between;
        display: flex;
    }
    #title{
        font-size: 16px;
        font-weight: 700;
    }
    #btn1 button {
        transition: all 0.2s ease; /* 움직임과 색 변화 부드럽게 */
    }
    #btn-update{
        background-color: #E5E7ED;
        color: black;
        border: 1px solid #E5E7ED;
        width: 100px;
        height: 30px;
        border-radius: 5px;
    }

    #btn-delete{
        background-color: #488EF6;
        color: white;
        border: 1px solid #488EF6;
        width: 100px;
        height: 30px;
        border-radius: 5px;
    }

    /* 마우스 올렸을 때 살짝 위로 이동 */
    #btn-delete:hover {
        transform: translateY(-3px); /* 위로 3px 이동 */
        background-color: #488EF6;       /* 기존 색 변화 유지 */
    }

    /* 클릭 시 눌린 듯 들어가게 */
    #btn-delete:active {
        transform: translateY(2px);  /* 아래로 2px 이동 */
        background-color: #488EF6;      /* 기존 색 변화 유지 */
    }
    
    /* 마우스 올렸을 때 살짝 위로 이동 */
    #btn-update:hover {
        transform: translateY(-3px); /* 위로 3px 이동 */
        background-color: #E5E7ED;       /* 기존 색 변화 유지 */
    }

    /* 클릭 시 눌린 듯 들어가게 */
    #btn-update:active {
        transform: translateY(2px);  /* 아래로 2px 이동 */
        background-color: #E5E7ED;      /* 기존 색 변화 유지 */
    }

    #san {
        width: 1000px;
        border: 2px solid gray;
    }
    #nickANDdate {
        width: 980px;
        height: 40px; /* 높이를 충분히 줍니다 */
        background-color: #E5E7ED;
        display: flex;
        align-items: center;       /* 세로 가운데 정렬 */
        border: 2px solid #E5E7ED;
        padding: 0 10px;           /* 좌우 여백 */
        gap: 20px;                  /* 닉네임과 날짜 간 간격 */
    }

    #nickName {
        font-size: 16px;            /* 글자 크기 */
        font-weight: 550;
    }

    #data {
        font-size: 14px;    
    }
    
    #content {
	    width: 985px;
	    margin: 0;
	    padding: 10px;
	    min-height: 450px;        /* 최소 높이 유지 */
	    height: auto;             /* 내용에 따라 자동으로 늘어나도록 */
	    white-space: pre-wrap;    /* 줄바꿈과 공백 유지 */
	    overflow: hidden;         /* 내부 내용 넘침 방지 */
	    box-sizing: border-box;   /* padding 포함 너비 계산 */
	}

    .comment-box {
    	position: relative;   /* ✅ 메뉴 위치 기준 */
        border-bottom: 1px solid #000; /* 밑줄 */
        padding: 5px 0; /* 위아래 여백 */
    }

    /* row1: 가로 정렬 */
    #row1 {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	    position: relative; /* userMenu 위치 기준 */
	}
	
	/* 점 3개 버튼 */
	.menu-button {
	    cursor: pointer;
	    font-size: 18px;
	    padding: 0 5px;
	    user-select: none;
	}
	
	/* userMenu 기본 숨김 */
	.userMenu {
	    display: none;
	    position: absolute;    /* ✅ 부모(comment-box) 기준 */
	    top: 0;                /* comment-box의 상단에 맞춤 */
	    left: 100%;            /* comment-box의 바로 오른쪽 */
	    margin-left: 10px;     /* 살짝 띄우고 싶으면 조절 */
	    background-color: #fff;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    width: 120px;
	    flex-direction: column;
	    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
	    z-index: 1000;
	}

    .userMenu .menu-item1{
        padding: 8px 10px;
        cursor: pointer;
        font-size: 14px;
    }
    
    .userMenu .menu-item2{
        padding: 8px 10px;
        cursor: pointer;
        font-size: 14px;
    }
    
    .userMenu .menu-item3{
        padding: 8px 10px;
        cursor: pointer;
        font-size: 14px;
    }
    .userMenu .menu-item1:hover {
        background-color: #f0f0f0;
    }
    .userMenu .menu-item2:hover {
        background-color: #f0f0f0;
    }
    .userMenu .menu-item3:hover {
        background-color: #f0f0f0;
    }

    /* 필요 시 개별 요소 스타일 */
    #number {
        width: 20px;
        text-align: center;
    }

    #comNick {
        flex-grow: 1; /* 닉네임 길이에 따라 늘어나도록 */
    }

    #comDate {
        color: #666;
        font-size: 0.9em;
    }
    #comment {
        padding: 20px;
        
    }

    #comment-write-box {
        width: 998px;
        height: 180px;
        border: 1px solid #E5E7ED;
        background-color: #E5E7ED;
        margin: 10px auto; /* 상하 10px, 좌우 중앙 정렬 */
        display: flex;
        align-items: center; /* 세로 가운데 정렬 */
        padding: 20px;
        gap: 40px; /* 요소 사이 간격 */
        box-sizing: border-box;
    }
    
    /* ★ form 내부 가로 정렬 ★ */
	#comment-write-box form {
	    display: flex;
	    align-items: center;
	    gap: 40px;
	    width: 100%;
	    box-sizing: border-box;
	}

    #comment-name {
        font-weight: 700;
        display: flex;
        align-items: center; /* 텍스트 세로 가운데 */
        height: 100%; /* 부모 높이에 맞춤 */
        margin-left: 20px;
    }
    

    #comment-write {
        width: 700px;
        height: 120px;
        max-height: 300px;   /* 최대 높이 */
        resize: vertical;    /* 세로 방향으로만 크기 조절 가능 */
        padding: 10px;
        box-sizing: border-box;
    }

    #btn2 {
        display: flex;
        align-items: center; /* 버튼 세로 가운데 */
    }

    #btn2 button {
        height: 50px;
        padding: 0 20px;
        cursor: pointer;
    }
    .actions {
	    bottom: 10px;
	    right: 15px;
	    display: flex;
	    gap: 10px;
	    font-size: 14px;
	    margin-bottom: 10px;
	}
	
	.action-item {
	    display: flex;
	    align-items: center;
	    gap: 2px;          /* 아이콘과 숫자 사이 간격 */
	    width: 50px;        /* 3자리 기준 고정 */
	}
	
	.action-item span.action-count {
	    display: inline-block;
	    min-width: 20px;   /* 숫자 자리 고정 */
	    text-align: left;  /* 숫자 왼쪽 정렬 */
	}
	
	.actions button.action-item {
	    background: none;  /* 버튼 기본 배경 제거 */
	    border: none;      /* 테두리 제거 */
	    padding: 0;        /* 패딩 제거 */
	    cursor: pointer;   /* 마우스 커서 포인터 */
	    display: flex;
	    align-items: center;
	    gap: 2px;
	    width: 50px;
	    font-size: 14px;
	}
	
	
	.comment-action-item{
		border:none;
		background-color: white;	
	}
</style>

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
	

    /* 차단 모달 */
   /*  $(document).on('click', '.userMenu .menu-item2:contains("차단하기")', function (e) {
        e.preventDefault();
        $('#blockModal').show();
    });
    $('#modalCloseBlock, #modalCancelBlock, #modalOkBlock').click(function() {
        $('#blockModal').hide();
    }); */
	
    
    /* 댓글 차단 모달 */
    $(document).on('click', '.userMenu .menu-item2:contains("댓글차단")', function (e) {
        e.preventDefault();
        $('#blockModal').show();

        // 클릭한 댓글 정보 가져오기
        var commentBox = $(this).closest('.comment-box');
        var commuNo = "${community.commuNo}";
        var commeNo = commentBox.find('#row1 #number').text(); // 상태값 또는 hidden 사용 가능
        var blockedNo = commentBox.find('#comNick span').data('no');

        // form hidden에 세팅
        $('#blockCommuNo').val(commuNo);
        $('#blockCommeNo').val(commeNo);
        $('#blockBlockedNo').val(blockedNo);
    });

    /* 모달 닫기 */
    $('#modalCloseBlock, #modalCancelBlock').click(function() {
        $('#blockModal').hide();
    });
    
    
    
    /* 유저 차단 모달 */
    $(document).on('click', '.userMenu .menu-item3:contains("유저차단")', function (e) {
        e.preventDefault();
        $('#blockUserModal').show();
    });
    $('#modalCloseUserBlock, #modalCancelUserBlock, #modalOkUserBlock').click(function() {
        $('#blockUserModal').hide();
    });
    
    
    
    
    
    /* 관리 메뉴 숨기기 */
    $('.hide-if-user').hide();

});
</script>
</head>
<body>
	<c:import url="../common/header/header.html" charEncoding="UTF-8"/>

    <div class="community">
        <div class="post-header">
            <h2>
            	<c:out value="${category.categoryName}" default="카테고리"/>
            </h2>
        </div>
        <div class="Title">
            <div id="title">
            	<c:out value="${community.commuTitle}"/>
            </div>
            <div id="btn1">
            <%-- <c:if test="${member.uNo==community.uNo}"> --%>
	            <button onclick="location.href='/ieum/comDetailMo?no=${community.commuNo}'" id="btn-update">수정</button>
	            <button type="button" id="btn-delete" data-communo="${community.commuNo}">삭제</button>
	        <%-- </c:if> --%>
	        </div>
        </div>
        <div id="san"></div>
		<!-- 본인 작성한곳 -->       
        <div id="nickANDdate">
            <div id="nickName">
            	<c:out value="${member.nickName}" default="익명"/>
            </div>
            <div id="data">
            	<fmt:formatDate value="${community.commuCreated}" pattern="yyyy-MM-dd"/>
            </div>
        </div>
        <div id="content">
            <c:out value="${community.commuContent}" escapeXml="false"/>
        </div>
        <div class="actions">
				    <button class="action-item">
				        ❤️ <span class="action-count"><c:out value="${community.empathy}" /></span>
				    </button>
				    <span class="action-item">
				        💬 <span class="action-count"><c:out value="${community.commuComment}" /></span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count"><c:out value="${community.commuViews}" /></span>
				    </span>
				</div>
        <div id="san"></div>

		<!-- 댓글 달리는 장소 -->        
        <c:forEach var="comment" items="${comments}" varStatus="status">
         <c:if test="${blockedList == null or not blockedList.contains(comment.commeNo)}">
	        <div class="comment-box">
			    <div class="comment-row">
			        <div id="row1">
			            <div id="number">${status.count}</div> 
			            <div id="comNick">
			            	<span data-no="${comment.uNo}">	
			            		<c:out value="${comment.nickName}"/>
			            	</span>
			            </div>
			            <div id="date">
			            	<fmt:formatDate value="${comment.comCreated}" pattern="yyyy-MM-dd"/>
			            </div>
			            <!-- 점 3개 버튼 -->
			            <div class="menu-button">⋯</div>
			        </div>
			        <div id="comment">
			            <c:out value="${comment.comContent}" escapeXml="false"/>
			        </div>
			        <button class="comment-action-item">
					        ❤️ <span class="comment-action-count"><c:out value="${comment.comEmpathy}"/></span>
					</button>
			    </div>
			
			    <!-- ✅ 이 위치가 중요!!  comment-box 안쪽에 userMenu 삽입 -->
			    <div class="userMenu">
			        <div class="menu-item1">신고하기</div>
				    <div class="menu-item2">댓글차단</div>
				    <div class="menu-item3">유저차단</div>
			    </div>
			</div>	
		</c:if>
	
		</c:forEach>
        <div id="comment-write-box">
        <form id="comDetail" action="${pageContext.request.contextPath}/comDetail" method="post">
        	<input type="hidden" name="commuNo" value="${community.commuNo}" />
            <div id="comment-name"><c:out value="${member.nickName}" default="익명"/></div>
            <textarea id="comment-write" name="content"></textarea>
            <div id="btn2">
                <button id="btn2-registration">등록</button>
            </div>
        </form>   
        </div>
    </div>
    	<!-- -------------------------------------------------------------------------------------------------------------------------------------- -->
    
    <!-- ✅ 삭제 모달 추가 (처음에는 숨김) -->
	<div class="modal-main-div" id="completeModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseBlock">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">삭제 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button class="modal-btn-left modal-btn" id="modalCancelComplete">취소</button>
	                <button class="modal-btn-right modal-btn" id="modalOkComplete">삭제</button>
	            </div>
	        </div>
	    </div>
	</div>

	<!-- ✅ 차단 모달 추가 -->
	<div class="modal-main-div" id="blockReportModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalClosereportBlock">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">신고 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button type="button" class="modal-btn-left modal-btn" id="modalCancelreportBlock">취소</button>
	                <button type="button" class="modal-btn-right modal-btn" id="modalOkreportBlock">신고</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- ✅ 차단 모달 추가 -->
	<div class="modal-main-div" id="blockModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseBlock">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">댓글을 차단 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button type="button" class="modal-btn-left modal-btn" id="modalCancelBlock">취소</button>
	                <!-- form으로 POST 전송 -->
                <form id="blockCommentForm" action="${pageContext.request.contextPath}/blackCom" method="post" style="display:inline;">
                    <input type="hidden" name="commuNo" id="blockCommuNo" />
                    <input type="hidden" name="commeNo" id="blockCommeNo" />
                    <input type="hidden" name="blockedNo" id="blockBlockedNo" />
                    <button type="submit" class="modal-btn-right modal-btn" id="modalOkBlock">차단</button>
                </form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- ✅ 유저차단 모달 추가 -->
	<div class="modal-main-div" id="blockUserModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseUserBlock">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">해당 유저를 차단 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button type="button" class="modal-btn-left modal-btn" id="modalCancelUserBlock">취소</button>
	                <button type="button" class="modal-btn-right modal-btn" id="modalOkUserBlock">차단</button>
	            </div>
	        </div>
	    </div>
	</div>
	
<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>

