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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=keyboard_arrow_down" />
<link rel="stylesheet"
	href="${contextPath }/reservation/css/resContent.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>resContent</title>
</head>
<body>
	<jsp:include page="/common/header/header.html" />
	<form id="actResForm">
		<input type="hidden" id="mNo" value="${mNo}"> 
		<input type="hidden" id="rDate" value="${rDate}">
		<input type="hidden" id="rDay" value="${rDay}">
		<input type="hidden" id="rTime" value="${rTime}">
		<input type="hidden" id="rContent" value="${rContent}">
		
		<div class="container1">
			<div class="t2">아래 내용이 맞는지 확인해주세요</div>
			<div class="h-box">
				<span class="h-name"> <c:out value="${hosd.hNm}" />
				</span>
				<table class="timedate">
					<tr>
						<td class="ta1">일정</td>
						<td class="ta1"><c:out value="${rDate}" /></td>
						<td class="ta1"><c:out value="${rTime}" /></td>
						<td class="ta1"><c:out value="${rDay}" /></td>
					</tr>
				</table>
			</div>

			<div class="user-box">
				<span class="t1">예약자 정보</span>
				<div class="u1">
					<div class="u2">
						<span class="uname"><c:out value="${memd.username}" /></span> <span
							class="utel"><c:out value="${memd.uTel}" /></span>
					</div>
				</div>
				<div class="line"></div>
			</div>

			<div class="councon">
				<div class="conbox">
					<div class="c6">
						<span class="t1">상담내용</span>
					</div>
					<button type="button" class="btn-cir-w">변경</button>
				</div>
				<div class="c1">
					<c:out value="${rContent}" />
				</div>
			</div>

			<div class="act">
				<div class="a1">
					<button type="button" class="btn-cir-w" id="actBtn">
						<span class="i"> 방문자가 회원정보와 다른가요? </span> <span
							class="material-symbols-outlined"> keyboard_arrow_down </span>
					</button>
				</div>

				<div class="a2" id="actUser">
					<div class="line2"></div>
					<span class="t1">실제 방문하실분의 정보를 입력해주세요.</span>
					<div class="aff">
						<div class="af">
							<span class="af2">이름</span> <input type="text" name="actName"
								class="afinput" placeholder="이름">
						</div>
						<div class="af">
							<span class="af2">연락처</span> <input type="text" name="actTel"
								class="afinput" placeholder="010-0000-0000">
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="btn">
			<button type="button" class="btn-rec-w" onclick="history.back()">이전으로</button>
			<button type="button" class="btn-long-b" id="resSubmit">다음단계</button>
		</div>
	</form>
	<script src="${contextPath }/reservation/js/resContent.js"></script>
</body>
</html>