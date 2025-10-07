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
<link rel="stylesheet" href="${contextPath }/myPage/css/resList.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>resList</title>
</head>
<body>
	<jsp:include page="/common/header/header.html" />
	<div class="myPage">
		<jsp:include page="/common/nav/userNav.html" />
		<div class="container1">
			<div class="comres">
				<div class="comhead">
					<table class="come">
						<tr>
							<td class="t4">다가오는 예약</td>
							<td class="tq">1</td>
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
									<div class="list1">

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
													<span class="dd">D-6</span>
												</div>
											</div>
											<div class="star">
												<i class="fa-regular fa-star"></i>
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
												<button class="lbt" type="button">
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
												<button class="lbtb" type="button">
													<span class="lbt3">예약확인</span>
													<div class="lbt4">
														<i class="fa-solid fa-list"></i>
													</div>
												</button>
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
				<span class="t1">지난예약</span>
				<div class="sbox">
					<table class="fil">
						<tr>
							<td><span class="t3">기간선택</span></td>
							<td><select class="month" name="month">
									<option value="none">36개월</option>
									<option value="none">12개월</option>
									<option value="none">6개월</option>
									<option value="none">3개월</option>
							</select></td>
							<td>
								<form class="search-box" action="" method="get">
									<div class="i">
										<i class="fa-solid fa-magnifying-glass"></i>
									</div>
									<input class="search-txt" name="" placeholder="">
								</form>
							</td>
							<td><button class="s" type="submit">조회</button></td>
						</tr>
					</table>
				</div>
			</div>

			<c:choose>
				<c:when test="${not empty recRes }">
					<c:forEach var="recResList" items="${recRes }">
						<div class="list2">
							<div class="l3">
								<table class="date">
									<tr>
										<td class="gray"><c:out value="${recResList.rDate }" /></td>
										<td class="gray1"><c:out value="${recResList.rDay }" /></td>
									</tr>
								</table>
								<div class="star">
									<i class="fa-regular fa-star"></i>
								</div>
							</div>
							<div class="l4">

								<div class="left2">
									<table class="t">
										<tr>
											<td class="hi"><span class="hosIcon"> <i
													class="fa-regular fa-calendar-plus"></i></span></td>
											<td class="hname"><c:out value="${recResList.hNm }" /></td>
										</tr>
									</table>
									<table class="t2">
										<tr>
											<td class="line"></td>
											<td class="dname"><c:out value="${recResList.username }" />
												<span>상담사</span></td>
											<td class="coun">첫번째 상담</td>
										</tr>
									</table>
								</div>
								<div class="right2">
									<button class="btn-cir-w" type="button">다시예약</button>
									<button class="btn-cir-w" type="button">예약확인</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="list2">
						<div class="no">
							<div class="icon2">
								<i class="fa-solid fa-circle-exclamation"></i>
							</div>
							<span class="t2">지난 예약이 없습니다.</span>
						</div>
						<div>
							<button class="btn-cir-w">예약하러 가기</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script src="${contextPath }/myPage/resList.js"></script>
</body>
</html>