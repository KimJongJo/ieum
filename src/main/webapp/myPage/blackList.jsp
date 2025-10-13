<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/blackList.css" />
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<script src="${pageContext.request.contextPath}/myPage/css/blackList.js"></script>

<script type="text/javascript">

</script>
</head>
<body>

    <c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
    <!-- Section Title -->
    <div id="section-title">
        <span>차단 목록</span>
    </div>

    <!-- 메인 컨테이너: 1280px 중앙 고정 -->
    <div class="main-container">
        
        <!-- Sidebar -->
        <div class="container-two">
            <!-- Sidebar -->
	        <div class="container-two">
	            <div class="sidebar">
	                <div class="sidebar-header">
	                    건강이음<br>마이페이지
	                </div>
	                <div class="welcome">
	                    <strong>*환영합니다*<br>최지성 회원님</strong>
	                    <span>심원의방</span>
	                </div>
                    <c:if test="${userType == 'USER'}">
	                	<jsp:include page="/myPage/myPageNav.jsp"></jsp:include>
	                </c:if>
	            </div>
	        </div>
        </div>
        

            <!-- 오른쪽 박스 컨테이너 -->
        <c:forEach var="blackMember" items="${blackMember}" varStatus="status">
        <div class="boxes">
        
            <!-- 닉네임 -->
            <div class="text-wrapper-1">
            	<c:out value="${blackMember.nickname}" default="성명"/>
            </div>

            <!-- 이메일 + 버튼 같은 줄 -->
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div class="text-wrapper-2">
                	<c:out value="${blackMember.email}" default="이메일"/>
                </div>
               <!-- form POST 방식 -->
	            <form action="${pageContext.request.contextPath}/black" method="post">
				    <input type="hidden" name="blockedNo" value="${blackMember.blockedNo}"/>
				    <button type="submit" class="unblock-btn">차단 해제</button>
				</form>
            </div>

            <!-- 업로드 날짜 -->
            <div class="text-wrapper-3">
            	<c:out value="${blackMember.blackCreated}" default="차단닐짜"/>
            </div>
        
        </div>
		</c:forEach>
    </div>
    
    <!-- 차단헤제 모달 -->
    <div class="modal-main-div" id="completeModalBlack" style="display:none;">
        <div class="modal-div-over">
            <div class="modal-header-div">
                <span class="modal-header-div-span">알림</span>
                <button type="button" class="x-button" id="modalCloseCompleteBlack">✖</button>
            </div>
            <div class="modal-content-div">
                <span class="modal-content-div-span">차단해제 하시겠습니까?</span>
            </div>
            <div class="modal-div-under">
                <div class="modal-btn-div">
                    <button type="button" class="modal-btn-left modal-btn" id="modalCancelCompleteBlack">취소</button>
                    <button type="button" class="modal-btn-right modal-btn" id="modalOkCompleteBlack">해제</button>
                </div>
            </div>
        </div>
    </div>
    
    <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>