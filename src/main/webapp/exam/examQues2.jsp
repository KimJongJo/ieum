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
<title>examQues_스트레스</title>
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
					<span class="ename">스트레스 척도(한국판 PERCEIVED STRESS SCALE)</span> <span
						class="content"> 자가진단 시, 문항들을 천천히 잘 읽으시고 지난 1개월 동안 본인이 느끼시고
						행동한 것을 가장 잘 나타낸다고 생각하는 칸에 체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로
						정확한 증상과 판단을 위해서는 의사의 진료가 필요함을 안내 드립니다. </span> <span class="source">※출처:
						이종하, 신철민, 고영훈, 임재형, 조숙행, 김승현, 정인과, 한창수 (2012), 한글판 스트레스 자각척도의 신뢰도와
						타당도 연구, 정신신체의학, 20(2), 127-134</span>
				</div>
			</div>

			<form action="${contextPath }/exam/score" method="post">
				<div class="ques">
					<span class="question">Q1. 최근 1개월 동안, 예상치 못했던 일 때문에 당황했던 적이 얼마나 있었습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q2. 최근 1개월 동안, 인생에서 중요한 일들을 조절할 수 없다는 느낌을 얼마나 경험하였습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q3. 최근 1개월 동안, 신경이 예민해지고 스트레스를 받고 있다는 느낌을 얼마나 경험하였습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q4. 최근 1개월 동안, 당신의 개인적 문제들을 다루는 데 있어서 얼마나 자주 자신감을 느꼈습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q5. 최근 1개월 동안, 일상의 일들이 당신의 생각대로 진행되고 있다는 느낌을 얼마나 경험하였습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q6. 최근 1개월 동안, 당신이 꼭 해야 하는 일을 처리할 수 없다고 생각한 적이 얼마나 있었습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q7. 최근 1개월 동안, 일상생활의 짜증을 얼마나 자주 잘 다스릴 수 있었습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q8. 최근 1개월 동안, 최상의 컨디션이라고 얼마나 자주 느끼셨습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q9. 최근 1개월 동안, 당신이 통제할 수 없는 일 때문에 화가 난 경험이 얼마나 있었습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="5"> <span class="s1">매우 자주 있었다</span></td>
						</tr>
					</table>
					<span class="question">Q10. 최근 1개월 동안, 어려운 일들이 너무 많이 쌓여서 극복하지 못할 것 같은 느낌을 얼마나 자주 경험하셨습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">전혀 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="2"> <span class="s1">거의 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="3"> <span class="s1">때때로 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="4"> <span class="s1">자주 있었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="5"> <span class="s1">매우 자주 있었다</span></td>
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
</body>
</html>