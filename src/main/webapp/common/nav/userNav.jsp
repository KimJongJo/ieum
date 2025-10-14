<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

/* 사이드바 */
.sidebar {
	width: 195px;
	/*     height: 550px; */
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow: hidden;
}
.sidebar a{
	text-decoration: none;
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
	cursor: pointer;
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
</style>
</head>
<body>
	<!-- Main -->
	<!-- Sidebar -->
	<div class="container-two">
		<div class="sidebar">
			<a href="/ieum/calender">
			<div class="sidebar-header">
				건강이음<br>마이페이지
			</div>
			</a>
			<div class="welcome">
				<strong>*환영합니다*<br>${ uNm } 회원님
				</strong> <span>${nickNm }</span>
			</div>
			<div class="sidebar-body">
				<ul>
					<a href="/ieum/pInfo"><li><button type="button">나의
								기본 정보</button></li></a>
					<a href="/ieum/myPage/reservation/list"><li><button type="button">예약 내역</button></li></a>
					<a href="/ieum/myPage/diagnosisHistory"><li><button type="button">진단 이력</button></li></a>
					<a href="/ieum/myCom"><li><button type="button">나의
								커뮤니티</button></li></a>
					<a href="/ieum/black"><li><button type="button">차단
								목록</button></li></a>
					<a href="/ieum/myPage/diary?page=1"><li><button type="button">다이어리</button></li></a>
					<a href="/ieum/hosFavorite"><li><button type="button">즐겨찾는 병원</button></li></a>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>