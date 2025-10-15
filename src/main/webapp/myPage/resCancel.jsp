<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=heart_minus" />
	<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath }/myPage/css/resCancel.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/footer.css" />
<title>resCancel</title>
</head>
<body>
	<c:import url="/common/header/header.jsp" charEncoding="UTF-8" />
	<div class="myPage">
		<jsp:include page="/common/nav/nav.jsp" />
		<div class="container1">
			<div class="box">
				<div class="icon">
					<span class="material-symbols-outlined"> heart_minus </span>
				</div>
				<span class="t1">예약이 취소되었습니다.</span>
			</div>

			<div class="btn">
				<a href="${contextPath }/hospital/search"><button type="button"
						class="btn-rec-b">예약하기</button></a> <a
					href="${contextPath }/myPage/reservation/list"><button
						type="button" class="btn-rec-w">확인</button></a>

			</div>
		</div>
	</div>
	<c:import url="/common/footer/footer.html" charEncoding="UTF-8" />
</body>
</html>