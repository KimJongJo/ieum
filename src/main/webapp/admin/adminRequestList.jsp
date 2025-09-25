<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="https://kit.fontawesome.com/b5ec955390.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/admin.css" />
<link rel="stylesheet" href="./css/adminNav.css" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./js/hosDetailModal.js"></script>
</head>
<body>
	<div class="main">
		<div class="main-div">
			<!-- 헤더 들어올 곳 -->
			<jsp:include page="../common/header/adminHeader.html"></jsp:include>
			<!-- 아래 -->
			<div class="under-section">
				<!-- 네비 들어올 곳 -->
				<jsp:include page="../common/nav/adminNav.html"></jsp:include>
				<div class="info">
					<div class="search-name">
						<span class="search-name-span">병원 신청 목록</span>
					</div>
					<form class="search-bar">
						<input type="text" placeholder="검색" class="search-bar-input" />
						<button class="search-bar-icon" type="button">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>

						<select name="" id="" class="search-select">
							<option value="">정렬</option>
							<option value="">병원명</option>
							<option value="">신청일</option>
						</select>
					</form>
					<div class="table-div">
						<table class="table">
							<tr>
								<th style="width: 70px">신청번호</th>
								<th style="width: 255px">병원명</th>
								<th>주소</th>
								<th>반환 이메일 주소</th>
								<th style="width: 100px">신청일</th>
								<th style="width: 100px">확인</th>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>
							<tr>
								<td>10203</td>
								<td>학교법인일산병원부속한의원</td>
								<td>서울시 중랑구 중랑구 중랑구</td>
								<td>desk1614@gmail.com</td>
								<td>2025-08-31</td>
								<td>
									<button class="info-btn">정보</button>
								</td>
							</tr>


						</table>
					</div>
					<div class="page-div">
						<a href="#"><button
								class="page" type="button">
								<i class="fa-solid fa-angle-left"></i>
							</button></a> <a href="#"><button class="cur-page" type="button">1</button></a>
						<a href="#"><button class="page" type="button">2</button></a> <a
							href="#"><button class="page" type="button">3</button></a> <a
							href="#"><button class="page" type="button">4</button></a> <a
							href="#"><button class="page" type="button">5</button></a> <a
							href="#"><button
								class="page" type="button">
								<i class="fa-solid fa-angle-right"></i>
							</button></a>
					</div>
					<div class="modal-hospital-detail" id="modal-hospital-detail">
						<div class="hospital">
							<div class="hospital-header">
								<i class="fa-solid fa-xmark"></i>
							</div>
							<div class="hospital-name-div">
								<span class="hospital-name"> 신청 병원 정보 조회 </span>
							</div>
							<div class="modal-content">
								<table class="hospital-table">
									<tr>
										<th>병원명</th>
										<td class="hospital-info">구로구 보건소</td>
									</tr>
									<tr>
										<th>신청자</th>
										<td class="hospital-info">02-1234-5678</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td class="hospital-info">병원</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td class="hospital-info">guro@hospital.kr</td>
									</tr>
									<tr>
										<th>주소</th>
										<td class="hospital-info">서울시 중랑구 어쩌구 저쩌구</td>
									</tr>
									<tr>
										<th>사업자번호</th>
										<td class="hospital-info">113-83-00895</td>
									</tr>
								</table>
								<div class="Busi-img">
									<img src="">
								</div>
							</div>

							<div class="hospital-btn-div">
								<button class="hospital-btn-delete">취소</button>
								<button class="hospital-btn-update">승인</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- 		<script src="adminNav.js"></script>
        <script src="adminModal.js"></script> -->
</body>
</html>
