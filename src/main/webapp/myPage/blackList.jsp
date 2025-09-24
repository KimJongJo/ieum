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
        margin: 20px auto 0 auto; 
        display: flex;
        gap: 40px;
        align-items: flex-start; /* 높이 정렬 */
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

    

    .boxes {
        display: flex;
        gap: 20px; /* 두 박스 사이 간격 */
    }

    .boxes {
        position: relative;
        width: 100%;
        max-width: 500px;
        background-color: #F6F8FE;
        border-radius: 15px;
        border: 2px solid #d9d9d9;
        padding: 15px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    /* 닉네임 */
    .text-wrapper-1 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 12px;
        color: #000;
    }

    /* 카테고리 */
    .text-wrapper-2 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 14px;
        color: #000;
        font-weight: bold;
    }

    /* 업로드 날짜 */
        .text-wrapper-3 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 12px;
        color: #000;
        }

    /* 버튼 스타일 */
    #btn {
        padding: 6px 12px;
        border: 1px solid red;
        border-radius: 6px;
        background-color: #F6F8FE;
        color: red;
        font-size: 13px;
        cursor: pointer;
    }

    #btn:hover {
        background-color: #84A2FE;
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
<script>
    // 탭 클릭 시 active 바꾸기
    // 탭 클릭 시 active 바꾸기
    document.querySelectorAll(".tab").forEach(tab => {
        tab.addEventListener("click", function() {
            document.querySelectorAll(".tab").forEach(t => t.classList.remove("active"));
            this.classList.add("active");
        });
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
</body>
</html>

건들지마