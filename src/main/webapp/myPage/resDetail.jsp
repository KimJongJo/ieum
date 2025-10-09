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
<link rel="stylesheet" href="${contextPath }/myPage/css/resDetail.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<title>resDetail</title>
</head>
<body>
	<jsp:include page="/common/header/header.html" />
	<div class="myPage">
		<jsp:include page="/common/nav/userNav.html" />
		<div class="container1">
			<div class="rescom">
			<div class="head-box">
				<table class="t1">
					<tr>
						<td><div class="ticon">
						<i class="fa-solid fa-circle-check"></i>
						</div></td>
						<td class="t1"><c:out value="${statusStr }" /></td>
						<td class="tq">no.<c:out value="${rid.rNo }" /></td>
					</tr>
				</table>
				</div>

				<div class="white-box">
					<div class="hos-date">
						<div class="left">
							<div class="hos-in">
								<table class="hos-name">
									<tr>
										<td class="t21"><c:out value="${rid.hNm }" /></td>
									</tr>
								</table>
								<c:if test="${rid.rStatus eq 'WAITING' }">
									<div class="dday">
										<div class="dd">
											<c:choose>
												<c:when test="${rid.dDay > 0 }">
																D-${rid.dDay }
															</c:when>
												<c:when test="${rid.dDay == 0 }">D-Day</c:when>
											</c:choose>
										</div>
									</div>
								</c:if>
							</div>

							<table class="date">
								<tr>
									<td class="t71"><c:out value="${rid.rDate }" /></td>
									<td class="t71"><c:out value="${rid.rDay }" /></td>
									<td class="t71"><c:out value="${rid.rTime }" /></td>
								</tr>
							</table>
						</div>

						<div class="right">
							<c:if test="${rid.rStatus eq 'WAITING' }">
								<button class="btn-cir-w" type="button">예약변경</button>
								<button class="btn-cir-w" type="button">예약취소</button>
							</c:if>
						</div>
					</div>

					<div class="line"></div>

					<div class="docbox">
						<img class="docprof" src="" />

						<div class="info">
							<div class="doci">
								<span class="dname"> <c:out value="${rid.username }" />
								</span>
								<p class="intro">
									<c:out value="${rid.introduction }" />
								</p>
							</div>
							<span class="major"> <c:out value="${rid.major }" />
							</span>
						</div>
					</div>

					<div class="painfo">
						<span class="t2">예약자 정보</span> <span class="pname"> <c:out
								value="${actName }" />
						</span> <span class="ptel"> <c:out value="${actTel }" />
						</span>

					</div>
					<div class="line"></div>

					<div class="councon">
						<span class="t2">상담내용</span>
						<div class="counbox">
							<c:out value="${rid.rContent }" />
						</div>
					</div>


					<div class="map">
						<span class="t2">오시는 길</span>
						<div class="counbox1"></div>

					</div>

					<div class="hosinf">
						<div class="left1">
							<div class="hinfo">
								<div class="detail">
									<table class="hinfotable">
										<!-- border는 테두리 표시 -->
										<tbody>
											<tr>
												<td class="icon"><i class="fa-solid fa-location-dot"></i></td>
												<td><span class="etc1"> <c:out
															value="${rid.hNm }" />
												</span></td>
											</tr>
											<tr>
												<td class="icon"></td>
												<td><span class="etc"> <c:out
															value="${rid.hAddress }" />
												</span></td>
											</tr>
											<tr>
												<td class="icon"></td>
												<td><span class="etc"> <c:out
															value="${rid.transferInfo }" />
												</span></td>
											</tr>

											<tr>
												<td class="icon"><i class="fa-solid fa-phone"></i></td>
												<td class="ex"><span class="etc2"> <c:out
															value="${rid.hTel }" />
												</span></td>
											</tr>
											<tr>
												<td class="icon"><i class="fa-solid fa-square-parking"></i></td>
												<td><span class="etc1">주차가능</span></td>
											</tr>
											<tr>
												<td class="icon"></td>
												<td><span class="etc"> <c:out
															value="${rid.services }" />
												</span></td>
											</tr>

										</tbody>
									</table>
								</div>

							</div>
						</div>
						<div class="right1">
							<button class="btn-cir-w" type="button">
								<div class="icon2">
									<i class="fa-solid fa-square-h"></i>
								</div>
								병원상세
							</button>
						</div>

					</div>

				</div>

			</div>
			<div class="btn">
				<button type="button" class="btn-rec-w" onclick="history.back();">확인</button>
			</div>
		</div>
	</div>
	<script src="${contextPath }/myPage/js/resDetail.js"></script>
</body>
</html>