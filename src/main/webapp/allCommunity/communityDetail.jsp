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

</head>
<body>
	<c:import url="../common/header/header.html" charEncoding="UTF-8"/>

    <div class="community">
        <div class="post-header">
            <h2>
            	<c:out value="${categortyName}" default="카테고리"/>
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
        <div id="nickANDdate">
            <div id="nickName">
            	<c:out value="${member.nickName}" default="익명"/>
            </div>
            <div id="data">
            	<fmt:formatDate value="${community.commuCreated}" pattern="yyy-MM-dd"/>
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
        <c:forEach var="comment" items="${commentList}">
	        <div class="comment-box">
			    <div class="comment-row">
			        <div id="row1">
			            <div id="number"><c:out value="${comment.commeNo}"/></div>
			            <div id="comNick"><c:out value="${member.nickName}"/></div>
			            <div id="date">
			            	<fmt:formatDate value="${comment.comCreated}" pattern="yyy-MM-dd"/>
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
            <div id="comment-name"><c:out value="${member.nickName}" default="익명"/></div>
            <textarea id="comment-write"></textarea>
            <div id="btn2">
                <button id="btn2-registration">등록</button>
            </div>
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

