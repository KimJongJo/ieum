<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>건강이음 - 다이어리 메인</title>

<!-- FullCalendar -->
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/myPage/css/diaryList.css">
<link rel="stylesheet" href="${contextPath}/css/header.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- FullCalendar Script -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>

<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>

<!-- Custom JS -->
<script src="${contextPath}/myPage/js/diary.js"></script>
<script src="${contextPath}/myPage/js/diaryList.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/common/header/header.html" />
	</header>

	<div class="main-container">
		<jsp:include page="/common/nav/userNav.html" />

		<div class="diary-container">

			<!-- 달력 -->
			<div id="calendar"></div>

			<!-- 검색 및 작성 버튼 -->
			<div class="button-wrapper">
				<div class="notice-search">
					<input type="text" placeholder="검색어를 입력하세요">
					<button type="button">
						검색 <i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>

				<select class="notice-select">
					<option selected disabled value="none">정렬</option>
					<option>최신순</option>
					<option>제목순</option>
				</select> <a class="btn-link" href="${contextPath}/myPage/diary/write">
					<div class="basic-big-btn">작성</div>
				</a>
			</div>
			<form id="diaryForm" method="post" action="${contextPath}/myPage/diary">
				<c:choose>
					<c:when test="${not empty diaryList}">
						<!-- 다이어리 리스트 -->
						<table class="diary-list">
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 55%;">
								<col style="width: 19%;">
								<col style="width: 6%;">
							</colgroup>

							<thead>
								<tr>
									<th>제목</th>
									<th>내용</th>
									<th>작성일</th>
									<th>기분</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="diary" items="${diaryList}">
									<tr class="diary-item" onclick="goDetail(${diary.dNo})">
										<td class="diary-title-row"><span class="diary-title">${diary.title}</span>
										</td>
										<td><span class="diary-txt">${diary.content}</span></td>
										<td><span class="diary-date"> <fmt:formatDate
													value="${diary.dCreated}" pattern="yyyy-MM-dd" />
										</span></td>
										<td class="emoji"><i
											class="fa-regular fa-face-${diary.mood}"></i></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<div class="no-data">
							<div class="icon">
								<i class="fa-solid fa-circle-exclamation"></i>
							</div>
							<div>
								작성된 다이어리가 없습니다.
								</td>
							</div>
					</c:otherwise>
				</c:choose>

				<!-- 상세 팝업 -->
				<div class="detail-popup" style="display: none;">
					<button type="button" id="close-btn" class="close-btn">
						<i class="fa-solid fa-x"></i>
					</button>

					<div class="title">
						<span>9월 6일 기록</span>
						<div class="emoji happy-icon">
							<i class="fa-regular fa-face-smile"></i>
						</div>
						<div class="emoji soso-icon" style="display: none;">
							<i class="fa-regular fa-face-meh"></i>
						</div>
						<div class="emoji sad-icon" style="display: none;">
							<i class="fa-regular fa-face-frown"></i>
						</div>
					</div>

					<div class="content">
						<div class="sub-title">
							일시 <span>2025.09.06</span>
						</div>
						<div class="sub-title">
							내용 <span>9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째 상담이라 그런지 지난번보다
								편안했다.</span>
						</div>
					</div>

<!-- 					<div class="button-wrapper"> -->

<!-- 						<input type="hidden" name="dNo" id="dNoInput"> <a -->
<%-- 							class="btn-link" href="${contextPath}/myPage/diary/update"> --%>
<!-- 							<div class="basic-big-btn">수정</div> -->
<!-- 						</a> -->
<!-- 						<button type="submit" class="basic-big-btn" -->
<%-- 							formaction="${contextPath}/myPage/diary/delete" id="delBtn"> --%>
<!-- 							삭제</button> -->
<%-- 						<a class="btn-link" href="${contextPath}/myPage/diagnosis"> --%>
<!-- 							<div class="primary-big-btn">진단이력 바로가기</div> -->
<!-- 						</a> -->

<!-- 					</div> -->
				</div>
			</form>

			<!-- 페이지네이션 -->
			<c:if test="${not empty diaryList}">
				<div class="diary-footer">
					<div class="pagination" id="pagination">
						<button>&lt;</button>
						<c:forEach begin="1" end="10" var="pageNum">
							<button class="${pageNum == 1 ? 'active' : ''}">${pageNum}</button>
						</c:forEach>
						<button>&gt;</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<footer></footer>
	<div class="modal-main-div" id="writeConfrimModal" style="display: none">
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
