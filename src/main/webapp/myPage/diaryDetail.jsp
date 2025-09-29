<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/myPage/css/diaryWrite.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<title>건강이음 - 다이어리 상세</title>
<script src="${contextPath}/myPage/js/diaryWrite.js"></script>
<script src="${contextPath}/myPage/js/diary.js"></script>
</head>
<body>
	<div class="diary-container">
		<c:if test="${recentHistory}">
			<div class="btn">
				<a class="btn-link" href="">
					<div class="basic-big-btn">최근 상담이력</div>
				</a>
			</div>
		</c:if>
		<!-- 날짜 -->
		<div class="form-group">
			<div class="form-label form-multi">
				<span><fmt:formatDate value="${diary.dCreated}"
						pattern="yyyy-MM-dd" /> 일기</span>
				<div class="form-right">
					<span class="notice">오늘의 기분</span>
					<div class="emoji">
						<input type="radio" disabled id="happy" name="emoji"> <label
							for="happy">
							<div class="happy-icon ${diary.mood eq 'smile' ? 'happy-select' : ''}">
								<i class="fa-regular fa-face-smile"></i>
							</div>
						</label> <input type="radio" disabled id="soso" name="emoji"> <label
							for="soso">
							<div class="soso-icon ${diary.mood eq 'meh' ? 'soso-select' : ''}">
								<i class="fa-regular fa-face-meh"></i>
							</div>
						</label> <input type="radio" disabled id="sad" name="emoji"> <label
							for="sad">
							<div class="sad-icon ${diary.mood eq 'frown' ? 'sad-select' : ''}">
								<i class="fa-regular fa-face-frown"></i>
							</div>
						</label>
					</div>
				</div>

			</div>
		</div>
		<!-- 제목 -->
		<div class="form-group">
			<input type="text" readonly class="form-input"
				placeholder="제목을 입력하세요" value="${diary.title}">
		</div>
		<!-- 내용 -->
		<div class="form-group">
			<textarea class="form-textarea" readonly placeholder="내용을 입력하세요">${diary.content}</textarea>
		</div>

		<div class="diary-footer">
			<form id="hiddenForm" action="${contextPath}/myPage/diary/update"
				method="post">
				<input type="hidden" name="dNo" id="dNoInput" value="${diary.dNo}">
			</form>
			<!-- 버튼 -->
			<div class="button-wrapper">
					<div class="basic-big-btn" onclick="goUpdate()">수정</div>
					<div class="basic-big-btn" id="delBtn">삭제</div>
				<a class="btn-link" href="${contextPath}/myPage/diary?page=1">
					<div class="basic-big-btn">목록</div>
				</a>
			</div>
		</div>
</body>
</html>