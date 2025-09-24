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
    margin: 15px auto 0 auto;
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



/* 옵션 컨테이너 */
.option-containerList {
    flex: 1;       /* 남은 공간 차지 */
    display: flex;
    align-items: flex-start; /* 사이드바와 상단 맞춤 */
}

#option-container {
    width: 998px;
    display: flex;
    border-radius: 5px;
    overflow: hidden;
}

/* 공통 탭 스타일 */
.tab-commu, .tab-comment, .tab-heart {
    flex: 1;
    text-align: center;
    padding: 10px 0;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s, color 0.3s;
}



/* 클릭 시 활성화 */
.tab-commu.active, .tab-comment.active, .tab-heart.active {
    background-color: #4356B3;
    color: #fff;
    font-weight: bold;
}

.frame {
  position: relative;
  width: 100%;
  max-width: 1003px;
  background-color: #ffffff;
  border-radius: 15px;
  border: 2px solid #d9d9d9;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

/* 상단: 닉네임 + 카테고리 */
.frame-top {
  display: flex;
  justify-content: space-between; /* 좌우 분리 */
  align-items: center;
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

/* 제목 및 본문 */
.overlap-group {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.title {
  font-family: "Noto Sans-Medium", Helvetica;
  font-weight: 500;
  font-size: 18px;
  color: #000;
}

.p {
  font-family: "Inter-Regular", Helvetica;
  font-size: 14px;
  color: #000;
  margin: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  max-width: 50ch; /* 약 20글자 */
}

/* 업로드 날짜 */
.text-wrapper-3 {
  font-family: "Inter-Regular", Helvetica;
  font-size: 12px;
  color: #000;
}

.actions {
	    position: absolute;
	    bottom: 10px;
	    right: 15px;
	    display: flex;
	    gap: 10px;
	    font-size: 14px;
	}
	
	.action-item {
	    display: flex;
	    align-items: center;
	    gap: 2px;          /* 아이콘과 숫자 사이 간격 */
	    width: 50px;        /* 3자리 기준 고정 */
	}
	
	.action-item span.action-count {
	    display: inline-block;
	    min-width: 20px;   /* 숫자 자리 고정 */
	    text-align: left;  /* 숫자 왼쪽 정렬 */
	}


/* 댓글 스타일 */
.comment {
  position: relative;
  width: 100%;
  max-width: 1003px;
  background-color: #ffffff;
  border-radius: 15px;
  border: 2px solid #d9d9d9;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

/* 상단: 닉네임 + 카테고리 */
.comment-top {
  display: flex;
  justify-content: space-between; /* 좌우 분리 */
  align-items: center;
}

/* 닉네임 */
.nickName {
  font-family: "Inter-Regular", Helvetica;
  font-size: 12px;
  color: #000;
}


/* 제목 및 본문 */
.overlap-group {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.div {
  font-family: "Noto Sans-Medium", Helvetica;
  font-weight: 500;
  font-size: 18px;
  color: #000;
}

.p {
  font-family: "Inter-Regular", Helvetica;
  font-size: 14px;
  color: #000;
  margin: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  max-width: 50ch; /* 약 20글자 */
}

/* 업로드 날짜 */
.text-wrapper-3 {
  font-family: "Inter-Regular", Helvetica;
  font-size: 12px;
  color: #000;
}

/* 액션 아이콘 오른쪽 아래 고정 */
#actions {
  position: absolute;
  bottom: 10px;
  right: 15px;
  display: flex;
  gap: 10px;
  font-size: 14px;
}
</style>

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
<script>
/* 댓글 길면 짤리게 */
  const p = document.getElementById('text');
  const maxChars = 50;

  if(p.innerText.length > maxChars){
      p.innerText = p.innerText.slice(0, maxChars) + '...';
  }
</script>
<script>

/* 헤더 숨기는 기능 */
window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});
</script>


<script>

/* 클릭 이벤트 */
document.addEventListener('DOMContentLoaded', () => {
    const tabCommu = document.querySelector('.tab-commu');
    const tabComment = document.querySelector('.tab-comment');
    const tabHeart = document.querySelector('.tab-heart');

    const frame = document.querySelector('.frame');   // 게시판 영역
    const comment = document.querySelector('.comment'); // 댓글 영역

    // 처음에는 게시판만 보이도록
    frame.style.display = 'flex';
    comment.style.display = 'none';

    // 공통 탭 클릭 이벤트 함수
    function activateTab(selectedTab) {
        // 모든 탭 active 제거
        [tabCommu, tabComment, tabHeart].forEach(t => t.classList.remove('active'));
        // 선택된 탭만 active
        selectedTab.classList.add('active');
    }

    tabCommu.addEventListener('click', () => {
        activateTab(tabCommu);
        frame.style.display = 'flex';
        comment.style.display = 'none';
    });

    tabComment.addEventListener('click', () => {
        activateTab(tabComment);
        frame.style.display = 'none';
        comment.style.display = 'flex';
    });

    tabHeart.addEventListener('click', () => {
        activateTab(tabHeart);
        frame.style.display = 'flex';   // 좋아요 누른 게시판 영역도 게시판처럼
        comment.style.display = 'none';
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

        <!-- 오른쪽 컨테이너: 옵션 + 새로운 영역 세로 배치 -->
        <div class="right-container" style="display:flex; flex-direction:column; gap:20px;">
            <!-- Options 컨테이너 -->
            <div id="option-container">
                <button class="tab-commu">작성한 게시판</button>
                <button class="tab-comment">작성한 댓글</button>
                <button class="tab-heart">좋아요 누른 게시판</button>
            </div>

            <!-- 옵션 밑 새로운 영역 -->
            <div class="frame">
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="frame-top">
                    <div class="text-wrapper-1">닉네임</div>
                    <div class="text-wrapper-2">진로/취업</div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <div class="title">요즘 너무 힘듭니다</div>
                    <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구 그러니까 전 아니라니까요 그게 뭐냐니까요?</p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">업로드 날짜</div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
                <div class="actions">
				    <span class="action-item">
				        ❤️ <span class="action-count">15</span>
				    </span>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">100</span>
				    </span>
				</div>
            </div>
            
            
            <!-- 옵션 밑 새로운 영역 -->
            <div class="comment">
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="comment-top">
                    <div class="nickName">닉네임</div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구 그러니까 전 아니라니까요 그게 뭐냐니까요?</p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">업로드 날짜</div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
                <div id="actions">
                    <span class="action-item">
				        ❤️ <span class="action-count">15</span>
				    </span>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>


