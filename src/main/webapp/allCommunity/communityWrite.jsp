<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
<c:import url="../common/header/header.html" charEncoding="UTF-8"/>

<c:choose>
    <c:when test="${not empty community}">
        <!-- 수정 모드 -->
        <form id="writeForm" action="${pageContext.request.contextPath}/comDetailMo" method="post">
    </c:when>
    <c:otherwise>
        <!-- 새 글 작성 모드 -->
        <form id="writeForm" action="${pageContext.request.contextPath}/write" method="post">
    </c:otherwise>
</c:choose>
    <div id="section-title">
        <div><span>커뮤니티 작성</span></div>
    </div>

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
            <input type="text" id="title" name="title" placeholder="제목" maxlength="1000"
            	value="<c:out value='${community.commuTitle}'/>">
        </div>
        <div id="content-header">내용</div>
        <div>
            <textarea id="content-write" name="content" placeholder="내용" maxlength="3000"><c:out value="${community.commuContent}" />
            </textarea>
        </div>
    </div>

    <div id="btn-event">
        <button type="button" id="btn-cancellation">작성 취소</button>
        <button type="button" id="btn-complete">작성 완료</button>
    </div>
    
   <%--  <!-- 기존 글 번호 hidden -->
    <input type="hidden" name="no" value="<c:out value='${community.commuNo}'/>"/>
    <!-- 선택 카테고리 hidden -->
    <input type="hidden" id="categoryNo" name="categoryNo" value="<c:out value='${community.categoryNo}'/>"/>

    <!-- 선택 카테고리 값 전달용 hidden -->
    <input type="hidden" id="categoryNo" name="categoryNo"/> --%>
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
                    <button type="submit" class="modal-btn-right modal-btn" id="modalOkComplete">완료</button>
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
