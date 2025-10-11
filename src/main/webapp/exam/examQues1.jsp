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
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=checklist" />
<link rel="stylesheet" href="${contextPath }/exam/css/examQues.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<title>examQues_우울</title>
</head>
<body>
	<jsp:include page="/common/header/header.jsp" />
	<div class="container1">
		<div class="left">
			<jsp:include page="examnav.jsp"></jsp:include>
		</div>

		<div class="right">
			<div class="examHeader">
				<div class="icon">
					<span class="material-symbols-outlined"> checklist </span>
				</div>
				<div class="text">
					<span class="ename">우울증 (한국판 CES-D척도)</span> <span class="content">
						자가진단 시, 문항들을 천천히 잘 읽으시고 지난 1주일 동안 본인이 느끼시고 행동한 것을 가장 잘 나타낸다고 생각하는 칸에
						체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가
						필요함을 안내 드립니다. </span> <span class="source">※출처: 전겸구, 최상진,
						양병창(2001), 통합적 한국판 CES - D 개발, 한국심리학회지:건강, 6(1), 59-76 </span>
				</div>
			</div>

			<form action="${contextPath }/exam/score" method="post">
				<div class="ques">
					 <span class="question">Q1. 게임을 자주 하지 않을때에도 게임에 대한 생각이 자꾸
						떠오른다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score" value="5"> <span class="s1">매우그렇다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score" value="4"> <span class="s1">그렇다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score" value="3"> <span class="s1">보통이다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score" value="2"> <span class="s1">그렇지 않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score" value="1"> <span class="s1">매우 그렇지
									않다</span></td>
						</tr>


					</table>
				</div>

				<div class="btn">
					<a href="${contextPath }/exam"><button type="button"
							class="btn-rec-w">그만두기</button></a>
					<button type="submit" class="btn-long-b">결과확인</button>
				</div>
			</form>
		</div>
	</div>
	<script src="./js/examQues.js"></script>
</body>
</html>