<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 공지사항 상세</title>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/notice/css/noticeDetail.css">
	
	<c:if test="${userType == 'ADMIN'}">
	<link rel="stylesheet" type="text/css"
		href="${contextPath}/admin/css/admin.css">
</c:if>
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<script src="${contextPath}/notice/js/notice.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/common/header/header.jsp"></jsp:include>
	</header>
	<div class="notice-container">

		<!-- 제목 -->
		<div class="notice-header">
			<c:if test="${notice.isPinned}">
				<div class="tag">${notice.isPinned ? '공지' : ''}</div>
			</c:if>
			${notice.title}
		</div>

		<!-- 정보 -->
		<div class="notice-info">
			<div>
				<span>등록일</span>${notice.nCreated}
			</div>
			<div>
				<c:if test="${notice.nUpdated}!= null ">
					<span>최근 수정일</span>${notice.nUpdated != null ? notice.nUpdated : ''}</c:if>
			</div>
			<div>
				<span>작성자</span>${writer}
			</div>
		</div>

		<!-- 첨부파일 -->
		<c:if test="${notice.fileName != null }">
			<div class="notice-attach" onclick="window.open(`/ieum/notice/download?no=${notice.fileNo}`)">
				첨부파일 <span>${notice.fileName}</span>
			</div>
		</c:if>
		<!-- 본문 -->
		<div class="notice-content">${notice.content}</div>

		<!-- 이전글/다음글 -->
		<div class="notice-nav">
			<c:if test="${not empty prev.nNo}">
				<div onclick="goOther(${prev.nNo})">
					<span>이전글</span>${prev.title}
				</div>
			</c:if>
			<c:if test="${not empty next.nNo}">
				<div onclick="goOther(${next.nNo})">
					<span>다음글</span>${next.title}
				</div>
			</c:if>
		</div>

		<!-- 버튼 -->
		<div class="notice-footer">
			<div class="button-wrapper">
				<button class="btn-rec-w"
					onclick="location.href=`${contextPath}/notice?page=1`">목록</button>
			</div>
		</div>
	</div>
	<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>