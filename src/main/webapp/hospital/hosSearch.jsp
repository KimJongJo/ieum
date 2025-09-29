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
<script src="https://kit.fontawesome.com/8d48045bdd.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/hospital/css/hosSearch.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>hosSearch</title>
</head>
<body>
<header>

</header>
	<div class="container">
		<div class="filter">
			<div class="search-bar">
				<div class="mt">검색</div>
				<form class="search-box" name="keyword" action="/hospital/search" method="post">
					<input class="search-txt" name="" placeholder="병원명으로 검색">
					<button class="search-btn" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>

			<div class="line"></div>

			<form class="select" name="hosfilter" action="/hospital/search" method="get">
			<div class="category">
				<div class="ct">
					<div class="mt2">유형</div>
					<button class="refresh">
						<div class="reicon">
							<i class="fa-solid fa-rotate-right"></i>
						</div>
						<span class="mt3">초기화</span>
					</button>
				</div>
				
					<div class="hcs">
						<div class="hcs2">
							<div class="allhc">
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="1"> 종합병원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="2"> 상급종합병원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="3"> 정신요양시설</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="4"> 자살예방센터</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="5"> 정신재활시설</label>
								</div>
							</div>

							<div class="allhc2">
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="6"> 국립</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="7"> 의원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="8"> 공립</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="9"> 병원</label>
								</div>
								<div class="la">
									<label class="h_ca"><input type="checkbox" id="hc"
										name="hc" value="10"> 보건소</label>
								</div>
							</div>
						</div>

						<div class="allhc3">
							<div class="la">
								<label class="h_ca"><input type="checkbox" id="hc"
									name="hc" value="11"> 중독통합관리 지원센터</label>
							</div>
							<div class="la">
								<label class="h_ca"><input type="checkbox" id="hc"
									name="hc" value="12"> 광역정신건강 복지센터</label>
							</div>
							<div class="la">
								<label class="h_ca"><input type="checkbox" id="hc"
									name="hc" value="13"> 기초정신건강 복지센터</label>
							</div>
						</div>

					</div>

			</div>
			</form>

			<div class="line"></div>

			<div class="location">
				<div class="mt2">지역</div>
				<form class="location" action="" method="post">
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
			
<!--  			<a href="${contextPath}/hospital/detail">
				<div class="list-box">
					<div class="right3">
						<img class="hosf" src="" />
						<div class="infodetail">
							<div class="hos-category">${h.categoryName }</div>
							<div class="hos-name">${h.hNm }</div>
							<div class="hos-loca">
								<div class="icon3">
									<i class="fa-solid fa-bus"></i>
								</div>
								${h.transferInfo }
							</div>
						</div>
					</div>
					<div class="fav">
						<i class="fa-regular fa-star"></i>
					</div>
				</div>
			</a>
-->
			
	</div>
	<footer>

	</footer>
	<script src="${contextPath }/hospital/js/hosSearch.js"></script>
</body>
</html>