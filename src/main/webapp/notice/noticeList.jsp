<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 공지사항 목록</title>
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/notice/css/noticeList.css">
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/common/pagination/page.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/common/searchBox/search.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<script src="${contextPath}/notice/js/notice.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/common/header/header.jsp"></jsp:include>
	</header>

	<div class="notice-container">
		<div class="notice-header">
			<div class="notice-cnt" >
				전체 건수<span id="noticeCnt">${cnt}</span>건
			</div>
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
			</div>
		</div>

		<c:choose>
			<c:when test="${not empty noticeList or not empty topList}">
				<div class="list-section" id="noticeList">
					<c:forEach var="top" items="${topList}">
						<a href="${contextPath}/notice?nNo=${top.nNo}">
							<div class="notice-list">
								<c:set var="ext"
									value="${fn:toLowerCase(fn:substringAfter(top.fileName, '.'))}" />
								<c:choose>
									<c:when test="${ext == 'jpg' or ext == 'jpeg' or ext == 'png'}">
										<img class="notice-img"
											src="${contextPath}/${top.filePath}/${top.fileName}">
									</c:when>
									<c:otherwise>
										<img class="notice-img"
											src="${contextPath}/img/noticeDefault.png">
									</c:otherwise>
								</c:choose>
								<div class="notice-item">
									<div class="notice-title-row">
										<span class="notice-title">${top.title}</span>
										<div class="top-notice">공지</div>
									</div>
									<span class="notice-content content">${top.content}</span> <span
										class="notice-content date">게시일 ${top.nCreated}</span>
								</div>
							</div>
						</a>
					</c:forEach>
					<c:forEach var="notice" items="${noticeList}">
						<a href="${contextPath}/notice?nNo=${notice.nNo}">
							<div class="notice-list">
								<c:set var="ext"
									value="${fn:toLowerCase(fn:substringAfter(notice.fileName, '.'))}" />
								<c:choose>

									<c:when test="${ext == 'jpg' or ext == 'jpeg' or ext == 'png'}">
										<img class="notice-img"
											src="${contextPath}/${notice.filePath}/${notice.fileName}">
									</c:when>
									<c:otherwise>
										<img class="notice-img"
											src="${contextPath}/img/noticeDefault.png">
									</c:otherwise>
								</c:choose>
								<div class="notice-item">
									<div class="notice-title-row">
										<span class="notice-title">${notice.title}</span>
									</div>
									<span class="notice-content content">${notice.content}</span> <span
										class="notice-content date">게시일 ${notice.nCreated}</span>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
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

		<!-- 하단 영역 -->
		<!-- 페이지네이션 -->
		<c:if test="${not empty noticeList}">
			<div class="notice-footer">
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
							onclick="renderList(${pageInfo.curPage+1})">
							&gt;</button>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>
	</div>
</body>
</html>