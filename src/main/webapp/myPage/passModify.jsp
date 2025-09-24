<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="css/passModify.css"></link>
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
	
		    <!-- 텍스트 박스 영역 -->
		    <div id="text-box">
		        <h3>나의 정보 수정 이용 가능한 서비스</h3>
		        <ul>
			        <li>홈페이지 비밀번호(영문자, 숫자, 특수문자 9자리 이상)변경</li>
			        <li>개인정보와 관련된 숫자, 연속된 숫자, 동일 반복된 숫자 등은 사용하지 마십시오</li>
		    	</ul>
		    </div>
		    <div id="modipy">비밀번호 수정</div>
		    <span id="smaillModipy">(보다 나은 서비스 제공을 위해 고객님의 변경된 정보를 수정해주세요.)</span>
		    
		    <div id="passwordModipy">
			    <div class="form-row">
			        <label for="current-pass">기존 비밀번호 *</label>
			        <input type="password" id="current-pass" placeholder="기존 비밀번호를 입력하세요.">
			    </div>
			    <div class="form-row">
			        <label for="new-pass">신규 비밀번호 *</label>
			        <input type="password" id="new-pass" placeholder="신규 비밀번호를 입력하세요.">
			    </div>
			    <div class="form-row">
			        <label for="confirm-pass">비밀번호 확인 *</label>
			        <input type="password" id="confirm-pass" placeholder="확인 비밀번호를 입력하세요.">
			    </div>
			</div>
			<div id="edit"><button>수정완료</button></div>
		</div>
    </div>

</body>
</html>
