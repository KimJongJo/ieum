<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/* 전체 레이아웃 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #ffffff;
}
.container {
    width: 1280px;
    margin: 0 auto; /* 화면 가운데 정렬 */
}


/* 헤더 위쪽 검정색 줄 (화면 전체 폭) */
#header-line-top {
    position: absolute; 
    top: 31px;
    left: 0;
    right: 0;
    height: 2px;
    background-color: black;
}

/* 헤더 */
.header {
    height: 120px;
    display: flex;
    align-items: center;
    background-color: #fff;
    padding: 0 20px;
}

.header-inner {
    display: flex;
    align-items: center;
    width: 100%;
    max-width: 1280px;
    margin: 15px auto 0 auto;
    }
/* 숨기고 싶은 메뉴 */
.header .menu span.hidden {
    visibility: hidden; /* 안 보이지만 자리 유지 */
}
.header .logo {
    font-size: 27.5px;
    font-weight: bold;
    color: #0044cc;
}

.header .menu {
    display: flex;   /* 한 줄로 가로 정렬 */
    gap: 100px;       /* 메뉴 간격 */
    align-items: center;
    margin-left:100px;
}
.menu .optional {
    display: none; /* 자리를 없애고, 오른쪽 메뉴가 한 칸씩 당겨짐 */
}

/* 중 헤더 (화면 전체 폭) */
.middle-header {
    width: 100%;
    height: 90px;
    position: relative;
    margin-top: 20px;
}

.middle-header .full-rect {
    width: 100%;
    height: 120px;
    background-color: #EBF3FF;
    position: absolute;
    bottom: 0;
    right: 0;
    z-index: 0;
}

.middle-header .group {
    display: flex;
    align-items: center;
    position: absolute;
    bottom: 0;
    right: 0;
}

/* 원/사각형 디자인 */
.middle-header .outer-circle {
    width: 110px;
    height: 110px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: -36px;
}
.middle-header .inner-circle {
    width: 55px;
    height: 55px;
    border-radius: 50%;
}
.middle-header .rectangle {
    height: 120px;
    position: relative; 
    z-index: 1; 
}
.middle-header .xlarge-rect { width: 600px; background-color: #D4E5FF; }
.middle-header .large-rect  { width: 400px; background-color: #92BEFF; }
.middle-header .small-rect  { width: 200px; background-color: #488EF6; }
.middle-header .small { z-index: 4; }
.middle-header .large { z-index: 3; }
.middle-header .xlarge { z-index: 2; }
.middle-header .xlarge-circle { background-color: #D4E5FF; }
.middle-header .large-circle  { background-color: #92BEFF; }
.middle-header .small-circle  { background-color: #488EF6; }
.middle-header .xlarge-inner { background-color: #EBF3FF; }
.middle-header .large-inner  { background-color: #D4E5FF; }
.middle-header .small-inner  { background-color: #92BEFF; }


/* 섹션 타이틀 */
#section-title {
    width: 800px;
    font-size: 20px;
    color: #333;
    margin: 20px auto 0 auto;
    font-weight: 700;
    background-color: #fff;
    display: flex;
    justify-content: space-between;
}


/* ✅ 메인 영역 - 1280px 중앙 고정 */
.main-container {
    width: 1280px;
    margin: 20px auto 0 auto; /* 위 60px 띄우고 가운데 정렬 */
    display: flex;
    gap: 40px; /* 사이 간격 */
}

/* 사이드바 */
.sidebar {
    width: 195px;
    height: 550px;
    border: 1px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
}
.sidebar-header {
    background-color: #4a64d6;
    color: white;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    height: 114px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    line-height: 1.6;
}
.welcome {
    background-color: #e9ebf5;
    text-align: left;
    padding: 15px 15px;
    border-bottom: 1px solid #ccc;
}
.welcome strong {
    display: block;
    font-size: 14px;
    margin-bottom: 6px;
}
.welcome span {
    font-size: 12px;
    color: #555;
}
.sidebar-body ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
.sidebar-body ul li {
    padding: 0; /* li 자체 여백 제거 */
    border-top: 1px solid #ccc;
}

.sidebar-body ul li button {
    width: 100%; /* li 전체 넓이 차지 */
    height: 48px; /* 기존 li 높이와 동일 */
    line-height: 48px;
    text-align: left;
    font-size: 14px;
    border: none;
    background-color: #fff;
    cursor: pointer;
    padding: 0 16px; /* 기존 li 좌우 여백 유지 */
}

.sidebar-body ul li button:hover {
    background-color: #f7f7f7;
}

/* 클릭 시 살짝 눌리는 효과 */
.sidebar-body ul li button:active {
    transform: translateY(2px);
    filter: brightness(90%);
}

/* 메인 컨텐츠 */
.container-three {
    flex: 1; /* 남은 공간 차지 */
}


/* 텍스트 박스 */
#text-box {
    width: 100%;
    padding: 20px;
    background-color: #F7FAFF;
    border: 1px solid #ccc;
    border-radius: 8px;
    margin-bottom: 10px;
}
#text-box h3 {
    margin: 0 0 10px 0;
    font-size: 18px;
    color: #333;
}
#text-box li {
    list-style-type: disc;
    color: #555;
}

/* 정보 수정 */
#modipy {
    margin: 20px 0 0 5px;
    font-size: 18px;
    font-weight: 700;
}
#smaillModipy {
    font-size: 12.5px;
    margin: 0 0 0 5px;
    color: #555;
}
#passwordModipy {
    border: 1px solid #d9d9d9;
    width: 100%;
    height: 195px;
    border-radius: 8px;
    padding: 20px;
    margin-top: 10px;
}
.form-row {
    display: flex;
    align-items: center;
    margin-bottom: 34.5px;
    margin-top: 5px;
}
.form-row label {
    width: 150px;
    font-weight: 700;
    font-size: 14px;
}
.form-row input {
    width: 250px;
    height: 25px;
    padding: 5px 10px;
    font-size: 13px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #e1e8ff;
    margin-left: 60px;
}
.form-row input::placeholder {
    color: #999;
    font-size: 12px;
}
.form-row button {
    height: 34px;
    margin-left: 40px;
    font-size: 13px;
    border: 1px solid #d9d9d9;
    border-radius: 4px;
    background-color: #d9d9d9;
    color: #fff;
    cursor: pointer;
}
.form-row1 {
    display: flex;
    align-items: center;
    margin-bottom: 34.5px;
}
.form-row1 label {
    width: 150px;
    font-weight: 700;
    font-size: 14px;
}
.form-row1 input {
    width: 20px;
    height: 15px;
    font-size: 13px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #e1e8ff;
    margin-left: 30px;
}
.checkbox-group {
    display: flex;
    gap: 20px;
    margin-left: 10px;
}
#name{
    margin-left: 40px;

}

#edit {
    margin-top: 30px;
    text-align: center; /* 추가 */
}

#edit button {
    width: 100px;
    height: 36px;
    border-radius: 12px;
    background-color: #92BEFF;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease; /* 부드럽게 변화 */
    color: #fff;
    font-weight: bold;
}
/* 마우스 오버 시 스타일 */
#edit button:hover {
    background-color: #6fa0ff; /* 더 진한 색 */
    transform: scale(1.05);     /* 약간 커지게 */
    box-shadow: 0 4px 10px rgba(0,0,0,0.2); /* 그림자 효과 */
}
</style>

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

    <!-- 헤더 위 검정 줄 -->
    <div id="header-line-top"></div>
    
    <!-- Header -->
    <div class="container">
        <div class="header">
            <div class="header-inner">
                <div class="logo">건강이음</div>
                <div class="menu">
                    <span>병원조회/예약</span>
                    <span>자가진단</span>
                    <span>커뮤니티</span>
                    <span>공지사항</span>
                    <span>관리 메뉴</span>
                    <span>마이페이지</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Middle Header -->
    <div class="middle-header">
        <div class="full-rect"></div>
        <div class="group xlarge">
            <div class="outer-circle xlarge-circle">
                <div class="inner-circle xlarge-inner"></div>
            </div>
            <div class="rectangle xlarge-rect"></div>
        </div>
        <div class="group large">
            <div class="outer-circle large-circle">
                <div class="inner-circle large-inner"></div>
            </div>
            <div class="rectangle large-rect"></div>
        </div>
        <div class="group small">
            <div class="outer-circle small-circle">
                <div class="inner-circle small-inner"></div>
            </div>
            <div class="rectangle small-rect"></div>
        </div>
    </div>

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
