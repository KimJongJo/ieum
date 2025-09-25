<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/noticeWrite.css">
<link rel="stylesheet" type="text/css"
	href="../common/header/adminHeader.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<title>건강이음 - 공지사항 관리 작성</title>
</head>
<body>
	<jsp:include page="../common/header/adminHeader.html"></jsp:include>

	<div class="main">
		<div class="main-div">
			<div class="under-section">
				<jsp:include page="../common/nav/adminNav.html"></jsp:include>
				<div class="info">
					<div class="notice-container">
						<div class="form-group">
							<div class="form-label multi">
								<span>상단공지여부</span><input type="checkbox" class="form-check"
										name="pinnded" placeholder="상단공지여부" checked/>
							</div>
						</div>
						<!-- 제목 -->
						<div class="form-group">
							<div class="form-label">
								제목
							</div>
							<input type="text" class="form-input" name="title"
								placeholder="제목을 입력하세요" value="${notice.title}" />
						</div>
						<!-- 작성자 -->
						<div class="form-group">
							<div class="form-label">작성자</div>
							<div class="form-value">${notice.writer}</div>
						</div>

						<!-- 내용 -->
						<div class="form-group">
							<div class="form-label">내용</div>
							<textarea class="form-textarea" name="content"
								placeholder="내용을 입력하세요">${notice.content}</textarea>
						</div>

						<div class="notice-footer">
							<!-- 첨부파일 -->
							<div class="file">
								<label class="file-upload" for="noticeFile">이미지 / 문서 첨부</label>

								<!-- 기존에 업로드된 파일이 있다면 파일명 보여주기 -->
								<span class="upload-file-name"> ${not empty notice.fileName ? notice.fileName : "첨부된 파일 없음"}
								</span> <input class="file-input" type="file" name="noticeFile"
									id="noticeFile" />
							</div>
							<!-- 버튼 -->
							<div class="button-wrapper">
								<a class="btn-link" href="/notice/list">
									<div class="basic-small-btn">취소</div>
								</a>
								<button type="submit" class="primary-small-btn">${mode eq 'edit' ? '수정' : '작성'}</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%-- 			<jsp:include page="../footer.html"></jsp:include> --%>
		</div>
	</div>
</body>
</html>