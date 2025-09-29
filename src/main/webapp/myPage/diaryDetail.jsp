<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/diaryWrite.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<title>건강이음 - 다이어리 상세</title>
<script src="js/diaryWrite.js"></script>
</head>
<body>
	<div class="diary-container">
		<div class="btn">
			<a class="btn-link" href="">
				<div class="basic-big-btn">최근 상담이력</div>
			</a>
		</div>
		<!-- 날짜 -->
		<div class="form-group">
			<div class="form-label form-multi">
				<span>2020.09.22 일기</span>
				<div class="form-right">
					<span class="notice">오늘의 기분을 선택해주세요</span>
					<div class="emoji">
						<input type="radio" disabled id="happy" name="emoji"><label
							for="happy">
							<div class="happy-icon happy-select">
								<i class="fa-regular fa-face-smile"></i>
							</div>
						</label> <input type="radio" disabled id="soso" name="emoji"><label
							for="soso">
							<div class="soso-icon">
								<i class="fa-regular fa-face-meh"></i>
							</div>
						</label> <input type="radio" disabled id="sad" name="emoji"><label
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
			<input type="text" readonly class="form-input"
				placeholder="제목을 입력하세요" value="9월 6일 기록">
		</div>
		<!-- 내용 -->
		<div class="form-group">
			<textarea class="form-textarea" readonly placeholder="내용을 입력하세요">9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째 상담이라 그런지 지난번보다 편안했다</textarea>
		</div>

		<div class="diary-footer">
			<!-- 버튼 -->
			<div class="button-wrapper">
				<a class="btn-link" href="${contextPath}/myPage/diary">
					<div class="basic-big-btn">목록</div>
				</a>
			</div>
		</div>
</body>
</html>