<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/admin/css/noticeList.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/adminHeader.css">
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/modal.css" />
<link rel="stylesheet" href="${contextPath}/common/pagination/page.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/common/searchBox/search.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminIndexFooter.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<script src="${contextPath}/admin/js/notice.js"></script>
<title>건강이음 - 공지사항관리 목록</title>
</head>
<body>
	<header>
		<jsp:include page="/common/header/header.jsp"></jsp:include>
	</header>

	<div class="main">
		<div class="main-div">
			<div class="under-section">
				<jsp:include page="../common/nav/nav.jsp"></jsp:include>
				<div class="info">
					<div class="select-reservation">
						<div class="notice-div">
							<span class="notice-span">공지사항 관리</span>
							<!-- 검색 및 작성 버튼 -->
							<div class="button-wrapper">
								<div class="notice-search">
									<input id="searchInput" type="text" placeholder="검색어를 입력하세요">
									<button type="button" onclick="renderList(1)">
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>

								<select class="notice-select" onchange="renderList(1)">
									<option selected disabled value="none">정렬</option>
									<option value="n_created">작성순</option>
									<option value="n_updated">수정순</option>
									<option value="title">제목순</option>
								</select>
								<button class="btn-rec-w"
									onclick="location.href=`${contextPath}/admin/notice/write`">작성</button>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${not empty noticeList or not empty topList}">
							<table class="notice-table" id="noticeList">
								<tr>
									<td class="n-t-th">번호</td>
									<td class="n-t-th">제목</td>
									<td class="n-t-th">작성자</td>
									<td class="n-t-th">등록일</td>
									<td class="n-t-th">최근수정일</td>
									<td class="n-t-th">관리</td>
								</tr>
								<c:forEach var="top" items="${topList}">
									<tr class="notice-item" data-label="${top.nNo}">
										<td class="n-t-td">고정</td>
										<td class="n-t-td">${top.title}</td>
										<td class="n-t-td">${top.uNm}</td>
										<td class="n-t-td">${top.nCreated}</td>
										<td class="n-t-td">${top.nUpdated != null ? top.nUpdated : ''}</td>
										<td class="n-t-td">
											<button class="n-update" onclick="updateNotice(${top.nNo})">수정</button>
											<button class="n-delete" onclick="deleteNotice(${top.nNo})">삭제</button>
										</td>
									</tr>
								</c:forEach>
								<c:forEach var="notice" items="${noticeList}">
									<tr class="notice-item" data-label="${notice.nNo}">
										<td class="n-t-td">${notice.nNo}</td>
										<td class="n-t-td">${notice.title}</td>
										<td class="n-t-td">${notice.uNm}</td>
										<td class="n-t-td">${notice.nCreated}</td>
										<td class="n-t-td">${notice.nUpdated != null ? notice.nUpdated : ''}</td>
										<td class="n-t-td">
											<button class="n-update"
												onclick="updateNotice(${notice.nNo})">수정</button>
											<button class="n-delete"
												onclick="deleteNotice(${notice.nNo})">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<div class="no-data" id="noDataList">
								<div class="icon">
									<i class="fa-solid fa-circle-exclamation"></i>
								</div>
								<div>작성된 공지사항이 없습니다.</div>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="no-data" id="noSearchList" style="display: none">
						<div class="icon">
							<i class="fa-solid fa-circle-exclamation"></i>
						</div>
						<div>검색결과가 없습니다.</div>
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
										onclick="cancelDel()">취소</button>
									<button id="del" data-label=""
										class="modal-btn-right modal-btn" onclick="confirmDel()">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 페이지네이션 -->
					<c:if test="${not empty noticeList}">
						<div class="diary-footer">
							<div class="pagination" id="pagination">
								<!-- 이전 버튼 -->
								<c:if test="${pageInfo.curPage > 1}">
									<button
										onclick="renderList(${pageInfo.curPage-1})">&lt;</button>
								</c:if>

								<!-- 페이지 번호 반복 -->
								<c:forEach var="pageNum" begin="${pageInfo.startPage}"
									end="${pageInfo.endPage}">
									<c:if test="${pageNum <= pageInfo.allPage}">
										<button class="${pageNum == pageInfo.curPage ? 'active' : ''}"
											onclick="renderList(${pageNum})">
											${pageNum}</button>
									</c:if>
								</c:forEach>

								<!-- 다음 버튼 -->
								<c:if test="${pageInfo.curPage < pageInfo.endPage}">

									<button
										onclick="renderList${pageInfo.curPage+1}">
										&gt;</button>
								</c:if>
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<%-- 			<jsp:include page="../footer.html"></jsp:include> --%>
		</div>
	</div>

	<c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>

</body>
</html>