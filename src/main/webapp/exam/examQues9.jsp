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
<title>examQues_게임중독</title>
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
					<span class="ename">인터넷게임중독선별도구(IGUESS)</span> <span
						class="content"> 자가진단 시, 문항들을 천천히 잘 읽으시고 지난 1년간 본인이 느끼시고
						행동한 것을 가장 잘 나타낸다고 생각하는 칸에 체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로
						정확한 증상과 판단을 위해서는 의사의 진료가 필요함을 안내 드립니다.</span> <span class="source">※출처:
						조선진, 이해국, 임현우, 조근호, 최삼욱, 오홍석, 중독 선별검사 도구 및 사용지침 개발. 2013, 가톨릭대학교,
						한국건강증진재단</span>
				</div>
			</div>

			<form id="examForm" action="${contextPath }/exam/exam9" method="post">
				<div class="ques">
					<span class="question">Q1. 이전에 했던 인터넷게임에 대해 계속 생각하거나, 인터넷게임을
						할 생각에 몰두했다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q2. 인터넷게임을 하지 않을 때에는 초조하거나 불안하거나 슬프다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q3. 인터넷게임에 쓰는 시간이 점점 길어진다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q4. 인터넷게임을 하는 것을 조절하려고 해보았지만 성공하지
						못했다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q5. 인터넷게임으로 인해 예전의 다른 취미 생활이나 오락 활동에
						대한 흥미가 줄어들었다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q6. 사회적, 심리적 문제에도 불구하고 계속해서 인터넷게임을
						과하게 한다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q7. 가족이나 치료자, 또는 그 외의 사람에게 인터넷게임을 하는
						데 사용한 시간을 속인 적이 있다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q8. 부정적인 감정을 해소하거나 회피하기 위해 인터넷게임을 한다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="3"> <span class="s1">항상</span></td>
						</tr>
					</table>
					<span class="question">Q9. 과도한 인터넷게임으로 인해 중요한 인간관계, 일, 교육이나
						경력상의 기회를 위태롭게 하거나 잃은 적이 있다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="0"> <span class="s1">전혀아님</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">가끔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="2"> <span class="s1">자주</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="3"> <span class="s1">항상</span></td>
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