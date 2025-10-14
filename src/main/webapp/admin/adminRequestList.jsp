<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="https://kit.fontawesome.com/b5ec955390.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/admin.css" />
<link rel="stylesheet" href="./css/adminNav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/adminIndexFooter.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	// HTML 페이지에서 선언, JSP에서 EL 치환됨
	const contextPath = "${pageContext.request.contextPath}";
	let curPage = $
	{
		listDto.curPage
	};
	let allPage = $
	{
		listDto.allPage
	};
	let curKeyword = ""; // 현재 검색어
	let filter = "none"; // 정렬 기준 초기값
</script>
<script src="./js/hosDetailModal.js"></script>



</head>
<body>
	<c:import url="/common/header/header.jsp" charEncoding="UTF-8" />
	<div class="main">
		<div class="main-div">
			<!-- 아래 -->
			<div class="under-section">
				<!-- 네비 들어올 곳 -->
				<%-- 				<jsp:include page="../common/nav/adminNav.html"></jsp:include> --%>
				<jsp:include page="../common/nav/nav.jsp"></jsp:include>
				<div class="info">
					<div class="search-name">
						<span class="search-name-span">병원 신청 목록</span>
					</div>
					<div class="admin-search-bar">
						<input type="text" placeholder="검색" class="search-bar-input"
							id="searchKeyword" />
						<button class="search-bar-icon" type="button" id="searchBtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>

						<select name="selectFilter" id="selectFilter"
							class="search-select">
							<option value="none">정렬</option>
							<option value="h_nm">병원명</option>
							<option value="created_young">신청일(최신순)</option>
							<option value="created_old">신청일(오래된순)</option>
						</select>
					</div>
					<div class="table-div">
						<table class="table" id="tableSetting">
							<thead>
								<tr>
									<th style="width: 70px">신청번호</th>
									<th style="width: 255px">병원명</th>
									<th>주소</th>
									<th style="width: 150px">병원 전화번호</th>
									<th style="width: 100px">신청일</th>
									<th style="width: 100px">확인</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty listDto.list}">
										<tr>
											<td colspan="6">현재 신청등록된 병원이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="hos" items="${listDto.list}">
											<tr>
												<td>${hos.hNo}</td>
												<td>${hos.hNm}</td>
												<td>${hos.hAddress}</td>
												<td>${hos.hTel}</td>
												<td>${hos.hCreated}</td>
												<td>
													<button value="${hos.hNo}" class="info-btn">정보</button>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>

						</table>
					</div>
					<c:if test="${not empty listDto.list}">
						<div class="page-div">
							<button class="page previous" type="button">
								<i class="fa-solid fa-angle-left"></i>
							</button>
							<!-- 페이지 번호 반복 -->
							<c:forEach var="i" begin="${listDto.startPage}"
								end="${listDto.endPage}">
								<c:choose>
									<c:when test="${i == listDto.curPage}">
										<button value="${i}" class="cur-page" type="button">${i}</button>
									</c:when>
									<c:otherwise>
										<button value="${i}" class="page move-page" type="button">${i}</button>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<button class="page next-page" type="button">
								<i class="fa-solid fa-angle-right"></i>
							</button>
						</div>
					</c:if>
					<div class="modal-hospital-detail" id="modal-hospital-detail">
						<div class="hospital">
							<div class="hospital-header">
								<i class="fa-solid fa-xmark"></i>
							</div>
							<div class="hospital-name-div">
								<span class="hospital-name"> 신청 병원 정보 조회 </span>
							</div>
							<div class="modal-content">
								<table class="hospital-table">
									<tr>
										<th>병원명</th>
										<td class="hospital-info" id="hosName"></td>
									</tr>
									<tr>
										<th>신청자</th>
										<td class="hospital-info" id="requestName"></td>
									</tr>
									<tr>
										<th>신청자 전화번호</th>
										<td class="hospital-info" id="reqeustTel"></td>
									</tr>
									<tr>
										<th>신청자 이메일</th>
										<td class="hospital-info" id="requestEmail"></td>
									</tr>
									<tr>
										<th>병원주소</th>
										<td class="hospital-info" id="hosAddress"></td>
									</tr>
									<tr>
										<th>사업자번호</th>
										<td class="hospital-info" id="reNo"></td>
									</tr>
								</table>
								<div class="pdf-div">
									<div class="Busi-img">
										<iframe id="pdf-frame" class="pdf-iframe"></iframe>
									</div>
								</div>
							</div>

							<div class="hospital-btn-div">
								<button class="hospital-btn-delete " id="delHos">거부</button>
								<button class="hospital-btn-update" id="addHos">승인</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<c:import url="/common/footer/footer.html" charEncoding="UTF-8" />
	<!-- 		<script src="adminNav.js"></script>
        <script src="adminModal.js"></script> -->

</body>
</html>
