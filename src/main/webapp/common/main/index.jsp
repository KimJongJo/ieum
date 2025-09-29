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
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<title>건강이음 - 메인</title>
<script src="${contextPath}/common/main/js/main.js"></script>
</head>
<body>
	<!-- 배너 -->
	<section class="banner-section">
		<img class="banner-img">
		<div class="search-box">
			<input class="search-input"
				placeholder="입력하신 키워드는 공지사항 커뮤니티에서 검색됩니다.">
			<button class="search-btn" type="submit">
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
			<!-- 					todo 하단 스크롤 미노출 & 하나씩 넘어가게 설정 -->
			<section class="hospital-section">
				<span class="secton-title">이런 병원은 어떠세요?</span>
				<div class="hospital-btn-left">
					<div class="lt">
						<i class="fa-solid fa-less-than"></i>
					</div>
				</div>

				<div class="hospital-list">
					<div class="hospital-item"
						onclick="location.href=`${contextPath}/hospital/detail`">
						<img class="hospital-img" src=""> <span
							class="hospital-name">병원명</span> <span>병원위치</span>
					</div>
					<div class="hospital-item">
						<img class="hospital-img" src=""> <span
							class="hospital-name">병원명</span> <span>병원위치</span>
					</div>
					<div class="hospital-item">
						<img class="hospital-img" src=""> <span
							class="hospital-name">병원명</span> <span>병원위치</span>
					</div>
					<div class="hospital-item">
						<img class="hospital-img" src=""> <span
							class="hospital-name">병원명</span> <span>병원위치</span>
					</div>
					<div class="hospital-item">
						<img class="hospital-img" src=""> <span
							class="hospital-name">병원명</span> <span>병원위치</span>
					</div>
					<div class="hospital-item">
						<img class="hospital-img" src=""> <span
							class="hospital-name">병원명</span> <span>병원위치</span>
					</div>
					<div class="hospital-item">
						<img class="hospital-img" src=""> <span
							class="hospital-name">병원명</span> <span>병원위치</span>
					</div>
					<!-- 					<div class="hospital-item"> -->
					<!-- 						<img class="hospital-img" src=""> <span -->
					<!-- 							class="hospital-name">병원명</span> <span>병원위치</span> -->
					<!-- 					</div> -->
				</div>
				<div class="hospital-btn-right">
					<div class="gt">
						<i class="fa-solid fa-greater-than"></i>
					</div>
				</div>
			</section>
			<!-- 로그인 카드 -->
			<!-- 로그인 전 -->
			<section class="login-secton">
				<div class="login-header">
					<a href="${contextPath}/login" class="btn-link">로그인 / 회원가입</a>
				</div>
				<div class="login-body">
					<span class="login-title"> 자가진단 </span>
					<div class="plusBtn">
					 <a href="${contextPath}/exam">
						<span>더보기</span>
							<div class="plusIcon">
								<i class="fa-solid fa-plus"></i>
							</div>
						

					</div></a>
					<div class="login-content">
						<div class="login-item"
							onclick="location.href=`${contextPath}/exam/examques`">
							<div class="rectangle"></div>
							<span>강박 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>공황 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>노인우울 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>정신 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>인지 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>강박 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>공황 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>노인우울 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>정신 장애</span>
						</div>
						<div class="login-item">
							<div class="rectangle"></div>
							<span>인지 장애</span>
						</div>
					</div>
				</div>
			</section>
			<!-- 로그인 후 -->
			<!-- <section class="login-secton">
                <div class="login-header after">
                    <div class="profile">
                        <img class="circle" src="">
                        <span class="btn-link">닉네임</span>
                    </div>
                    <a href="" class="btn-link">마이페이지</a>
                </div>
                <div class="login-body fc" id="fc"></div>
            </section> -->

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
							<div class="rectangle hospital">
								<i class="fa-duotone fa-solid fa-hospital"></i>
							</div>
							<span>병원조회 / 예약</span>
						</div>
					</a> <a href="${contextPath}/hosSignUp" class="btn-link">
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
					</a> <a href="${contextPath}/allCommunityList" class="btn-link">
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
		<section class="community-secton">
			<span class="section-title">마음톡 <a
				href="${contextPath}/allCommunityList">
					<div class="plusBtn">
						<span>더보기</span>
						<div class="plusIcon">
							<i class="fa-solid fa-plus"></i>
						</div>


					</div>
			</a>
			</span>

			<div class="section-content commu-content">

				<div class="commu-item"
					onclick="location.href=`${contextPath}/comDetail`">
					<span class="commu-cate">커뮤니티 카테고리</span> <span class="commu-title">마음톡
						제목</span> <span class="commu-content">마음톡 내용 마음톡 내용 마음톡 내용 마음톡
						내용마음톡 내용 마음톡 내용 마음톡 내용 마음톡 내용마음톡</span>
				</div>
				<div class="commu-item">
					<span class="commu-cate">커뮤니티 카테고리</span> <span class="commu-title">마음톡
						제목</span> <span class="commu-content">마음톡 내용 마음톡 내용 마음톡 내용 마음톡 내용</span>
				</div>
				<div class="commu-item">
					<span class="commu-cate">커뮤니티 카테고리</span> <span class="commu-title">마음톡
						제목</span> <span class="commu-content">마음톡 내용 마음톡 내용 마음톡 내용 마음톡 내용</span>
				</div>
			</div>
		</section>
		<!-- 공지사항 -->
		<section class="notice-secton">
			<span class="section-title">공지사항
				<div class="plusBtn">
					<span>더보기</span> <a href=""><div class="plusIcon">
							<i class="fa-solid fa-plus"></i>
						</div> </a>
				</div>
			</span>
			<div class="notice-content">
				<a class="btn-link" href="">
					<div class="top-notice">
						<span class="notice title">고정 공지사항</span>
						<div class="notice-box">
							<div class="notice-item">
								<div class="badge">고정</div>
								<div>파크 병원 휴진 공고</div>
								<div class="date">2025-09-08</div>
							</div>
							<div class="notice-item">
								<div class="badge">고정</div>
								<div>파크 병원 휴진 공고</div>
								<div class="date">2025-09-08</div>
							</div>
							<div class="notice-item">
								<div class="badge">고정</div>
								<div>파크 병원 휴진 공고</div>
								<div class="date">2025-09-08</div>
							</div>
						</div>

					</div>
				</a> <a class="btn-link" href="">
					<div class="basic-notice">
						<span class="notice title">일반 공지사항</span>
						<div class="notice-box">
							<div class="notice-item">
								<div>파크 병원 휴진 공고</div>
								<div class="date">2025-09-08</div>
							</div>
							<div class=" notice-item">
								<div>파크 병원 휴진 공고</div>
								<div class="date">2025-09-08</div>
							</div>
							<div class="notice-item">
								<div>파크 병원 휴진 공고</div>
								<div class="date">2025-09-08</div>
							</div>
						</div>

					</div>
				</a>

			</div>
		</section>
	</div>
	<!-- 지도 -->
	<section class="map-secton">
		<div class="map-left">
			<!-- 병원 선택 영역 -->
			<p class="direction-title">
				<span>건강마음 병원</span> <br> <span>찾아 오시는 길</span>
			</p>
			<p class="direction-sub-title">
				<span>각 보건소의 주소와</span> <br> <span>운영시간을 확인하세요.</span>
			</p>
			<div class="choice-hospital-list">
				<div class="choice-rectangle">구로보건소</div>
				<div class="choice-rectangle">구로보건소</div>
				<div class="choice-rectangle">구로보건소</div>

			</div>
		</div>
		<div class="map-right">
			<!-- 지도 영역 -->
			<div class="map">
				<!-- 지도 위 팝업 -->
				<div class="map-popup">
					<div class="map-hospital-info">
						<div class="title">구로보건소</div>
						<div class="tel">02-860-2600</div>
						<div class="map-text address">서울 구로구 구로 중앙로 28길 6</div>
						<div class="transfer">구로역 1번 출구에서 859m</div>
						<div>
							<div class="map-text">진료안내</div>
							<div class="map-text">월요일~금요일 : 오전9시~오후6시</div>
							<div class="map-text">점심시간 : 12시~오후1시</div>
							<div class="map-text red">토요일 및 공휴일 : 휴무</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
</body>
</html>