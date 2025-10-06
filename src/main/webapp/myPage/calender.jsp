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
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/calender.css" />
<script src="${pageContext.request.contextPath}/myPage/css/calender.js"></script>
<style>
/* 전체 레이아웃 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #ffffff;
}

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

.right-content {
    display: flex;
    flex-direction: column; /* 세로 정렬 */
    gap: 40px; /* 세로 간격 */
    width: 1000px;
}
/* 사이드바 */
.sidebar {
    width: 195px;
    height: 560px;
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
    width: 996px;
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
    width: 996px;
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
  width: 996px;
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



#calendar {
    width: 900px;  /* 기존 600px → 900px */
    height: 700px; /* 기존 400px → 600px */
    margin: 0;
}
#calendar td, #calendar th {
    width: 80px;  /* 날짜 셀 너비 */
    height: 80px; /* 날짜 셀 높이 */
    font-size: 16px;
    text-align: center;
    vertical-align: middle;
}
</style>

<script type="text/javascript">

$(function() {

    /* ===========================
       1️⃣ diagnosis-box 토글
    =========================== */
    var $diagnosisBox = $("#diagnosis-box");
    var $btn1 = $("#btn1");
    var $btnImg = $btn1.find("img");

    $diagnosisBox.hide(); // 처음 숨김

    $btn1.on("click", function() {
        $diagnosisBox.toggle(); // display: none <-> block 전환
        if ($diagnosisBox.is(":visible")) {
            $btnImg.css("transform", "rotate(0deg)");
        } else {
            $btnImg.css("transform", "rotate(180deg)");
        }
    });


    /* ===========================
       2️⃣ community-box 토글
    =========================== */
    var $frame = $("#community-box .frame");
    var $btn3 = $("#btn3");
    var $btn3Img = $btn3.find("img");

    $frame.hide(); // 처음 숨김

    $btn3.on("click", function() {
        $frame.toggle(); // display none <-> flex 전환
        if ($frame.is(":visible")) {
            $frame.css("display", "flex"); // toggle 후 flex 유지
            $btn3Img.css("transform", "rotate(0deg)");
        } else {
            $btn3Img.css("transform", "rotate(180deg)");
        }
    });


    /* ===========================
       3️⃣ '관리 메뉴' 숨기기
    =========================== */
    $(".menu span:nth-child(5)").hide();

});
</script>

</head>
<body>
<c:import url="/common/header/header.html" charEncoding="UTF-8"/>

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
        <!-- 오른쪽: 콘텐츠 (캘린더 + 진단 + 커뮤니티 세로 정렬) -->
    <div class="right-content">
	<c:import url="/common/calender/calender.jsp" charEncoding="UTF-8"/>
    <!-- 최근 진단 이력 -->
    <div class="container-three">
    
        <div id="diagnosis1">
            <div id="recent">최근 진단 이력</div>
            <button id="btn1">
                <img id="Heart1" src="${pageContext.request.contextPath}/img/버튼.png" alt="좋아요" width="15" height="15"/>
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
                    <img id="Heart1" src="${pageContext.request.contextPath}/img/버튼.png" alt="좋아요" width="15" height="15"/>
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
    </div>
	<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>


