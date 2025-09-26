<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/admin/css/noticeDetail.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/adminHeader.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<script src="${contextPath}/admin/js/notice.js"></script>
<title>건강이음 - 공지사항관리 상세</title>
</head>
<body>
	<jsp:include page="../common/header/adminHeader.html"></jsp:include>
	<div class="main">
		<div class="main-div">
			<div class="under-section">
				<jsp:include page="../common/nav/adminNav.html"></jsp:include>
				<form method="get">
					<div class="notice-container">
					<!-- 제목 -->
					<div class="notice-header">
						<div class="tag">공지</div>
						만성 코로나 19 증후군 연구성과와 미래 대응 협력 위해 한자리에
					</div>

					<!-- 정보 -->
					<div class="notice-info">
						<div>
							<span>등록일</span>2025-09-04
						</div>
						<div>
							<span>최근 수정일</span>2025-09-04
						</div>
						<div>
							<span>작성자</span>박은솔
						</div>
					</div>

					<!-- 첨부파일 -->
					<div class="notice-attach">
						첨부파일 <span>[보도참고자료] 참고자료.pdf</span>
					</div>

					<!-- 본문 -->
					<div class="notice-content">
						(서울=연합뉴스) 성서호 기자 = 의료계 집단 휴진을 하루 앞두고 정부가 진료를 유지하려 비대면 진료를 하는 병의원
						안내에 나섰다.<br> <br> 17일 보건복지부에 따르면 동네 모든 병의원은 전화나 인터넷 등으로
						확인할 수 있다.<br> 17일 보건복지부에 따르면 동네 모든 병의원은 전화나 인터넷 등으로 확인할 수 있다.<br>
						17일 보건복지부에 따르면 동네 모든 병의원은 전화나 인터넷 등으로 확인할 수 있다.<br> 17일
						보건복지부에 따르면 동네 모든 병의원은 전화나 인터넷 등으로 확인할 수 있다.<br> 17일 보건복지부에
						따르면 동네 모든 병의원은 전화나 인터넷 등으로 확인할 수 있다.<br>
					</div>

					<!-- 이전글/다음글 -->
					<div class="notice-nav">
						<a class="link" href="">
							<div>
								<span>이전글</span>만성 코로나 19증후군 연구성과와 미래 대응 협력 위해
							</div>
						</a> <a class="link" href="">
							<div>
								<span>다음글</span>경남 고성군, 찾아가는 보건소 운영
							</div>
						</a>
					</div>

					<!-- 버튼 -->
					<div class="notice-footer">
						<div class="button-wrapper">
							<a class="btn-link" href="${contextPath}/admin/notice">
								<div class="basic-big-btn">목록</div>
							</a>
							<button formaction="${contextPath}/admin/notice/write" type="submit" class="primary-big-btn" id="updateBtn">수정</button>
							<button formaction="${contextPath}/admin/notice" type="submit" class="primary-big-btn" id="delBtn">삭제</button>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>