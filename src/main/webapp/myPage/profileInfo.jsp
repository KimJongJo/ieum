<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="css/profileInfo.css"></link>

<script>
window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});
</script>
</head>
<body>

    <c:import url="../common/header/header.html" charEncoding="UTF-8"/>


	    <!-- Section Title -->
    <div id="section-title">
        <span>나의 기본 정보</span>
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
				        <li><button type="button">나의 기본 정보</button></li>
				        <li><button type="button">예약 내역</button></li>
				        <li><button type="button">진단 이력</button></li>
				        <li><button type="button">나의 커뮤니티</button></li>
				        <li><button type="button">차단 목록</button></li>
				        <li><button type="button">다이어리</button></li>
				        <li><button type="button">즐겨찾는 병원</button></li>
				    </ul>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container-three">
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
                <span id="box17">다이어리 공개 여부</span>
                <span id="box18">예</span>
            </div>
        </div>
    </div>
    
    <button id="btn-update">
	        수정하기
	</button>

</body>
</html>