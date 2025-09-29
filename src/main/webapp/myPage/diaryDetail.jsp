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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/modal.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<title>건강이음 - 다이어리 상세</title>
<script src="${contextPath}/myPage/js/diaryWrite.js"></script>
<script src="${contextPath}/myPage/js/diary.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/common/header/header.html" />
	</header>
	<div class="main-container">
		<jsp:include page="/common/nav/userNav.html" />
		<div class="diary-container">
			<c:if test="${recentHistory}">
				<div class="btn-right">
					<button class="btn-rec-w"
						onclick="location.href=`${contextPath}/myPage/diagnosisHistory`">최근
						상담이력</button>
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
								<input type="radio" disabled id="happy" value="smile" name="emoji"
									${diary.mood eq 'smile' ? 'checked' : ''}><label
									for="happy">
									<div
										class="happy-icon ${diary.mood eq 'smile' ? 'happy-select' : ''}">
										<i class="fa-regular fa-face-smile"></i>
									</div>
								</label> <input type="radio" disabled id="soso" value="meh" name="emoji"
									${diary.mood eq 'meh' ? 'checked' : ''}><label
									for="soso">
									<div
										class="soso-icon ${diary.mood eq 'meh' ? 'soso-select' : ''}">
										<i class="fa-regular fa-face-meh"></i>
									</div>
								</label> <input type="radio" disabled id="sad" value="frown" name="emoji"
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
				<input type="text" readonly class="form-input"
					placeholder="제목을 입력하세요" value="${diary.title}">
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<textarea class="form-textarea" readonly placeholder="내용을 입력하세요">${diary.content}</textarea>
			</div>

			<div class="diary-footer">
				<form id="hiddenForm" method="post" action="${contextPath}/myPage/diary/delete">
					<input type="hidden" name="dNo" id="dNoInput" value="${diary.dNo}">
					<!-- 버튼 -->
					<div>
						<a class="btn-link" href="${contextPath}/myPage/diary?page=1">
							<button type="button" class="btn-cir-w">목록</button>
						</a>
						<c:if test="${diary.uNo == 123}">
						<button class="btn-cir-b" id="updateBtn"
							formaction="${contextPath}/myPage/diary/update">수정</button>
						<button type="button" class="btn-cir-b" id="delBtn"
							>삭제</button>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal-main-div" id="confirmModal" style="display: none">
		<div class="modal-div-over">
			<div class="modal-header-div">
				<span class="modal-header-div-span">알림</span>
				<button type="button" class="x-button" onclick="cancelDel()">
					<i class="fa-solid fa-x x-btn"></i>
				</button>
			</div>
			<div class="modal-content-div">
				<span class="modal-content-div-span">다이어리를 삭제하시겠습니까?</span>
			</div>
			<div class="modal-div-under">
				<div class="modal-btn-div">
					<button type="button" class="modal-btn-left modal-btn" onclick="cancelDel()">취소</button>
					<button class="modal-btn-right modal-btn" onclick="confirmDel()">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>