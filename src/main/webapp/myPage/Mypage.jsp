<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<style>
/* 전체 레이아웃 */
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

#diagnosis-box{
    border: 2px solid #d9d9d9;
    background-color: white;
    width: 996px;
    height: 230px;
    margin:0;
    display: flex;            /* flex 사용 */
    flex-direction: column;   /* 세로로 쌓기 */
    align-items: center;      /* 가로 중앙 정렬 */
}


#diagnosis1 {
    width: 976px;
    height: 50px;
    display: flex;
    justify-content: space-between; /* 왼쪽-오른쪽 배치 */
    align-items: center;            /* 세로 가운데 정렬 */
    margin: 0px;
    border: 2px solid #E5E7ED;
    padding: 0 10px;                /* 좌우 여백 */
    background-color: #E5E7ED;
    border-radius: 15px 15px 0 0;
}
#diagnosis2 {
    width: 976px;
    height: 50px;
    display: flex;
    justify-content: space-between; /* 왼쪽-오른쪽 배치 */
    align-items: center;            /* 세로 가운데 정렬 */
    margin-top: 40px;
    border: 2px solid #E5E7ED;
    padding: 0 10px;                /* 좌우 여백 */
    background-color: #E5E7ED;
    border-radius: 15px 15px 0 0;
}

#recent {
    font-size: 16px;
    font-weight: bold;
}

#btn1 {
    background: none;   /* 버튼 배경 제거 */
    border: none;       /* 버튼 테두리 제거 */
    cursor: pointer;    /* 손가락 모양 커서 */
    padding: 5px;
    
}

#btn1 img {
    width: 17px;   /* 원하는 크기 */
    height: 17px;
    transform: rotate(180deg);
    transition: transform 0.3s ease; /* 회전 애니메이션 미리 설정 */
}


#box1{
    width: 950px;
    height: 45px;
    border: 1px solid #d9d9d9;
    margin: 20px auto 0 auto;
    display: flex; 
    justify-content: space-between;
}
#box2{
    width: 950px;
    height: 45px;
    border: 1px solid #d9d9d9;
    display: flex; 
    justify-content: space-between;
    margin: 0 auto 0 auto;
}

/* 각 영역 */
.box-item {
    flex: 1;                    /* 영역을 균등 분할 */
    border-right: 1px solid #d9d9d9; /* 구분선 */
    display: flex;              /* 안쪽 텍스트 정렬용 */
    align-items: center;        /* 세로 가운데 */
    justify-content: center;    /* 가로 가운데 */
    font-size: 14px;
}

/* 마지막 영역은 오른쪽 선 제거 */
.box-item:last-child {
    border-right: none;
}
#btn2 {
    width: 100px;
    height: 30px;
    border: 1px solid #888;
    background-color: #E5E7ED;
    color: black;
    border-radius: 15px;
    cursor: pointer; /* 손가락 커서 */
    transition: all 0.2s ease; /* 부드러운 애니메이션 */
}

/* 마우스를 올렸을 때 */
#btn2:hover {
    background-color: #E5E7ED;
    transform: translateY(-2px); /* 살짝 위로 */
    box-shadow: 0 4px 6px rgba(0,0,0,0.2); /* 눌린 듯한 그림자 */
}

/* 클릭 중(active)일 때 */
#btn2:active {
    transform: translateY(1px); /* 눌린 듯 아래로 */
    box-shadow: 0 2px 3px rgba(0,0,0,0.2);
}

#doc-comment{
    font-size: 14px;
    width: 900px;
    margin: 20px auto 0 auto;
}

#upload {
    display: flex;          /* 가로 정렬 */
    justify-content: flex-start; /* 왼쪽 정렬 */
    gap: 20px;              /* 요소 사이 간격 */
    margin: 20px auto 0 auto;
    font-size: 12px;
    width: 940px;
}

#btn3 {
    background: none;   /* 버튼 배경 제거 */
    border: none;       /* 버튼 테두리 제거 */
    cursor: pointer;    /* 손가락 모양 커서 */
    padding: 5px;
    
}

#btn3 img {
    width: 17px;   /* 원하는 크기 */
    height: 17px;
    transform: rotate(180deg);
    transition: transform 0.3s ease; /* 회전 애니메이션 미리 설정 */
}

.frame {
  position: relative;
  width: 100%;
  max-width: 1000px;
  background-color: #ffffff;
  border-radius: 0;
  border: 2px solid #d9d9d9;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin: 0px;
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
document.addEventListener("DOMContentLoaded", function () {
    // diagnosis-box 토글
    const btn1 = document.getElementById("btn1");
    const diagnosisBox = document.getElementById("diagnosis-box");
    const btnImg = btn1.querySelector("img");

    diagnosisBox.style.display = "none";

    btn1.addEventListener("click", function () {
        if (diagnosisBox.style.display === "none") {
            diagnosisBox.style.display = "block";
            btnImg.style.transform = "rotate(0deg)";
        } else {
            diagnosisBox.style.display = "none";
            btnImg.style.transform = "rotate(180deg)";
        }
    });

    // ✅ community-box 토글
    const btn3 = document.getElementById("btn3");
    const frame = document.querySelector("#community-box .frame"); // frame 선택
    const btn3Img = btn3.querySelector("img");

    frame.style.display = "none"; // 처음엔 숨김

    btn3.addEventListener("click", function () {
        if (frame.style.display === "none") {
            frame.style.display = "flex"; // flex 유지
            btn3Img.style.transform = "rotate(0deg)";
        } else {
            frame.style.display = "none";
            btn3Img.style.transform = "rotate(180deg)";
        }
    });
});
</script>

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

    <!-- ✅ 중헤더 바로 밑에 텍스트 -->
	<div id="section-title">
		<div>
			<span>나만의 캘린더</span>
		</div>
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
        

    <!-- 최근 진단 이력 -->
    <div class="container-three">
        <div id="diagnosis1">
            <div id="recent">최근 진단 이력</div>
            <button id="btn1">
                <img src="img/btn1.png" alt="down" class="icon">
            </button>
        </div>
        <div id="diagnosis-box">
            <div id="box1">
                <div class="box-item">진단 일시</div>
                <div class="box-item">진단 명</div>
                <div class="box-item">결과요약</div>
                <div class="box-item">상세보기</div>
            </div>
            <div id="box2">
                <div class="box-item">2025-09-18</div>
                <div class="box-item">우울증</div>
                <div class="box-item">중(약 복용)</div>
                <div class="box-item">
                    <button id="btn2">진단 결과 보기</button>
                </div>
            </div>
            <div id="doc-comment">우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 
                                    어려움을 주는 질병입니다
            </div>
            <div id="upload">
                <div>수원시 보건소</div>
                <div>업로드 날짜</div>
            </div>
        </div>

        <div id="community-box">
            <div id="diagnosis2">
                <div id="recent">최근 커뮤니티</div>
                <button id="btn3">
                    <img src="img/btn1.png" alt="down" class="icon2">
                </button>
            </div>
            <div class="frame">
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="frame-top">
                    <div class="text-wrapper-1">닉네임</div>
                    <div class="text-wrapper-2">진로/취업</div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <div class="div">요즘 너무 힘듭니다</div>
                    <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구 그러니까 전 아니라니까요 그게 뭐냐니까요?</p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">업로드 날짜</div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
                <div id="actions">
                    <span>❤️ 0</span>
                    <span>💬 0</span>
                    <span>🔗 1</span>
                </div>
            </div>
        </div>

    </div>
    </div>
    
</body>
</html>


