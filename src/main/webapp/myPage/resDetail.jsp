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
<link rel="stylesheet" href="${contextPath}/css/modal.css" />
<link rel="stylesheet" href="${contextPath }/myPage/css/resDetail.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/footer.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>resDetail</title>
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
			<div class="rescom" data-rno="${rid.rNo }">
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

							<div class="timeTable">
								<table class="date">
									<tr>
										<td class="t71"><c:out value="${rid.rDate }" /></td>
										<td class="t71"><c:out value="${rid.rDay }" /></td>
										<td class="t71"><c:out value="${rid.rTime }" /></td>
									</tr>
								</table>
							</div>
						</div>

						<div class="right" data-rno="${rid.rNo }" data-hno="${rid.hNo }">
							<c:if test="${rid.rStatus eq 'WAITING' }">
								<button class="btn-cir-w" type="button" id="updateBtn">예약변경</button>
								<button class="btn-cir-w" type="button" id="cancelBtn">예약취소</button>
							</c:if>
						</div>
					</div>

					<div class="line"></div>

					<div class="docbox" >
					<div class="docprof">
						<img class="image-thumbnail"
							src="${contextPath }/${rid.filePath }/${rid.fileName}"
							onerror="this.onerror=null; this.src='';" /></div>

						<div class="info">
							<div class="doci">
								<span class="dname"> <c:out value="${rid.username }" />
								</span>
								<p class="intro">
									<c:out value="${rid.introduction }" default="믿음을 주는 상담사" />
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
							${rid.rContent }
						</div>
					</div>


					<div class="map">
						<span class="t2">오시는 길</span>
						<div class="map-sec" id="map"></div>
						<!-- 카카오맵 -->
						<script
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&autoload=false"></script>
						<script>
							kakao.maps
									.load(function() {
										var lat = parseFloat('${rid.hLocationY}');
										var lng = parseFloat('${rid.hLocationX}');

										var container = document
												.getElementById('map');
										var options = {
											center : new kakao.maps.LatLng(lat,
													lng),
											level : 3
										};

										var map = new kakao.maps.Map(container,
												options);

										var markerPosition = new kakao.maps.LatLng(
												lat, lng);
										var marker = new kakao.maps.Marker({
											position : markerPosition
										});

										marker.setMap(map);
									});
						</script>
					</div>

					<div class="hosinf" data-hno="${rid.hNo }">
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
							<button class="btn-cir-w" type="button" id="goHosdetail">
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
	<script src="${contextPath }/myPage/js/resDetail.js"></script>
</body>
</html>