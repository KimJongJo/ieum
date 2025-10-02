<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/admin/css/noticeWrite.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/adminHeader.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/button/button.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<title>건강이음 - 공지사항 관리 작성</title>
</head>
<body>
	<header>
		<c:import url="/common/header/adminHeader.html" charEncoding="UTF-8" />
	</header>
	<div class="main">
		<div class="main-div">
			<div class="notice-under-section">
				<jsp:include page="/common/nav/adminNav.html"></jsp:include>
				<form method="post">
					<div class="info">
						<div class="notice-container">
							<div class="form-group">
								<div class="form-label multi">
									<span>상단공지여부</span><input type="checkbox" class="form-check"
										name="topYn" placeholder="상단공지여부" checked />
								</div>
							</div>
							<!-- 제목 -->
							<div class="form-group">
								<div class="form-label">제목</div>
								<input type="text" class="form-input" name="title"
									placeholder="제목을 입력하세요" value="${notice.title}" />
							</div>
							<!-- 작성자 -->
							<div class="form-group">
								<div class="form-label">작성자</div>
								<div class="form-value">${writer}</div>
							</div>

							<!-- 내용 -->
							<div class="form-group textarea-group">
								<div class="form-label">내용</div>
								<textarea class="form-textarea" name="content"
									placeholder="내용을 입력하세요">${notice.content}</textarea>
							</div>

							<div class="notice-footer">
								<!-- 첨부파일 -->
								<div class="file">
									<label class="file-upload" for="noticeFile">📂파일 선택</label>

									<!-- 기존에 업로드된 파일이 있다면 파일명 보여주기 -->
									<span class="upload-file-name"> ${not empty notice.fileName ? notice.fileName : "첨부된 파일 없음"}
									</span> <input class="file-input" type="file" name="noticeFile"
										id="noticeFile" />
								</div>
								<!-- 버튼 -->
								<div>
									<a class="btn-link" onclick="window.history.go(-1)">
										<button type="button" class="btn-cir-w">취소</button>
									</a>
									<button type="button" class="btn-cir-b" id="writeBtn">수정</button>
								</div>
							</div>
						</div>
					</div>
				</form>

			</div>
			<%-- 			<jsp:include page="../footer.html"></jsp:include> --%>
		</div>
	</div>
</body>
</html>