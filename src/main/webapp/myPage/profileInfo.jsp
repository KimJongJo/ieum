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

/* 버튼: 내가 직접 위치 지정 가능 */
#btn-update {
    padding: 6px 14px;
    background-color: #366FC6;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

#btn-update:hover {
    background-color: #2750a5;
}

/* ✅ 메인 영역 - 1280px 중앙 고정 */
.main-container {
    width: 1280px;
    margin: 20px auto 0 auto; /* 위 20px 띄우고 가운데 정렬 */
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

/* 메인 컨텐츠 */
.container-three {
    flex: 1; /* 남은 공간 차지 */
}

/* content 그리드 스타일 */
.content {
    display: grid;
    grid-template-columns: 200px 825px;  /* 2열 */
    grid-auto-rows: 48px;                /* 각 행 높이 */
    gap: 0;
    width: 1025px;
    border: 1px solid #d9d9d9;
    border-radius: 8px;
    overflow: hidden;
}

.content span {
    display: flex;
    align-items: center;
    padding-left: 20px;
    border-bottom: 1px solid #d9d9d9;
}

/* 홀수 열(회색 블록)에도 구분선 추가 */
.content span:nth-child(odd) {
    background-color: #F7FAFF;
    font-weight: 700;
    border-bottom: 1px solid #ccc; /* 선 추가 */
    box-sizing: border-box;
    border-right: 1px solid #ccc;
}
/* 마지막 행 하단선 제거 */
.content span:nth-last-child(-n+2) {
    border-bottom: none;
}

/* 각 모서리 둥글게 */
#box1 { border-top-left-radius: 8px; }
#box2 { border-top-right-radius: 8px; }
#box17 { border-bottom-left-radius: 8px; }
#box18 { border-bottom-right-radius: 8px; }

/* 클릭 가능 박스 스타일 */
.clickable {
    display: inline-block;   /* 텍스트 크기에 맞춤 */
    padding: 2px;
    background-color: white;
    color: black;
    border-radius: 4px;
    font-size: 12px;
    cursor: pointer;
    transition: all 0.2s ease;
}
#change-box {
    display: flex;              /* flex 컨테이너로 변경 */
    height: 30px;               /* 부모 박스 높이 맞춤 */
    width: 93px;                /* 부모 박스 너비 맞춤 */
    padding: 10px;                 /* 기존 padding 제거 */
    background-color: white;
    color: black;
    border-radius: 15px;
    font-size: 12px;
    cursor: pointer;
    transition: all 0.2s ease;
    border: 1px solid black;

}

.clickable:hover {
    background-color: #366FC6; /* 마우스 오버 시 살짝 어두워짐 */
}

.clickable:active {
    transform: translateY(2px); /* 클릭 시 눌리는 모션 */
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