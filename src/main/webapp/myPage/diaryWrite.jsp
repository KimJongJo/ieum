<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>건강이음 - 다이어리 작성</title>
<script src="${contextPath}/myPage/js/diaryWrite.js"></script>
</head>
<body>
	<div class="diary-container">
		<div class="btn">
			<a class="btn-link" href="${contextPath}/myPage/diagnosisHistory">
				<div class="basic-big-btn">최근 상담이력</div>
			</a>
		</div>
		<!-- 날짜 -->
		<form method="post">
			<div class="form-group">
				<div class="form-label form-multi">
					<span>${todayDt} 일기</span>
					<div class="form-right">
						<span class="notice">오늘의 기분을 선택해주세요</span>
						<div class="emoji">
							<input type="radio" id="happy" value="smile" name="emoji"><label
								for="happy">
								<div class="happy-icon">
									<i class="fa-regular fa-face-smile"></i>
								</div>
							</label> <input type="radio" id="soso" value="meh" name="emoji"><label
								for="soso">
								<div class="soso-icon">
									<i class="fa-regular fa-face-meh"></i>
								</div>
							</label> <input type="radio" id="sad" value="frown" name="emoji"><label
								for="sad">
								<div class="sad-icon">
									<i class="fa-regular fa-face-frown"></i>
								</div>
							</label>
						</div>
					</div>

				</div>
			</div>
			<!-- 제목 -->
			<div class="form-group">
				<input type="text" name="title" class="form-input" placeholder="제목을 입력하세요">
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<textarea class="form-textarea" name="content" placeholder="내용을 입력하세요"></textarea>
			</div>

			<div class="diary-footer">
				<!-- 버튼 -->
				<div class="button-wrapper">
					<a class="btn-link" href="${contextPath}/myPage/diary?page=1">
						<div class="basic-small-btn">취소</div>
					</a>
					<button type="submit" formaction="${contextPath}/myPage/diary/write"
						class="primary-small-btn">작성</button>
				</div>
			</div>
		</form>
</body>
</html>