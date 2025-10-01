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
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/blackList.css" />
<script src="${pageContext.request.contextPath}/myPage/css/blackList.js"></script>
</head>
<body>

    <c:import url="../common/header/header.html" charEncoding="UTF-8"/>
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
	                <div class="sidebar-body">
	                     <ul>
					        <a href="/ieum/pInfo"><li><button type="button">나의 기본 정보</button></li></a>
					        <li><button type="button">예약 내역</button></li>
					        <li><button type="button">진단 이력</button></li>
					        <a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
					        <a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
					        <li><button type="button">다이어리</button></li>
					        <li><button type="button">즐겨찾는 병원</button></li>
					    </ul>
	                </div>
	            </div>
	        </div>
        </div>
        

            <!-- 오른쪽 박스 컨테이너 -->
        <c:forEach var="blackMember" items="${blackMember}" varStatus="status">
        <div class="boxes">
        
            <!-- 닉네임 -->
            <div class="text-wrapper-1">
            	<c:out value="${blackMember.username}" default="성명"/>
            </div>

            <!-- 이메일 + 버튼 같은 줄 -->
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div class="text-wrapper-2">
                	<c:out value="${blackMember.email}" default="이메일"/>
                </div>
                <button id="btn">차단 해제</button>
            </div>

            <!-- 업로드 날짜 -->
            <div class="text-wrapper-3">
            	<c:out value="${blackMember.blackCreated}" default="차단닐찌"/>
            </div>
        
        </div>
		</c:forEach>
    </div>
    <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>