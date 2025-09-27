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
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/profileInfo.css" />
<script src="${pageContext.request.contextPath}/myPage/css/profileInfo.js"></script>
</head>
<body>

    <c:import url="../common/header/header.html" charEncoding="UTF-8"/>


	    <!-- Section Title -->
    <div id="section-title">
        <span>나의 기본 정보</span>
        
        <button onclick="location.href='/ieum/pUpdate'" id="btn-update">수정하기</button>
   
    </div>

    <!-- Main -->
    <div class="main-container">
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

        <!-- Main Content -->
        <div class="container-three">
	        <%-- <c:choose>
	        	<c:when test="${sessionScope.user.type == 'user'}"> --%>
		            <div class="content">
		                <span id="box1">회원명</span>
		                <span id="box2">최지성</span>
		                <span id="box3">닉네임</span>
		                <span id="box4">심원의방</span>
		                <span id="box5">아이디</span>
		                <span id="box6">projjang2000</span>
		                <span id="box7">비밀번호</span>
		                <span id="box8">
		                    <!-- 비밀번호 변경 텍스트를 새 박스로 감싸기 -->
		                    <span onclick="location.href='/test/pModify'" id="change-box" class="clickable">비밀번호 변경</span>
		                </span>
		                <span id="box9">주소</span>
		                <span id="box10">경기도 수원시</span>
		                <span id="box11">이메일</span>
		                <span id="box12">jisung0628jisung@gmail.com</span>
		                <span id="box13">생년월일</span>
		                <span id="box14">1999.06.28</span>
		                <span id="box15">성별</span>
		                <span id="box16">남</span>
		                <span id="box17">다이어리 공개 여부</span>
		                <span id="box18">예</span>
		            </div>
	            <%-- </c:when>
	            <c:otherwise>
	            	<div class="content">
	            		
		                <span id="box1">이름</span>
		                <span id="box2">최지성</span>
		                <span id="box3">소속병원</span>
		                <span id="box4">중랑구보건소</span>
		                <span id="box5">아이디</span>
		                <span id="box6">projjang2000</span>
		                <span id="box7">비밀번호</span>
		                <span id="box8">
		                    <!-- 비밀번호 변경 텍스트를 새 박스로 감싸기 -->
		                    <span id="change-box" class="clickable">비밀번호 변경</span>
		                </span>
		                <span id="box9">주소</span>
		                <span id="box10">경기도 수원시</span>
		                <span id="box11">이메일</span>
		                <span id="box12">jisung0628jisung@gmail.com</span>
		                <span id="box13">생년월일</span>
		                <span id="box14">1999.06.28</span>
		                <span id="box15">성별</span>
		                <span id="box16">남</span>
		            </div> --%>
	            <%-- </c:otherwise>
            </c:choose> --%>
            
            <%-- <c:if test="${sessionScope.user.type == 'HOSPITAL-MANAGER' and sessionScope.user.rolename == '병원관리자'}">
            	<div id="section2-title">
			        <span>병원 정보</span>
			        <button id="btn-update">수정하기</button>
			    </div>
			    
			    <div class="content">
	                <span id="box1">병원명</span>
	                <span id="box2">중랑구보건소</span>
	                <span id="box3">병원주소</span>
	                <span id="box4">경기도 수원시 팔달구</span>
	                <span id="box5">근거리교통정보</span>
	                <span id="box6">가산디지털역 7번출구 50m</span>
	                <span id="box7">휴무정보</span>
	                <span id="box8">일요일</span>
	                <span id="box9">전화번호</span>
	                <span id="box10">02-1234-5678</span>
	                <span id="box11">홈페이지 링크</span>
	                <span id="box12">https://github.com/devsolpark/kosta-ieum</span>
	                <span id="box13">소개글</span>
	                <span id="box14">아프지마세요</span>
	                <span id="box15">활동상태</span>
	                <span id="box16">운영중</span>
	            </div>
            </c:if> --%>
        </div>
    </div>
    
    
<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>