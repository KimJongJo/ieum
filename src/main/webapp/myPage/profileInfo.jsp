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

    <c:import url="/common/header/header.html" charEncoding="UTF-8"/>


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
                
                <c:if test="${userType == 'USER'}">
                	<div class="sidebar-body">
	                     <ul>
					        <a href="/ieum/pInfo"><li><button type="button">나의 기본 정보</button></li></a>
						    <li><button type="button">예약 내역</button></li>
						    <a href="/ieum/myPage/diagnosisHistory"><li><button type="button">진단 이력</button></li></a>
						    <a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
						    <a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
						    <li><button type="button">다이어리</button></li>
						    <li><button type="button">즐겨찾는 병원</button></li>
					    </ul>
	                </div>
                </c:if>
                
            </div>
        </div>

        <!-- Main Content -->
        <div class="container-three">
	        <c:choose>
	        	<c:when test="${userType == 'USER'}">
		            <div class="content">
		                <span id="box1">회원명</span>
		                <span id="box2"><c:out value="${member.username}"/></span>
		                <span id="box3">닉네임</span>
		                <span id="box4"><c:out value="${member.nickName}"/></span>
		                <span id="box5">아이디</span>
		                <span id="box6"><c:out value="${member.id}"/></span>
		                <span id="box7">비밀번호</span>
		                <span id="box8">
		                    <!-- 비밀번호 변경 텍스트를 새 박스로 감싸기 -->
		                    <span onclick="location.href='/ieum/pModify'" id="change-box" class="clickable">비밀번호 변경</span>
		                </span>
		                <span id="box9">주소</span>
		                <span id="box10"><c:out value="${member.uAddress}"/></span>
		                <span id="box11">이메일</span>
		                <span id="box12"><c:out value="${member.email}"/></span>
		                <span id="box13">전화번호</span>
		                <span id="box14"><c:out value="${member.uTel}"/></span>
		                <span id="box15">생년월일</span>
		                <span id="box16"><c:out value="${member.birthDate}"/></span>
		                <span id="box17">성별</span>
		                <span id="box18">
		                	<c:choose>
					        	<c:when test="${member.gender eq 'MALE'}">남자</c:when>
					        	<c:otherwise>여자</c:otherwise>
					    	</c:choose>
		                </span>
		                <span id="box19">다이어리 공개 여부</span>
		                <span id="box20">
							<c:choose>
						        <c:when test="${member.diaryPrivate}">예</c:when>
						        <c:otherwise>아니오</c:otherwise>
						    </c:choose>
						</span>
		            </div>
	            </c:when>
	            <c:otherwise>
	            	<div class="content">
		                <span id="box61">이름</span>
		                <span id="box62"><c:out value="${member.username}"/></span>
		                <span id="box63">소속병원</span>
		                <span id="box64"><c:out value="${hNm}"/></span>
		                <span id="box65">아이디</span>
		                <span id="box66"><c:out value="${member.id}"/></span>
		                <span id="box67">비밀번호</span>
		                <span id="box68">
		                    <!-- 비밀번호 변경 텍스트를 새 박스로 감싸기 -->
		                    <span id="change-box" class="clickable">비밀번호 변경</span>
		                </span>
		                <span id="box611">이메일</span>
		                <span id="box612"><c:out value="${member.email}"/></span>
		                <span id="box613">생년월일</span>
		                <span id="box614"><c:out value="${member.birthDate}"/></span>
		                <span id="box615">성별</span>
		                <span id="box616">
		                	<c:choose>
					        	<c:when test="${member.gender eq 'MALE'}">남자</c:when>
					        	<c:otherwise>여자</c:otherwise>
					    	</c:choose>
					    </span>
		                <span id="box715">소개글</span>
		                <span id="box716"><c:out value="${member.introduction}"/></span>
		                <span id="box619">상태</span>
		                <span id="box620">
							<c:choose>
						        <c:when test="${member.stateCode == 1}">정상</c:when>
						        <c:when test="${member.stateCode == 4}">휴직</c:when>
						        <c:otherwise>퇴직</c:otherwise>
						    </c:choose>
						</span>
		            </div>
	            </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    
<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>