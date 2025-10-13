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
<link rel="stylesheet" href="${contextPath}/css/footer.css" />
<title>examQues_삶의 질</title>
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
					<span class="ename">삶의 질 설문(EQ-5D)</span> <span class="content">
						자가진단 시, 문항들을 천천히 잘 읽으시고 오늘 본인이 느끼시고 행동한 것을 가장 잘 나타낸다고 생각하는 칸에 체크
						바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가 필요함을
						안내 드립니다.</span> <span class="source">※EQ-5D는 EuroQol Group
						(www.euroqol.org) 승인을 받아 조사 됨 </span>
				</div>
			</div>

			<form action="${contextPath }/exam/exam3" method="post">
				<div class="ques">
					<span class="question">Q1.운동능력</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">나는 걷는데
									지장이 없다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">나는 걷는데
									다소 지장이 있다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="4"> <span class="s1">나는 종일
									누워 있어야 한다 </span></td>
						</tr>
					</table>

					<span class="question">Q2.자기관리</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">나는 목욕을
									하거나 옷을 입는데 지장이 없다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">나는 혼자
									목욕을 하거나 옷을 입는데 다소 지장이 있다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="4"> <span class="s1">나는 혼자
									목욕을 하거나 옷을 입을 수가 없다 </span></td>
						</tr>
					</table>

					<span class="question">Q3.일상활동 (예 : 일, 공부, 가사일, 가족 또는 여가활동 </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">나는 일상
									활동을 하는데 지장이 없다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">나는 일상
									활동을 하는데 다소 지장이 있다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="4"> <span class="s1"> 나는 일상
									활동을 할 수가 없다 </span></td>
						</tr>
					</table>

					<span class="question">Q4.통증/불편</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1"> 나는
									통증이나 불편감이 없다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">나는 다소
									통증이나 불편감이 있다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="4"> <span class="s1"> 나는 매우
									심한 통증이나 불편감이 있다 </span></td>
						</tr>
					</table>

					<span class="question">Q5.불안/우울</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">나는
									불안하거나 우울하지 않다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">나는 다소
									불안하거나 우울하다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="4"> <span class="s1">나는 매우
									심하게 불안하거나 우울하다 </span></td>
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
	<c:import url="/common/footer/footer.html" charEncoding="UTF-8" />
</body>
</html>