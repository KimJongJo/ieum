<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
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
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,600,0,0&icon_names=local_hospital" />
<link rel="stylesheet" href="${contextPath}/myPage/css/hosFavorite.css" />
<title>hosFav</title>
<script src="${contextPath}/myPage/js/hosFav.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/common/header/header.jsp" />
	</header>
	<div class="section-title">
        <span>즐겨찾는 병원</span>
    </div>
	<div class="fav-container">
		<jsp:include page="/common/nav/nav.jsp" />
		<div class="container">
			<div id="hospitalList">
<%-- 				<c:when test="${not empty noticeList}"> --%>
<%-- 					<c:forEach var="fav" items="${favList}"> --%>

<!-- 						<div class="list-box"> -->
<!-- 							<div class="right3"> -->
<!-- 								<img class="hosf" -->
<%-- 									src="${contextPath}${fav.hosImgFilePath}${fav.hosImgFilePath}" /> --%>
<!-- 								<div class="infodetail"> -->
<%-- 									<div class="hos-category">${ fav.categoryName }</div> --%>
<%-- 									<div class="hos-name">${ fav.hNm }</div> --%>
<!-- 									<div class="hos-loca"> -->
<!-- 										<div class="icon3"> -->
<!-- 											<i class="fa-solid fa-bus"></i> -->
<!-- 										</div> -->
<%-- 										${fav.transferInfo} --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 							<div class="fav" onclick="delStar(${ fav.hFavNo })"> --%>
<!-- 								<i class="fa-solid fa-star"></i> -->
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
<%-- 				</c:when> --%>
			</div>
			<div class="btn-gap">
			<div id="goTop"></div>
			<div id="loadMore"></div>
			</div>
		</div>
	</div>
</body>
</html>