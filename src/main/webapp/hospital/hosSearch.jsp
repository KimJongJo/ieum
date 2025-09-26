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
<link rel="stylesheet" href="${contextPath}/hospital/css/hosSearch.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>hosSearch</title>
</head>
<body>
	<div class="container">
		<div class="filter">
			<div class="search-bar">
				<div class="mt">검색</div>
				<form class="search-box" action="" method="get">
					<input class="search-txt" name="" placeholder="병원명으로 검색">
					<button class="search-btn" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>

			<div class="line"></div>

			<div class="category">
				<div class="ct">
					<div class="mt2">유형</div>
					<button class="refresh" type="reset">
						<div class="reicon">
							<i class="fa-solid fa-rotate-right"></i>
						</div>
						<span class="mt3">초기화</span>
					</button>
				</div>

				<form class="select" action="" method="get">
					<div class="hcs">
						<div class="hcs2">
							<div class="allhc">
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 종합병원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 상급종합병원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 정신요양시설</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 자살예방센터</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 정신재활시설</label>
								</div>
							</div>

							<div class="allhc2">
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 국립</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 의원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 공립</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 병원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value=""> 보건소</label>
								</div>
							</div>
						</div>

						<div class="allhc3">
							<div class="la">
								<label class="h_ca"><input type="checkbox" id="hc"
									name="hc" value=""> 중독통합관리 지원센터</label>
							</div>
							<div class="la">
								<label class="h_ca"><input type="checkbox" id="hc"
									name="hc" value=""> 광역정신건강 복지센터</label>
							</div>
							<div class="la">
								<label class="h_ca"><input type="checkbox" id="hc"
									name="hc" value=""> 기초정신건강 복지센터</label>
							</div>
						</div>

					</div>
				</form>

			</div>

			<div class="line"></div>

			<div class="location">
				<div class="mt2">지역</div>
				<form class="location" action="" method="get">
					<label for="city"></label><select id="city" class="ci">
						<option value="" >시·도</option>
					</select> <label for="gungu"></label><select id="gungu" class="sigun">
						<option value="" >시·군·구</option>
					</select>
				</form>
			</div>

		</div>

		<div class="right-side">
			<div class="s-header">
				<table class="sea">
					<tr>
						<td class="st1">'서울'</td>
						<td class="st">검색결과,</td>
						<td class="st1">'1,192'</td>
						<td class="st">개</td>
					</tr>
				</table>
			</div>
			
			<a href="${contextPath}/hospital/detail">
				<div class="list-box">
					<div class="right3">
						<img class="hosf" src="" />
						<div class="infodetail">
							<div class="hos-category">기초정신건강복지센터</div>
							<div class="hos-name">구로보건소</div>
							<div class="hos-loca">
								<div class="icon3">
									<i class="fa-solid fa-bus"></i>
								</div>
								구로역 1번출구
							</div>
						</div>
					</div>
					<div class="fav">
						<i class="fa-regular fa-star"></i>
					</div>
				</div>
			</a>

			<div class="list-box">

				<div class="right3">
					<img class="hosf" src="" />
					<div class="infodetail">
						<div class="hos-category">기초정신건강복지센터</div>
						<div class="hos-name">구로보건소</div>
						<div class="hos-loca">
							<div class="icon3">
								<i class="fa-solid fa-bus"></i>
							</div>
							구로역 1번출구
						</div>
					</div>
				</div>
				<div class="fav">
					<i class="fa-regular fa-star"></i>
				</div>

			</div>

			<div class="list-box">

				<div class="right3">
					<img class="hosf" src="" />
					<div class="infodetail">
						<div class="hos-category">기초정신건강복지센터</div>
						<div class="hos-name">구로보건소</div>
						<div class="hos-loca">
							<div class="icon3">
								<i class="fa-solid fa-bus"></i>
							</div>
							구로역 1번출구
						</div>
					</div>
				</div>
				<div class="fav">
					<i class="fa-regular fa-star"></i>
				</div>

			</div>

			<div class="list-box">

				<div class="right3">
					<img class="hosf" src="" />
					<div class="infodetail">
						<div class="hos-category">기초정신건강복지센터</div>
						<div class="hos-name">구로보건소</div>
						<div class="hos-loca">
							<div class="icon3">
								<i class="fa-solid fa-bus"></i>
							</div>
							구로역 1번출구
						</div>
					</div>
				</div>
				<div class="fav">
					<i class="fa-regular fa-star"></i>
				</div>

			</div>
		</div>
	</div>
	<script src="${contextPath }/hospital/js/hosSearch.js"></script>
</body>
</html>