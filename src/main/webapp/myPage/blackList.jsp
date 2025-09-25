<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="../css/footer.css"></link>
<link rel="stylesheet" href="css/blackList.css"></link>
<script src="js/blackList.js"></script>
<!-- <script>
window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});
</script>
<script>
    // 탭 클릭 시 active 바꾸기
    // 탭 클릭 시 active 바꾸기
    document.querySelectorAll(".tab").forEach(tab => {
        tab.addEventListener("click", function() {
            document.querySelectorAll(".tab").forEach(t => t.classList.remove("active"));
            this.classList.add("active");
        });
    });
</script> -->
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
        </div>
        

            <!-- 오른쪽 박스 컨테이너 -->
        <div class="boxes">
            <!-- 닉네임 -->
            <div class="text-wrapper-1">닉네임</div>

            <!-- 이메일 + 버튼 같은 줄 -->
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div class="text-wrapper-2">jisung0628jisung@gmail.com</div>
                <button id="btn">차단 해제</button>
            </div>

            <!-- 업로드 날짜 -->
            <div class="text-wrapper-3">업로드 날짜</div>
        </div>

    </div>
    <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>