<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    	width:985px;
        margin: 0;
        padding: 10px;
        height: 450px;
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

    .userMenu .menu-item {
        padding: 8px 10px;
        cursor: pointer;
        font-size: 14px;
    }
    .userMenu .menu-item:hover {
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
        resize: none;
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
                <button onclick="location.href='/ieum/write'" id="btn-update">수정</button>
                <button id="btn-delete">삭제</button>
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
        <!-- 다른 사람이 작성한곳 -->
        
        <c:forEach var="comment" items="${comments}" varStatus="status">
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
			        <div class="menu-item">신고하기</div>
			        <div class="menu-item">차단하기</div>
			    </div>
			</div>		
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
    
    
    <!-- ✅ 모달 추가 (처음에는 숨김) -->
	<div class="modal-main-div" id="completeModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseComplete">✖</button>
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
<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>

