<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/css/header.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function moveToUrl(url) {
		window.location.href= "/ieum" + url;
	}
</script>
</head>
<body>


	<c:if test="${userType == 'ADMIN'}">
		<jsp:include page="/common/header/adminHeader.jsp"></jsp:include>
	</c:if>
	<!-- 헤더 위 검정 줄 -->
	<div class="login-inner">
		<div class="login-bar">
			<c:choose>
				<c:when test="${uNo != null}">
					<div class="header-profile">
						<img src="${contextPath}/${sessionScope.profile}">
					</div>
					<span class="login-txt" onclick="moveToUrl('/logout')">로그아웃</span>
				</c:when>
				<c:otherwise>
					<span class="login-txt" onclick="moveToUrl('/login')">로그인 / 회원가입</span>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="header-line-top"></div>

	<!-- Header -->
	<c:choose>
		<c:when test="${userType == 'USER'}">
			<jsp:include page="/common/header/basicHeader.html"></jsp:include>
		</c:when>
		<c:when test="${userType == 'DOCTOR'}">
			<jsp:include page="/common/header/doctorHeader.html"></jsp:include>
		</c:when>
		<c:when test="${userType == 'MANAGER'}">
			<jsp:include page="/common/header/managerHeader.html"></jsp:include>
		</c:when>
		<c:when test="${userType == 'ADMIN'}">
			<jsp:include page="/common/header/adminNavHeader.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="/common/header/guestHeader.html"></jsp:include>
		</c:otherwise>
	</c:choose>
	<!-- <div class="container">
		<div class="header">
			<div class="header-inner">
				<div style="cursor: pointer;" onclick="location.href='/ieum/index'"
					class="logo">건강이음</div>
				<div class="header-menu">
					<span style="cursor: pointer;"
						onclick="location.href='/ieum/hospital/search'">병원조회/예약</span> <span
						style="cursor: pointer;" onclick="location.href='/ieum/exam'">자가진단</span>
					<span style="cursor: pointer;"
						onclick="location.href='/ieum/allComList'">커뮤니티</span> <span
						style="cursor: pointer;" onclick="location.href='/ieum/notice?page=1'">공지사항</span>
										<div class="dropdown" style="cursor: pointer;">
											<span class="dropdown-btn">관리 메뉴</span>
											병원관리자 관리메뉴
											<div class="dropdown-content" id="hosMenu">
												<a href="/ieum/admin/member">회원 관리</a>
																			  <a href="/ieum/admin/chat">마음톡
																				관리</a> 
												<a href="/ieum/admin/notice">공지사항 관리</a>
											</div>
											사이트 관리자 관리 메뉴
											<div class="dropdown-content" id="adminMenu">
												<a href="/ieum/hosManager/reservationToday">대기열 관리</a> <a
													href="/ieum/admin/notice">공지사항 관리</a>
											</div>
										</div>
					<span class="hide-if-user">관리 메뉴</span> <span
						style="cursor: pointer;" onclick="location.href='/ieum/calender'">마이페이지</span>
				</div>
			</div>
		</div>
	</div> -->
	<c:if test="${pageName ne '/ieum/index' and sessionScope.userType ne 'ADMIN'}">

		<!-- Middle Header -->
		<c:if test="${sessionScope.userType == 'USER' || sessionScope.userType == NULL }">
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
		</c:if>
		<c:if test="${sessionScope.userType != 'USER' && sessionScope.userType != NULL }">
			<div class="middle-header">
				<div class="full-rect2"></div>
				<div class="group xlarge">
					<div class="outer-circle xlarge-circle2">
						<div class="inner-circle xlarge-inner2"></div>
					</div>
					<div class="rectangle xlarge-rect2"></div>
				</div>
				<div class="group large">
					<div class="outer-circle large-circle2">
						<div class="inner-circle large-inner2"></div>
					</div>
					<div class="rectangle large-rect2"></div>
				</div>
				<div class="group small">
					<div class="outer-circle small-circle2">
						<div class="inner-circle small-inner2"></div>
					</div>
					<div class="rectangle small-rect2"></div>
				</div>
			</div>
		</c:if>
	</c:if>
</body>
</html>