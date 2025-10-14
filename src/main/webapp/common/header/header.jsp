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



	<!-- 헤더 위 검정 줄 -->
	<div class="login-inner">
		<div class="login-bar">
			<c:choose>
				<c:when test="${uNo != null}">
					<div class="header-profile">
						<img style="width: 30px; height:30px; border-radius:50%" src="${contextPath}/${sessionScope.profile}">
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

	<c:if test="${userType == 'ADMIN'}">
		<jsp:include page="/common/header/adminHeader.jsp"></jsp:include>
	</c:if>

	<c:if test="${pageName ne '/ieum/index' and sessionScope.userType ne 'ADMIN'}">

		<!-- Middle Header -->
		<c:if test="${sessionScope.userType == 'USER' || sessionScope.userType == NULL }">
			<jsp:include page="/common/header/subHeaderBasic.jsp"></jsp:include>
		</c:if>
		<c:if test="${sessionScope.userType != 'USER' && sessionScope.userType != NULL }">
			<jsp:include page="/common/header/subHeaderManager.jsp"></jsp:include>
		</c:if>
	</c:if>
</body>
</html>