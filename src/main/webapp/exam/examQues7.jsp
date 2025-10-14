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
<title>examQues_수면</title>
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
					<span class="ename">한국판 불면증 심각도 척도(ISI-K)</span> <span
						class="content"> 자가진단 시, 지난 2주 동안 당신의 수면상태를 가장 잘 나타낸다고 생각되는
						문향에 체크를 하십시오. 문항도 빠짐없이 답해 주시기 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로
						정확한 증상과 판단을 위해서는 의사의 진료가 필요함을 안내 드립니다.</span> <span class="source">※출처:
						Yong Won Cho, Mei Ling Song, Charies M. Morin(2014). Validation of
						a Korean Version of the Insomnia Severity Index. J Clin Neurol
						10(3), 210-215</span>
				</div>
			</div>

			<form action="${contextPath }/exam/exam7" method="post">
				<div class="ques">
					<span class="question">Q1.최근 2주동안에 당신의 불면증의 심한 정도를 아래에
						표시하십시오. </span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">1) 잠들기 어려움</td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="4"> <span class="s1">매우심함</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">심함</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">중간</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">약간 있음</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="0"> <span class="s1">전혀 없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">2) 잠을 유지하기 어려움 (자주 깸)</td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="4"> <span class="s1">매우심함</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">심함</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">중간</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">약간 있음</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="0"> <span class="s1">전혀 없음</span></td>
						</tr>
						<tr class="radio1">
							<td class="often">3) 새벽에 너무 일찍 잠에서 깸</td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="4"> <span class="s1">매우심함</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">심함</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">중간</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">약간 있음</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score" value="0"> <span class="s1">전혀 없음</span></td>
						</tr>
					</table>
					<span class="question">Q2.당신의 현재 수면 패턴에 얼마나 만족하십니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="4"> <span class="s1">매우 불만족</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">불만족</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">중간</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">만족함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="0"> <span class="s1">매우 만족함</span></td>
						</tr>
					</table>
					<span class="question">Q3.불면증으로 인한 삶의 질 손상 정도가 다른 사람들에게 어떻게
						보인다고 생각합니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="4"> <span class="s1">매우 많이
									현저함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">많이 현저함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">다소 현저함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">조금 현저함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="0"> <span class="s1">전혀 현저하지
									않음</span></td>
						</tr>
					</table>
					<span class="question">Q4.현재 불면증에 관하여 얼마나 걱정하고 있습니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="4"> <span class="s1">매우 많이
									걱정함 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">많이 걱정함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">다소 걱정함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">조금 걱정함</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="0"> <span class="s1">전혀 걱정하지
									않음</span></td>
						</tr>
					</table>
					<span class="question">Q5.당신의 수면 문제가 일상 생활(예 : 낮 동안 피곤함. 업무
						또는 일상적 가사능력, 집중력, 기억력, 기분 등)을 어느 정도 방해한다고 생각합니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="4"> <span class="s1">매우 많이
									방해됨 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">많이 방해됨</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">다소 방해됨</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">조금 방해됨</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="0"> <span class="s1">전혀 방해되지
									않음</span></td>
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