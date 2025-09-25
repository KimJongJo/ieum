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
	<!-- ✅ 중헤더 바로 밑에 텍스트 -->
	<div id="section-title">
		<div>
			<span>커뮤니티 작성</span>
		</div>
	</div>
	
	<div class="community-title">
	    <div id="title-header">
	        제목
	    </div>
	    <div class="category-btn" onclick="toggleCategory()">
		    <span class="category-text">카테고리</span> <span class="arrow"><<</span>
		</div>
	</div>
    
	<div class="community-content">
        <div id="title-wrtie">
            <input type="text" id="title" placeholder="제목" maxlength="1000">
        </div>
        <div id="content-header">
            내용
        </div>
		<div>
			<textarea id="content-write" placeholder="내용" maxlength="3000"></textarea>
		</div>
	</div>

    <div id="btn-event">
        <button id="btn-cancellation">작성 취소</button>
        <button id="btn-complete">작성 완료</button>
    </div>
	
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
	                <button class="modal-btn-left modal-btn" id="modalCancelComplete">취소</button>
	                <button class="modal-btn-right modal-btn" id="modalOkComplete">완료</button>
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
	                <button class="modal-btn-left modal-btn" id="modalCancelCancel">취소</button>
	                <button class="modal-btn-right modal-btn" id="modalOkCancel">확인</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="category-box" id="categoryBox">
	    <p>사연 종류</p>
	    <span>육아/출산</span>
	    <span>금전/사업</span>
	    <span>LGBT</span>
	    <span>자아/성격</span>
	    <span>이별/이혼</span>
	    <span>성범죄</span>
	    <span>펫로스</span>
	    <span>학업/고시</span>
	    <span>성생활</span>
	    <span>대인관계/따돌림</span>
	    <span>외모</span>
	    <span>신체건강</span>
	    <span>정신건강</span>
	    <span>취업/진로</span>
	    <span>부부관계</span>
	    <span>직장</span>
	    <span>기타</span>
	</div>
	<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>