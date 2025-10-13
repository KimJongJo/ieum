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
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,600,0,0&icon_names=local_hospital" />
<link rel="stylesheet" href="${contextPath}/css/modal.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath }/myPage/css/resList.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/footer.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>resList</title>
</head>
<body>
	<c:import url="/common/header/header.jsp" charEncoding="UTF-8" />
	
	<!-- Section Title -->
    <div id="section-title">
        <span>예약 내역</span>
    </div>
    
	<div class="myPage">
		<jsp:include page="/common/nav/userNav.html" />
		<div class="container1">
			<div class="comres">
				<div class="comhead">
					<table class="come">
						<tr>
							<td class="t4">다가오는 예약</td>
							<td class="tq"><c:out value="${comResCnt }" /></td>
						</tr>
					</table>
					<div class="moveIcon">
						<button type="button" class="move1" id="moveLeft">
							<i class="fa-solid fa-chevron-left"></i>
						</button>
						<button type="button" class="move1" id="moveRight">
							<i class="fa-solid fa-chevron-right"></i>
						</button>
					</div>
				</div>

				<div class="carousel-wrapper">
					<div class="carousel-container" id="hospitalCarousel">

						<c:choose>
							<c:when test="${not empty comRes }">
								<c:forEach var="comResList" items="${comRes }">
									<div class="list-center">
										<div class="list1" data-rno="${comResList.rNo }"
											data-rstatus="${comResList.rStatus }"
											data-hno="${comResList.hNo }">

											<div class="l1">
												<div class="d">
													<table class="date">
														<tr>
															<td class="blue"><c:out value="${comResList.rDate }" /></td>
															<td class="blue"><c:out value="${comResList.rDay }" /></td>
															<td class="blue"><c:out value="${comResList.rTime }" /></td>
														</tr>
													</table>
													<div class="dday">
														<div class="dd">
															<c:choose>
																<c:when test="${comResList.dDay > 0 }">
																D-${comResList.dDay }
															</c:when>
																<c:when test="${comResList.dDay == 0 }">D-Day</c:when>
															</c:choose>
														</div>
													</div>
												</div>
												<div class="star" data-hno="${comResList.hNo }">
													<button type="button"
														class="fav-btn ${comResList.favorite ? 'active' : ''}">
														<div class="i">
															<i class="fa${comResList.favorite ? 's' : 'r'} fa-star"></i>
														</div>
													</button>
												</div>
											</div>

											<div class="l2">

												<div class="left">
													<table class="t">
														<tr>
															<td class="hi"><span class="hosIcon"> <i
																	class="fa-regular fa-calendar-plus"></i></span></td>
															<td class="hname"><c:out value="${comResList.hNm }" /></td>
														</tr>
													</table>
													<table class="t2">
														<tr>
															<td class="line"></td>
															<td class="dname"><c:out
																	value="${comResList.username }" /> <span>상담사</span></td>
															<td class="coun">첫번째 상담</td>
														</tr>
													</table>
												</div>
												<div class="right">
													<button class="lbt-cancel" type="button">
														<span class="lbt1">예약취소</span>
														<div class="lbt2">
															<i class="fa-solid fa-rectangle-xmark"></i>
														</div>
													</button>
													<button class="lbt" type="button">
														<span class="lbt1">예약변경</span>
														<div class="lbt2">
															<i class="fa-solid fa-pen-to-square"></i>
														</div>
													</button>
													<button class="lbtb" type="button" id="comResdetail">
														<span class="lbt3">예약확인</span>
														<div class="lbt4">
															<i class="fa-solid fa-list"></i>
														</div>
													</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="list3">
									<div class="no">
										<div class="icon2">
											<i class="fa-solid fa-circle-exclamation"></i>
										</div>
										<span class="t2">다가오는 예약이 없습니다.</span>
									</div>
									<div>
										<button class="btn-cir-w">예약하러 가기</button>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>

			<div class="searchbar">
				<div class="rechead">
					<table class="rec">
						<tr>
							<td class="t1">지난 예약</td>
							<td class="tq1"><c:out value="${recResCnt }" /></td>
						</tr>
					</table>
				</div>

				<div class="sbox">
					<table class="fil">
						<tr>
							<td><span class="t3">기간선택</span></td>
							<td><select class="month" name="sort" id="sort">
									<option value="" selected>전체</option>
									<option value="3">3개월</option>
									<option value="6">6개월</option>
									<option value="12">12개월</option>
							</select></td>
							<td>
								<div class="search-box">
									<div class="i">
										<i class="fa-solid fa-magnifying-glass"></i>
									</div>
									<input type="text" name="keyword" id="keyword"
										class="search-txt" placeholder="">
								</div>
							</td>
							<td><button class="btn-cir-w" type="button" id="searchBtn">조회</button></td>
						</tr>
					</table>
				</div>
			</div>

			<div id="recResList-container"></div>

			<div class="page-div">
				<div class="pagination" id="pagination"></div>
			</div>

		</div>

		<!-- 예약취소 모달 -->
		<div class="modal-main-div" id="deleteRes" style="display: none;">
			<div class="modal-div-over">
				<div class="modal-header-div">
					<span class="modal-header-div-span">알림</span>
					<button type="button" class="x-button" id="xBtn">
						<i class="fa-solid fa-x x-btn"></i>
					</button>
				</div>
				<div class="modal-content-div">
					<span class="modal-content-div-span">예약을 취소하시겠습니까?</span>
				</div>
				<div class="modal-div-under">
					<div class="modal-btn-div">
					<button type="button" class="modal-btn-right modal-btn"
							id="modalCancelRes">취소하기</button>
						<button type="button" class="modal-btn-left modal-btn"
							id="modalKeepRes">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/common/footer/footer.html" charEncoding="UTF-8" />
	<script src="${contextPath }/myPage/js/resList.js"></script>
</body>
</html>