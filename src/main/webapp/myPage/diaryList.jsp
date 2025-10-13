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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/button/button.css" />
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
</head>

<body>
	<header>
		<jsp:include page="/common/header/header.jsp" />
	</header>
	<div class="section-title">
        <span>다이어리</span>
    </div>
	<div class="main-container">
		<jsp:include page="/common/nav/nav.jsp" />

		<div class="diary-container">

			<!-- 달력 -->
			<div id="calendar"></div>

			<!-- 검색 및 작성 버튼 -->
			<div class="button-wrapper">
				<div class="notice-search">
					<input id="searchInput" type="text" placeholder="검색어를 입력하세요">
					<button type="button" onclick="searchDiary()">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>

				<select class="notice-select" onchange="sortDiary(this)">
					<option selected disabled value="none">정렬</option>
					<option value="d_created">최신순</option>
					<option value="target_dt">날짜순</option>
					<option value="title">제목순</option>
				</select>
				<button class="btn-rec-w"
					onclick="location.href=`${contextPath}/myPage/diary/write`">작성</button>
			</div>
			<form id="diaryForm" method="post"
				action="${contextPath}/myPage/diary">
				<input type="hidden" name="dNo" id="dNoInput" value="123">
				<!-- 다이어리 리스트 -->
				<c:choose>
					<c:when test="${not empty diaryList}">
						<table class="diary-list" id="diaryList">
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
							<tbody id="diaryListBody">
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
						<div class="no-data" id="noDataList">
							<div class="icon">
								<i class="fa-solid fa-circle-exclamation"></i>
							</div>
							<div>작성된 다이어리가 없습니다.</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="no-data" id="noSearchList" style="display: none">
					<div class="icon">
						<i class="fa-solid fa-circle-exclamation"></i>
					</div>
					<div>검색결과가 없습니다.</div>
				</div>
			</form>

			<!-- 상세 팝업 -->
			<form id="hiddenForm" method="post"
				action="${contextPath}/myPage/diary/delete">
				<input type="hidden" id="popupDNo" name="dNo">
				<div class="detail-popup" style="display: none;">
					<button type="button" id="close-btn" class="close-btn">
						<i class="fa-solid fa-x"></i>
					</button>

					<div class="title">
						<span id="popupTitle">9월 6일 기록</span>
						<div class="emoji happy-icon" id="popupMood">
							<i class="fa-regular fa-face-smile"></i>
						</div>
					</div>

					<div class="content">
						<div class="sub-title">
							일시 <span id="popupDt">2025.09.06</span>
						</div>
						<div class="sub-title">
							내용 <span id="popupContent">9월 6일 오전 10시경 상담을 받았다. 이번 상담은
								두번째 상담이라 그런지 지난번보다 편안했다.</span>
						</div>
					</div>

					<div class="button-wrapper">
						<button class="btn-cir-b" id="updateBtn"
							formaction="${contextPath}/myPage/diary/update">수정</button>
						<button type="button" class="btn-cir-b" id="delBtn">삭제</button>
						<c:if test="${recentHistory}">
							<a class="btn-link" href="${contextPath}/myPage/diagnosisHistory">
								<button type="button" class="btn-cir-w">상담이력 바로가기</button>
							</a>
						</c:if>
					</div>
				</div>
				<!-- 작성확인 팝업 -->
				<input type="hidden" id="clickedDt">
				<div class="modal-main-div" id="writeConfirmModal"
					style="display: none">
					<div class="modal-div-over">
						<div class="modal-header-div">
							<span class="modal-header-div-span">알림</span>
							<button type="button" class="x-button" onclick="cancelWrite()">
								<i class="fa-solid fa-x x-btn"></i>
							</button>
						</div>
						<div class="modal-content-div">
							<span class="modal-content-div-span">선택한 날짜에 다이어리가 존재하지
								않습니다.<br>다이어리를 작성하시겠습니까?
							</span>
						</div>
						<div class="modal-div-under">
							<div class="modal-btn-div">
								<button type="button" class="modal-btn-left modal-btn"
									onclick="cancelWrite()">취소</button>
								<button type="button" class="modal-btn-right modal-btn"
									onclick="confirmWrite()">확인</button>
							</div>
						</div>
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
							<span class="modal-content-div-span">다이어리를 삭제하시겠습니까?</span>
						</div>
						<div class="modal-div-under">
							<div class="modal-btn-div">
								<button type="button" class="modal-btn-left modal-btn"
									onclick="cancelDel()">취소</button>
								<button class="modal-btn-right modal-btn" onclick="confirmDel()">확인</button>
							</div>
						</div>
					</div>
				</div>
			</form>


			<!-- 페이지네이션 -->
			<c:if test="${not empty diaryList}">
				<div class="diary-footer">
					<div class="pagination" id="pagination">
						<!-- 이전 버튼 -->
						<c:if test="${pageInfo.curPage > 1}">
							<button data-label="${pageInfo.curPage-1}">&lt;</button>
						</c:if>

						<!-- 페이지 번호 반복 -->
						<c:forEach var="pageNum" begin="${pageInfo.startPage}"
							end="${pageInfo.endPage}">
							<c:if test="${pageNum <= pageInfo.allPage}">
								<button data-label="${pageNum}" class="${pageNum == pageInfo.curPage ? 'active' : ''}">
									${pageNum}</button>
							</c:if>
						</c:forEach>

						<!-- 다음 버튼 -->
						<c:if test="${pageInfo.curPage < pageInfo.endPage}">

							<button data-label="${pageInfo.curPage+1}">&gt;</button>
						</c:if>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<footer></footer>
</body>
</html>
