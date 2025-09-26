<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- FullCalendar -->
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css"
	rel="stylesheet">
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/diaryList.css">
	
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- FullCalendar 스크립트 (Global build) -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<title>건강이음 - 다이어리 메인</title>
</head>
<body>
	<div class="diary-container">
		<div id="calendar"></div>
		<!-- 버튼 -->
		<div class="button-wrapper">
			<div class="notice-search">
				<input type="text">
				<button>
					검색
					<div class="search-icon">
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
				</button>
			</div>
			<select class="notice-select">
				<option selected disabled value="none">정렬</option>
				<option>최신순</option>
				<option>제목순</option>
			</select> <a class="btn-link" href="">
				<div class="basic-big-btn">작성</div>
			</a>
		</div>
		<table class="diary-list">
			<colgroup>
				<col style="width: 20%;">
				<col style="width: 65%">
				<col style="width: 10%;">
				<col style="width: 5%;">
			</colgroup>
			<thead>
				<tr>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>기분</th>
				</tr>
			</thead>
			<tbody>
				<a href="${contextPath}/myPage/diary">
				<tr class="diary-item">
					<td class="diary-title-row"><span class="diary-title">7월2일의
							기록7월2일의 기록7월2일의 기록7월2일의 기록7월2일의 기록7월2일의 기록</span></td>
					<td><span class="diary-txt">9월 6일 오전 10시경 상담을 받았다6일 오전
							10시경 상담을 받았다6일 오전 10시경 상담을 받았다</span></td>
					<td><span class="diary-content date">2022.07.02</span></td>
					<td class="happy-icon emoji"><i
						class="fa-regular fa-face-smile"></i></td>

				</tr>
				</a>
				<tr class="diary-item">
					<td class="diary-title-row"><span class="diary-title">7월2일의
							기록</span></td>
					<td class="diary-content">9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째
						상담이라 그런지 지난번보다 편안했다</td>
					<td class="diary-content date">2022.07.02</td>
					<td class="soso-icon emoji"><i class="fa-regular fa-face-meh"></i>
					</td>
				</tr>
				<tr class="diary-item">
					<td class="diary-title-row"><span class="diary-title">7월2일의
							기록\</span></td>
					<td class="diary-content">9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째
						상담이라 그런지 지난번보다 편안했다</td>
					<td class="diary-content date">2022.07.02</td>
					<td class="sad-icon emoji"><i class="fa-regular fa-face-frown"></i>
					</td>
				</tr>
				<tr class="diary-item">
					<td class="diary-title-row"><span class="diary-title">7월2일의
							기록</span></td>
					<td class="diary-content">9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째
						상담이라 그런지 지난번보다 편안했다</td>
					<td class="diary-content date">2022.07.02</td>
					<td class="sad-icon emoji"><i class="fa-regular fa-face-frown"></i>
					</td>
				</tr>
				<tr class="diary-item">
					<td class="diary-title-row"><span class="diary-title">7월2일의
							기록</span></td>
					<td class="diary-content">9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째
						상담이라 그런지 지난번보다 편안했다</td>
					<td class="diary-content date">2022.07.02</td>
					<td class="sad-icon emoji"><i class="fa-regular fa-face-frown"></i>
					</td>
				</tr>
				<tr class="diary-item">
					<td class="diary-title-row"><span class="diary-title">7월2일의
							기록 오늘의 기분 밝음</span></td>
					<td class="diary-content">9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째
						상담이라 그런지 지난번보다 편안했다</td>
					<td class="diary-content date">2022.07.02</td>
					<td class="sad-icon emoji"><i class="fa-regular fa-face-frown"></i>
					</td>
				</tr>
				<tr class="diary-item">
					<td class="diary-title-row"><span class="diary-title">7월2일의
							기록 오늘의 기분 밝음</span></td>
					<td class="diary-content">9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째
						상담이라 그런지 지난번보다 편안했다</td>
					<td class="diary-content date">2022.07.02</td>
					<td class="sad-icon emoji"><i class="fa-regular fa-face-frown"></i>
					</td>
				</tr>


			</tbody>
		</table>
		<!-- 팝업 -->
		<div class="detail-popup">
			<div id="close-btn">
				<i class="fa-solid fa-x"></i>
			</div>
			<div class="title">
				<span>9월 6일 기록</span>
				<div class="happy-icon emoji">
					<i class="fa-regular fa-face-smile"></i>
				</div>
				<div style="display: none;" class="soso-icon emoji">
					<i class="fa-regular fa-face-meh"></i>
				</div>
				<div style="display: none;" class="sad-icon emoji">
					<i class="fa-regular fa-face-frown"></i>
				</div>
			</div>
			<div class="content">
				<div class="sub-title">
					일시<span>2025.09.06</span>
				</div>
				<div class="sub-title">
					내용<span>9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째 상담이라 그런지 지난번보다
						편안했다9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째 상담이라 그런지 지난번보다 편안했다</span>
				</div>
			</div>
			<div class="button-wrapper">
				<a class="btn-link" href="">
					<div class="basic-big-btn">수정</div>
				</a> <a class="btn-link" href="">
					<div class="basic-big-btn">삭제</div>
				</a> <a class="btn-link" href="">
					<div class="primary-big-btn">진단이력 바로가기</div>
				</a>
			</div>

		</div>
		<div class="diary-footer">
			<!-- 페이지네이션 -->
			<div class="pagination" id="pagination">
				<button>&lt;</button>
				<button class="active">1</button>
				<button>2</button>
				<button>3</button>
				<button>4</button>
				<button>5</button>
				<button>6</button>
				<button>7</button>
				<button>8</button>
				<button>9</button>
				<button>10</button>
				<button>&gt;</button>
			</div>
		</div>
	</div>
	<footer>
<%-- 		<jsp:include page="footer1.jsp"></jsp:include> --%>
<%-- 		<jsp:include page="footer2.jsp"></jsp:include> --%>
	</footer>
	<script src="js/diaryList.js"></script>
</body>
</html>