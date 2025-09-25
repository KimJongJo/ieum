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
<link rel="stylesheet" href="css/calender.css"></link>
<script src="js/calender.js"></script>
<style>
</style>

</head>
<body>
<c:import url="../common/header/header.html" charEncoding="UTF-8"/>

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
                <img src="../img/btn1.png" alt="down" class="icon">
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
                    <img src="../img/btn1.png" alt="down" class="icon2">
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
	<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>


