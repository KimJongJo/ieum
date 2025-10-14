<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/hospital/css/hosDetail.css">
<link rel="stylesheet" href="${contextPath}/css/header.css" />
<link rel="stylesheet" href="${contextPath}/css/footer.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/modal.css" />
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<title>hosDe-res</title>
</head>

<body>
<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
	<div class="container1">
		<div class="hh">
			<div class="hbt">
				<div class="hos-category">
					[
					<c:out value="${hosDetail.categoryName }" />
					]
				</div>
				<div class="hos-name">
					<c:out value="${hosDetail.hNm }" />
				</div>
			</div>
			<div class="share" data-hno="${hosDetail.hNo }">
				<button type="button"
					class="fav-btn ${hosDetail.favorite ? 'active' : ''}">
					<div class="i">
						<i class="fa${hosDetail.favorite ? 's' : 'r'} fa-star"></i>
					</div>
				</button>
				<button type="button" class="bt1" id="shareBtn">
					<div class="i">
						<i class="fa-regular fa-share-from-square"></i>
					</div>
				</button>
			</div>
		</div>
		<div class="hos-box">
			<form class="hos-box1" action="" method="get">

				<div class="hinfoa">

					<img src="${contextPath}/${hosDetail.filePath}${hosDetail.fileName}" class="file_no" />

					<div class="hinfor">
						<div class="hinfoh">
							<div class="hos-cate">
								[
								<c:out value="${hosDetail.categoryName }" />
								]
							</div>
							<div class="hos-na">
								<c:out value="${hosDetail.hNm }" />
							</div>

						</div>

						<div class="hinfo">
							<div class="detail">
								<table class="hinfotable">
									<!-- border는 테두리 표시 -->
									<tbody>
										<tr>
											<td class="icon"><i class="fa-solid fa-location-dot"></i></td>
											<td>
												<p class="etc">
													<c:out value="${hosDetail.hAddress }" />
												</p>
											</td>
										</tr>
										<tr>
											<td class="icon"><i class="fa-solid fa-bus"></i></td>
											<td>
												<p class="etc">
													<c:out value="${hosDetail.transferInfo }" />
												</p>
											</td>
										</tr>
										<tr>
											<td class="icon"><i class="fa-solid fa-clock"></i></td>
											<td>
												<p class="etc">
													<c:out value="${hosDetail.holidayInfo }" />
												</p>
											</td>
										</tr>
										<tr>
											<td class="icon"><i class="fa-solid fa-phone"></i></td>
											<td>
												<p class="etc">
													<c:out value="${hosDetail.hTel }" />
												</p>
											</td>
										</tr>
										<tr>
											<td class="icon"></td>
											<td><a href="#" class="etc"> <c:out
														value="${hosDetail.hLink }" /></a></td>
										</tr>
										<tr>
											<td class="icon"></td>
											<td>
												<p class="etc">
													<c:out value="${hosDetail.services }" />
												</p>
											</td>
										</tr>
										<tr>
											<td class="icon"></td>
											<td>
												<p class="etc"></p>
											</td>
										</tr>

									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="nav-box">
			<div class="nav-h3">
				<button class="navl active" data-target="hosdetail">
					<span>상세정보</span>
				</button>
				<button class="navr" data-target="reservation">
					<span>예약하기</span>
				</button>
			</div>
		</div>

		<div class="tab1 active" id="tab1">
			<div class="hosinft">
				<div class="mtitle">
					<span class="mtitle-span">병원소식</span>
				</div>
			</div>
			<div class="hos-info">
				<form class="hos-inf" action="" method="get">
					<div class="inf">
						<p class="p1">
							<c:out value="${hosDetail.newsTitle }" />
						</p>
						<span class="p2"> <c:out value="${hosDetail.newsContent }" />
						</span>
					</div>
				</form>
			</div>
			<div class="doctor-section">
				<div class="mtitle">상담사</div>
			</div>
			<div class="doctor-box">
				<c:forEach var="doctorlist" items="${docList}">
					<div class="dal">
						<img src="${contextPath}/${doctorlist.filePath}/${doctorlist.fileName}" class="doc-prof" />
						<div class="d1">
							<div class="d2">
								<p class="username">
									<c:out value="${doctorlist.username }" />
								</p>
								<div class="introduction">
									<c:out value="${doctorlist.introduction }" default="믿음을 주는 상담사" />
								</div>
							</div>
							<div class="d3">
								<p class="major">
									<c:out value="${doctorlist.major }" />
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="map">
				<div class="m1">
					<span class="mtitle">위치/교통</span>
				</div>
				<div class="m2">
					<div class="map-sec" id="map"></div>
					<!-- 카카오맵 -->
					<script
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&autoload=false"></script>
					<script>
						kakao.maps
								.load(function() {
									var lat = parseFloat('${hosDetail.hLocationY}');
									var lng = parseFloat('${hosDetail.hLocationX}');

									var container = document
											.getElementById('map');
									var options = {
										center : new kakao.maps.LatLng(lat, lng),
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
			</div>

			<div class="btn">
				<a href="${contextPath }/hospital/search">
					<button type="button" class="btn-rec-w">이전으로</button>
				</a>
				<button type="button" class="btn-long-b" id="resbtn">예약하기</button>
			</div>

		</div>

		<div class="tab2" id="tab2">
			<form id="resform" action="${contextPath }/reservation/content"
				method="post">
				<input type="hidden" name="action" value="doReservation">
				<div class="doctor-section">
					<div class="mtitle">상담예약</div>
				</div>
				<div class="mheader">
					<i class="fa-solid fa-user-doctor"></i> <span class="h">원하는
						상담사를 선택해주세요</span>
				</div>

				<div class="doctor-section">
					<div class="mtitle">상담사</div>
				</div>
				<input type="hidden" id="selectedMno" name="mNo">
				<div class="doctor-box">
					<c:forEach var="doctorlist" items="${docList}">
						<button class="dall" type="button" data-mno="${doctorlist.uNo}">
							<img src="${contextPath}/${doctorlist.filePath}/${doctorlist.fileName}"  class="doc-prof"
								onerror="this.onerror=null; this.src='';" />
							<div class="d1">
								<div class="d2">
									<p class="username">
										<c:out value="${doctorlist.username }" />
									</p>
									<div class="introduction">
										<c:out value="${doctorlist.introduction }"
											default="믿음을 주는 상담사" />
									</div>
								</div>
								<div class="d3">
									<p class="major">
										<c:out value="${doctorlist.major }" />
									</p>
								</div>
							</div>
						</button>
					</c:forEach>
				</div>

				<div class="tab3" id="tab3">
					<div class="mheader">
						<i class="fa-solid fa-calendar-days"></i> <span class="h">날짜와
							시간을 선택해 주세요</span>
					</div>

					<div class="select-date" data-rtime="${rTime }" data-rdate="${rDate }">

						<input type="hidden" id="selectedDate" name="rDate">
						<div class="calendar">
							<div class="date-header"></div>
							<div id="fc"></div>
						</div>

						<input type="hidden" id="selectedTime" name="rTime"> <input
							type="hidden" id="selectedDays" name="rDay">
						<div class="time-table" >
							<label class="cnb"><input type="checkbox" name="chojin"
								value="true" /> <span>이 병원에서 초진일 경우 체크</span> </label>
							<p class="day">오전</p>

							<button type="button" class="tb1" name="time" value="09:00">09:00</button>
							<button type="button" class="tb1" name="time" value="09:30">09:30</button>
							<button type="button" class="tb1" name="time" value="10:00">10:00</button>
							<button type="button" class="tb1" name="time" value="10:30">10:30</button>
							<button type="button" class="tb1" name="time" value="11:00">11:00</button>
							<button type="button" class="tb1" name="time" value="11:30">11:30</button>

							<p class="day">오후</p>

							<button type="button" class="tb1" name="time" value="13:00">1:00</button>
							<button type="button" class="tb1" name="time" value="13:30">1:30</button>
							<button type="button" class="tb1" name="time" value="14:00">2:00</button>
							<button type="button" class="tb1" name="time" value="14:30">2:30</button>
							<button type="button" class="tb1" name="time" value="15:00">3:00</button>
							<button type="button" class="tb1" name="time" value="15:30">3:30</button>
							<button type="button" class="tb1" name="time" value="16:00">4:00</button>
							<button type="button" class="tb1" name="time" value="16:30">4:30</button>
							<button type="button" class="tb1" name="time" value="17:00">5:00</button>
							<button type="button" class="tb1" name="time" value="17:30">5:30</button>

						</div>
					</div>
				</div>
				<div class="cont" id="rescont" data-rcontent="${rContent }">
					<div class="mhea">
						<i class="fa-solid fa-pen-to-square"></i> <span class="h">어떤
							주제의 상담이 필요하신가요?</span>
					</div>
					<input type="hidden" id="resContent" name="rContent">
					<div class="b">
						<textarea class="rc" id="rc" placeholder="상담 주제에 대해 메모해보세요!(최대200자)"
							spellcheck="false" maxlength="200"></textarea>
					</div>
				</div>


				<div class="btn">
					<a href="${contextPath }/hospital/search">
						<button type="button" class="btn-rec-w" id="resEnd">그만두기</button>
					</a>
					<button type="submit" class="btn-long-b" id="resAnd">다음으로</button>
				</div>
			</form>
		</div>

		<!-- 예약 로그인 모달 -->
		<div class="modal-main-div" id="modalResNeedLogin"
			style="display: none;">
			<div class="modal-div-over">
				<div class="modal-header-div">
					<span class="modal-header-div-span">알림</span>
					<button type="button" class="x-button" id="xBtn">
						<i class="fa-solid fa-x x-btn"></i>
					</button>
				</div>
				<div class="modal-content-div">
					<span class="modal-content-div-span">로그인 이후 이용 가능합니다.</span>
				</div>
				<div class="modal-div-under">
					<div class="modal-btn-div">
						<button type="button" class="modal-btn-left modal-btn"
							id="modalClose">닫기</button>
						<button type="button" class="modal-btn-right modal-btn"
							id="modalGoLogin">로그인</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
	<!-- 로그인 여부 확인 -->
	<script>
	let uNo = parseInt("<%=session.getAttribute("uNo") != null ? session.getAttribute("uNo") : 0%>", 10);
	</script>
	<script src="${contextPath}/hospital/js/hosDetail.js"></script>
	<script src="${contextPath}/hospital/js/favorite.js"></script>
</body>
</html>