<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/admin/css/noticeDetail.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/adminHeader.css">
<link rel="stylesheet" href="${contextPath}/css/modal.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<script src="${contextPath}/admin/js/notice.js"></script>
<title>건강이음 - 공지사항관리 상세</title>
</head>
<body>
	<jsp:include page="../common/header/adminNavHeader.jsp"></jsp:include>
	<div class="main">
		<div class="main-div">
			<div class="under-section">
				<jsp:include page="../common/nav/adminNav.html"></jsp:include>
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
					<div class="notice-attach">
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
								onclick="location.href=`${contextPath}/admin/notice?page=1`">목록</button>
							<button class="btn-rec-b"
								onclick="updateNotice(${notice.nNo})">수정</button>
							<button class="btn-rec-b" onclick="deleteNotice(${notice.nNo})">삭제</button>
						</div>
					</div>
					<!-- 삭제 확인 팝업 -->
					<div class="modal-main-div" id="delConfirmModal"
						style="display: none">
						<div class="modal-div-over">
							<div class="modal-header-div">
								<span class="modal-header-div-span">알림</span>
								<button type="button" class="x-button" onclick="cancelDel()">
									<i class="fa-solid fa-x x-btn"></i>
								</button>
							</div>
							<div class="modal-content-div">
								<span class="modal-content-div-span">선택하신 공지를 삭제하시겠습니까?</span>
							</div>
							<div class="modal-div-under">
								<div class="modal-btn-div">
									<button type="button" class="modal-btn-left modal-btn"
										onclick="can celDel()">취소</button>
									<button id="del" data-label=""
										class="modal-btn-right modal-btn" onclick="confirmDel()">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>