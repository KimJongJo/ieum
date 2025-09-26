<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 공지사항 목록</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="${contextPath}/notice/css/noticeList.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/common/pagination/page.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/common/searchBox/search.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<script src="../common/pagination/page.js"></script>
</head>
<body>
	<header>
		<%-- 		<jsp:include page="../common/header/adminHeader."></jsp:include> --%>
		<%-- 		<jsp:include page="middleHeader.jsp"></jsp:include> --%>
	</header>

	<div class="notice-container">
		<div class="notice-header">
			<div class="notice-cnt">
				전체 건수<span>1091</span>건
			</div>
			<jsp:include page="../common/searchBox/search.html"></jsp:include>
		</div>

		<div class="list-section">
			<a href="${contextPath}/notice?nNo=1">
				<div class="notice-list">
					<img class="notice-img" src="">
					<div class="notice-item">
						<div class="notice-title-row">
							<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
							<div class="top-notice">공지</div>
						</div>
						<span class="notice-content cate">보건이슈</span> <span
							class="notice-content content">비급여 가격을</span> <span
							class="notice-content date">게시일 2025-09-03</span>
					</div>
				</div>
			</a>

			<!-- 동일 항목 반복 -->
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<div class="notice-list">
				<img class="notice-img" src="">
				<div class="notice-item">
					<div class="notice-title-row">
						<span class="notice-title">구로 보건소 9월 22일부터 휴진 실시</span>
						<div class="top-notice">공지</div>
					</div>
					<span class="notice-content cate">보건이슈</span> <span
						class="notice-content content">비급여 가격을</span> <span
						class="notice-content date">게시일 2025-09-03</span>
				</div>
			</div>
			<!-- 하단 영역 -->
			<div class="notice-footer">
				<!-- 페이지네이션 -->
				<jsp:include page="../common/pagination/page.html"></jsp:include>
			</div>
		</div>
	</div>

	<footer>
		<%--     <jsp:include page="footer1.jsp"></jsp:include> --%>
		<%--     <jsp:include page="footer2.jsp"></jsp:include> --%>
	</footer>
</body>
</html>