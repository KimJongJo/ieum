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
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${contextPath}/css/footer.css" />
<link rel="stylesheet" href="${contextPath}/exam/css/examQues.css" />
<title>examlist</title>
</head>
<body>
	<c:import url="/common/header/header.jsp" charEncoding="UTF-8" />
	<div class="container1">
		<div class="left">
			<jsp:include page="examnav.jsp"></jsp:include>
		</div>
		<div class="right">
			<div class="examHeader">
				<div class="examicon">
					<span class="material-symbols-outlined"> checklist </span>
				</div>
				<div class="text">
					<span class="ename">질환별 자가검진</span> <span class="content">
						자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가 필요함을
						안내드립니다. </span><span class="source"></span>
				</div>
			</div>
			<div class="listg">
				<table class="elc">
					<tr>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam1"> <img
										class="image-thumbnail" src="/ieum/img/exam_1_3.png" /></a>
								</div>
								<span class="e1">우울</span>
							</div>
						</td>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam2"> <img
										class="image-thumbnail" src="/ieum/img/exam_2_3.png" /></a>
								</div>
								<span class="e1">스트레스</span>
							</div>
						</td>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam3"> <img
										class="image-thumbnail" src="/ieum/img/exam_3_3.png" /></a>
								</div>
								<span class="e1">아동용 ADHD</span>
							</div>
						</td>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam4"> <img
										class="image-thumbnail" src="/ieum/img/exam_4_3.png" /></a>
								</div>
								<span class="e1">조울증(성인)</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam5"> <img
										class="image-thumbnail" src="/ieum/img/exam_5_3.png" /></a>
								</div>
								<span class="e1">조울증(청소년)</span>
							</div>
						</td>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam6"> <img
										class="image-thumbnail" src="/ieum/img/exam_6_3.png" /></a>
								</div>
								<span class="e1">조기정신증</span>
							</div>
						</td>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam7"> <img
										class="image-thumbnail" src="/ieum/img/exam_7_3.png" /></a>
								</div>
								<span class="e1">수면</span>
							</div>
						</td>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam8"> <img
										class="image-thumbnail" src="/ieum/img/exam_8_3.png" /></a>
								</div>
								<span class="e1">알코올 중독</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam9"> <img
										class="image-thumbnail" src="/ieum/img/exam_9_3.png" /></a>
								</div>
								<span class="e1">게임중독</span>
							</div>
						</td>
						<td>
							<div class="sum">
								<div class="ci">
									<a href="${contextPath}/exam/exam10"> <img
										class="image-thumbnail" src="/ieum/img/exam_10_3.png" /></a>
								</div>
								<span class="e1">외상 후 스트레스 장애</span>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<c:import url="/common/footer/footer.html" charEncoding="UTF-8" />
</body>
</html>