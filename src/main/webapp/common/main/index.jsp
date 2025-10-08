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
	href="${contextPath}/common/main/css/main.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<!-- FullCalendar Script -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<!-- 카카오 맵 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script>
<title>건강이음 - 메인</title>
<script src="${contextPath}/common/main/js/main.js"></script>
</head>
<body>
	<!-- 배너 -->
	<section class="banner-section">
		<img class="banner-img">
		<div class="search-box">
			<input class="search-input" id="searchInput"
				placeholder="입력하신 키워드는 공지사항 커뮤니티에서 검색됩니다.">
			<button class="search-btn" id="searchBtn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</div>
		<div class="button-wrapper">
			<a class="btn-link" href="${contextPath}/hospital/search">
				<div class="basic-btn">상담 예약 바로 가기 &gt;</div>
			</a> <a class="btn-link" href="${contextPath}/exam">
				<div class="primary-btn">자가 진단 바로 가기&gt;</div>
			</a>
		</div>
	</section>
	<div class="main-container">
		<div class="hospital-login-group">
			<!-- 병원추천 -->
			<section class="hospital-section">
				<span class="secton-title">이런 병원은 어떠세요?</span>
				<div class="hospital-btn-left">
					<div class="lt">
						<i class="fa-solid fa-less-than"></i>
					</div>
				</div>

				<div class="hospital-list">
					<c:forEach var="hospital" items="${hosList}">
						<div class="hospital-item" onclick="goHosDetail(${hospital.hNo})">
							<img class="hospital-img" src="${hospital.hosImgPath}"> <span
								class="hospital-name">${hospital.hNm}</span> <span>${hospital.hAddress}</span>
						</div>
					</c:forEach>
				</div>
				<div class="hospital-btn-right">
					<div class="gt">
						<i class="fa-solid fa-greater-than"></i>
					</div>
				</div>
			</section>
			<!-- 로그인 카드 -->

			<section class="login-secton">
				<c:choose>
					<c:when test="${uNo != null}">
						<!-- 로그인 후 -->
						<div class="login-header after">
							<div class="profile">
								<img class="circle" src="${userInfo.profilePath}"> <span
									class="btn-link">${userInfo.nickName}</span>
							</div>
							<a href="" class="btn-link">마이페이지</a>
						</div>
						<div class="login-body fc" id="fc"></div>
					</c:when>
					<c:otherwise>
						<!-- 로그인 전 -->
						<div class="login-header">
							<a href="${contextPath}/login" class="btn-link">로그인 / 회원가입</a>
						</div>
						<div class="login-body">
							<span class="login-title"> 자가진단 </span> <a
								href="${contextPath}/exam">
								<div class="plusBtn">
									<span>더보기</span>
									<div class="plusIcon">
										<i class="fa-solid fa-plus"></i>
									</div>
								</div>
							</a>
							<div class="login-content">
								<c:forEach var="diag" items="${diagCateList}">
									<div class="login-item"
										onclick="location.href=`${contextPath}/exam/examques`">
										<img class="rectangle" src="${diag.examImgPath }"></img> <span>${diag.examCate}</span>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</section>
		</div>

		<!-- 서비스 -->
		<section class="service-secton">
			<p class="secton-title service-title">
				<span>찾으시는</span> <span class="blue">서비스</span> <span>가 있나요?</span>
			</p>
			<div class="service-content">
				<div class="service-box">
					<a href="${contextPath}/hospital/search" class="btn-link">
						<div class="service item">
							<div class="rectangle reservation">
								<i class="fa-regular fa-calendar"></i>
							</div>
							<span>병원조회 / 예약</span>
						</div>
					</a> <a href="${contextPath}/hosSignUp1" class="btn-link">
						<div class="service item">
							<div class="rectangle hospital">
								<i class="fa-duotone fa-solid fa-hospital"></i>
							</div>
							<span>병원등록</span>
						</div>
					</a> <a href="${contextPath}/exam/examques" class="btn-link">
						<div class="service item">
							<div class="rectangle diagnosis">
								<i class="fa-duotone fa-solid fa-user-check"></i>
							</div>
							<span>자가진단</span>
						</div>
					</a> <a href="${contextPath}/allComList" class="btn-link">
						<div class="service item">
							<div class="rectangle commu">
								<i class="fa-duotone fa-solid fa-comments"></i>
							</div>
							<span>커뮤니티</span>
						</div>
					</a> <a href="${contextPath}/notice" class="btn-link">
						<div class="service item">
							<div class="rectangle notice">
								<i class="fa-duotone fa-solid fa-bullhorn"></i>
							</div>
							<span>공지사항</span>
						</div>
					</a>

				</div>
			</div>

		</section>
		<!-- 마음톡 -->
		<c:if test="${not empty commuList}">
			<section class="community-secton">
				<span class="section-title">마음톡 <a
					href="${contextPath}/allComList">
						<div class="plusBtn">
							<span>더보기</span>
							<div class="plusIcon">
								<i class="fa-solid fa-plus"></i>
							</div>
						</div>
				</a>
				</span>

				<div class="section-content commu-content">
					<c:forEach var="commu" items="${commuList}">
						<div class="commu-item"
							onclick="location.href=`${contextPath}/comDetail?no=${commu.commuNo}`">
							<span class="commu-cate">${commu.categoryName}</span> <span
								class="commu-title">${commu.commuTitle}</span> <span
								class="commu-content">${commu.commuContent}</span>
						</div>
					</c:forEach>
				</div>
			</section>
		</c:if>
		<!-- 공지사항 -->
		<c:if test="${not empty topNoticeList and not empty noticeList}">
			<section class="notice-secton">
				<span class="section-title">공지사항 <a
					href="${contextPath}/notice">
						<div class="plusBtn">
							<span>더보기</span>
							<div class="plusIcon">
								<i class="fa-solid fa-plus"></i>
							</div>
						</div>
				</a>
				</span>
				<div class="notice-content">
						<div class="top-notice">
							<span class="notice title">고정 공지사항</span>
							<div class="notice-box">
								<c:forEach var="top" items="${topNoticeList}">
									<div class="notice-item" onclick="goNoticeDetail(${top.nNo})">
										<div class="badge">고정</div>
										<div>${top.title}</div>
										<div class="date">${top.nCreated }</div>
									</div>
								</c:forEach>
							</div>

						</div>
						<div class="basic-notice">
							<span class="notice title">일반 공지사항</span>
							<div class="notice-box">
								<c:forEach var="notice" items="${noticeList}">
									<div class="notice-item"
										onclick="goNoticeDetail(${notice.nNo})">
										<div>${notice.title}</div>
										<div class="date">${notice.nCreated }</div>
									</div>
								</c:forEach>
							</div>
						</div>
				</div>
			</section>
		</c:if>
	</div>
	<!-- 지도 -->
	<section class="map-secton">
		<div class="map-left">
			<!-- 병원 선택 영역 -->
			<p class="direction-title">
				<span>건강마음 병원</span> <br> <span>찾아 오시는 길</span>
			</p>
			<p class="direction-sub-title">
				<span>각 병원의 주소와</span> <br> <span>운영시간을 확인하세요.</span>
			</p>
			<div class="choice-hospital-list" id="mapHosList">
			</div>
		</div>
		<!-- 지도 영역 -->
		<div class="map-right" id="map">
		</div>
	</section>
</body>
</html>