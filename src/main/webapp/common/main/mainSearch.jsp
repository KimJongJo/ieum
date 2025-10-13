<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/common/main/css/search.css">
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<title>건강이음 - 메인 검색 결과</title>
<script src="${contextPath}/common/main/js/search.js"></script>
</head>
<body>
	<header>
		<c:import url="/common/header/header.jsp" charEncoding="UTF-8" />
	</header>
	<div class="search-container">
		<div class="search-box">
			<input class="search-input" id="searchInput"
				placeholder="입력하신 키워드는 공지사항 커뮤니티에서 검색됩니다." value="${keyword }">
			<button class="search-btn" id="searchBtn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</div>

		<div class="tabs">
			<div class="tab active">통합검색</div>
			<div class="tab">공지사항</div>
			<div class="tab">커뮤니티</div>
		</div>
		<div class="search-section">
			<div class="section-header">
				<div>
					<span class="keyword">${keyword}</span>에 대한 검색결과 <span id="all-cnt"
						class="cnt">${allCnt}</span> 건
				</div>
			</div>


			<div class="notices-section">
				<div class="section-subtitle">
					공지사항
					<div id="notice-cnt" class="cnt">${noticeCnt}</div>
					건
				</div>
				<c:choose>
					<c:when test="${ not empty noticeList }">
						<div class="notices-item-section">
							<c:forEach var="notice" items="${noticeList}">
								<div class="result-item" onclick="goNoticeDetail(${notice.nNo})">
									<div class="result result-title">${notice.title}</div>
									<div class="result result-content">${notice.content}</div>
									<div class="result result-date">${notice.nCreated}</div>
								</div>
							</c:forEach>
							<div class="button-wrapper">
								<button class="btn-cir-b"
									onclick="location.href='${contextPath}/notice?page=1&keyword=${keyword}'">더보기</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="no-data-section">
							<div class="result-item">
								<div class="icon">
									<i class="fa-solid fa-circle-exclamation"></i>
								</div>
								<div>공지사항 검색결과가 없습니다.</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>


			<div class="community-section">
				<div class="section-subtitle">
					커뮤니티
					<div id="commu-cnt" class="cnt">${commuCnt}</div>
					건
				</div>
				<c:choose>
					<c:when test="${ not empty commuList }">
						<div class="community-item-section">
							<c:forEach var="commu" items="${commuList}">
								<div class="result-item"
									onclick="goCommuDetail(${commu.commuNo})">
									<div class="result result-title">${commu.commuTitle }</div>
									<div class="result result-content">${commu.commuContent }</div>
									<div class="result result-date">${commu.commuCreated }</div>
								</div>
							</c:forEach>
							<div class="button-wrapper">
								<button class="btn-cir-b"
									onclick="location.href='${contextPath}/allComList'">더보기</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="no-data-section">
							<div class="result-item">
								<div class="icon">
									<i class="fa-solid fa-circle-exclamation"></i>
								</div>
								<div>커뮤니티 검색결과가 없습니다.</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<c:import url="/common/footer/footer.html" charEncoding="UTF-8" />
</body>
</body>
</html>