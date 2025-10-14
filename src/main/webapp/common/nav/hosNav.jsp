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
.first-block {
    width: 195px;
    height: 115px;
    background-color: #4a64d6;
    border-radius: 5px 5px 0 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    font-size:18px;
    font-weight:bold;
}

.first-block-span {
	color: white;
	font-size: 17px;
}

.second-block {
	width: 195px;
	height: 105px;
	background-color: #ccd1df;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: center;
}

.second-block>span {
	padding-left: 15px;
}

.second-block-first {
	font-size: 17px;
}

.second-block-second {
	font-size: 17px;
	font-weight: bold;
}

.second-block-third {
	font-size: 13px;
	color: #96989e;
}

.button-block {
	display: flex;
	flex-direction: column;
}

.button {
	width: 195px;
	height: 50px;
	background-color: white;
	border: 1px solid #bfbfbf;
	cursor: pointer;
	text-align: start;
	padding-left: 15px;
	font-size: 16px;
}

.button-block .button:last-child {
	border-radius: 0 0 5px 5px;
}

.main-nav {
	width: 195px;
	margin-right: 35px;
}

/* 네비 추가 메뉴 */
.menu {
	width: 195px;
	height: 50px;
	/* text-align: center; */
	line-height: 40px;
}

.menu>.sub, .menu>.sub2 {
	height: 0;
	list-style: none;
	overflow: hidden;
	transition: height ease-out 0.6s 0s;
	margin: 0;
	padding: 0;
}

.menu>.sub li, .menu>.sub2 li {
	background-color: #ccd1df;
	border-top: 1px white solid;
	padding-left: 15px;
}

.menu>.sub li>a, .menu>.sub2 li>a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<div class="main-nav">
		<div class="first-block">
			<img src="../image/건강이음.png" width="120px" alt="" /> <span
				class="first-block-span">${navPathName}</span>
		</div>
		<div class="second-block">
			<span class="second-block-first">환영합니다</span>
			<c:choose>
				<c:when test="${userType == 'DOCTOR'}">
					<span class="second-block-second"> 의사 </span>

				</c:when>
				<c:otherwise>
					<span class="second-block-second"> 병원 관리자 </span>
				</c:otherwise>
			</c:choose>
			<span class="second-block-third">${uNm}</span>
		</div>
		<div class="button-block">
			<div class="menu">
				<c:choose>
					<c:when test="${userType == 'DOCTOR'}">
						<button type="button" class="button more-nav">예약 관리</button>
						<ul class="sub">
							<li><a href="/ieum/hosManager/reservationToday">오늘예약</a></li>
							<li><a href="/ieum/hosManager/reservation">예약/진단기록</a></li>
						</ul>
						<button type="button" class="button more-nav">공지사항 관리</button>
						<ul class="sub">
							<li><a href="/ieum/admin/notice/write">공지사항등록</a></li>
							<li><a href="/ieum/admin/notice?page=1">공지사항목록</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='/ieum/hosManager/hospitalInfo'"
							type="button" class="button">병원 관리</button>

						<button type="button" class="button more-nav">공지사항 관리</button>
						<ul class="sub">
							<li><a href="/ieum/admin/notice/write">공지사항등록</a></li>
							<li><a href="/ieum/admin/notice?page=1">공지사항목록</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>


	<script>
		// 네비 추가 메뉴
		const menu = document.querySelector(".more-nav");
		const subBar = document.querySelector(".menu>.sub");

		document.querySelectorAll(".more-nav").forEach(button => {
			  button.addEventListener("click", () => {
			    const sub = button.nextElementSibling;
			    sub.style.height = sub.style.height === "82px" ? "0px" : "82px";
			  });
			});
	</script>
</body>
</html>