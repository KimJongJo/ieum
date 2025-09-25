<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/noticeList.css">
<link rel="stylesheet" type="text/css"
	href="../common/header/adminHeader.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<title>건강이음 - 공지사항관리 목록</title>
</head>
<body>
	<jsp:include page="../common/header/adminHeader.html"></jsp:include>
	<div class="main">
		<div class="main-div">
			<div class="under-section">
				<jsp:include page="../common/nav/adminNav.html"></jsp:include>
				<div class="info">
					<div class="select-reservation">
						<div class="notice-div">
							<span class="notice-span">공지사항</span>
							<div class="search-div">
								<div class="search-keyword-box">
									<input type="text" placeholder="검색" class="keyword-input" /> <i
										class="fa-solid fa-magnifying-glass search-img"></i>
								</div>
								<select name="" id="" class="filter-select">
									<option value="">정렬</option>
								</select>
							</div>
						</div>
					</div>
					<table class="notice-table">
						<tr>
							<td class="n-t-th"><input type="checkbox" /></td>
							<td class="n-t-th">번호</td>
							<td class="n-t-th">제목</td>
							<td class="n-t-th">작성자</td>
							<td class="n-t-th">등록일</td>
							<td class="n-t-th">최근수정일</td>
							<td class="n-t-th">관리</td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
						<tr>
							<td class="checkinput"><input type="checkbox" /></td>
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
					</table>
					<div class="page-nav">
						<a href="#"><i class="fa-solid fa-chevron-left"></i></a> <a
							href="#" class="cur-page">1</a> <a href="#">2</a> <a href="#">3</a>
						<a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
						<a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#"><i
							class="fa-solid fa-chevron-right"></i></a>
					</div>
				</div>
			</div>
			<%-- 			<jsp:include page="../footer.html"></jsp:include> --%>
		</div>
	</div>

	<!-- 	<script src="./managerHeader.js"></script> -->

</body>
</html>