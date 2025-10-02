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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/button/button.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<title>건강이음 - 다이어리 수정</title>
<script src="${contextPath}/myPage/js/diaryWrite.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/common/header/header.html" />
	</header>
	<div class="main-container">
		<jsp:include page="/common/nav/userNav.html" />
		<div class="diary-container">
			<div class="btn-right">
				<span class="target-date">[ <fmt:formatDate
						value="${diary.targetDt}" pattern="yyyy-MM-dd" /> 일기 ]
				</span> <input type="hidden" name="targetDt" value="${ targetDt }">
				<c:if test="${recentHistory}">
					<button class="btn-rec-w"
						onclick="location.href=`${contextPath}/myPage/diagnosisHistory`">최근
						상담이력</button>
				</c:if>
			</div>
			<!-- 날짜 -->
			<form method="post" action="${contextPath}/myPage/diary/update">
				<input type="hidden" name="dNo" value="${diary.dNo}">
				<div class="form-group">
					<div class="form-label form-multi">
						<span>(작성일: <fmt:formatDate value="${diary.dCreated}"
								pattern="yyyy-MM-dd" />)
						</span>
						<div class="form-right">
							<span class="notice">기분을 선택해주세요</span>
							<div class="emoji">
								<input type="radio" id="happy" value="smile" name="emoji"
									${diary.mood eq 'smile' ? 'checked' : ''}><label
									for="happy">
									<div
										class="happy-icon ${diary.mood eq 'smile' ? 'happy-select' : ''}">
										<i class="fa-regular fa-face-smile"></i>
									</div>
								</label> <input type="radio" id="soso" value="meh" name="emoji"
									${diary.mood eq 'meh' ? 'checked' : ''}><label
									for="soso">
									<div
										class="soso-icon ${diary.mood eq 'meh' ? 'soso-select' : ''}">
										<i class="fa-regular fa-face-meh"></i>
									</div>
								</label> <input type="radio" id="sad" value="frown" name="emoji"
									${diary.mood eq 'frown' ? 'checked' : ''}><label
									for="sad">
									<div
										class="sad-icon ${diary.mood eq 'frown' ? 'sad-select' : ''}">
										<i class="fa-regular fa-face-frown"></i>
									</div>
								</label>
							</div>
						</div>

					</div>
				</div>


				<!-- 제목 -->
				<div class="form-group">
					<input type="text" name="title" class="form-input"
						placeholder="제목을 입력하세요" value="${diary.title}" maxlength="30">
				</div>
				<!-- 내용 -->
				<div class="form-group">
					<textarea class="form-textarea" name="content"
						placeholder="내용을 입력하세요">${diary.content}</textarea>
				</div>

				<div class="diary-footer">
					<!-- 버튼 -->
					<div>
						<a class="btn-link" onclick="window.history.go(-1)">
							<button type="button" class="btn-cir-w">취소</button>
						</a>
						<button type="button" class="btn-cir-b" id="writeBtn">수정</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>