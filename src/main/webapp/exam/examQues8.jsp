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
<title>examQues_알코올 의존</title>
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
					<span class="ename">알코올의존자가진단(AUDIT-K 척도)</span> <span
						class="content"> 자가진단 시, 문항들을 천천히 잘 읽으시고 지난 1개월 동안 본인이 느끼시고
						행동한 것을 가장 잘 나타낸다고 생각하는 칸에 체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로
						정확한 증상과 판단을 위해서는 의사의 진료가 필요함을 안내 드립니다.</span> <span class="source">※출처:
						조근호, 채숙희, 박애란, 이해국, 신임희, 민성호(2009). 위험 음주자의 선별을 위한 한국어판 Alcohol
						Use Disorders Identification Test(AUDIT-K)의 최적 절단값. J. Korean
						Academy of Addiction Psychiatry. 13(1), 34-40</span>
				</div>
			</div>

			<form action="${contextPath }/exam/exam8" method="post">
				<div class="ques">
					<span class="question">Q1.술을 얼마나 자주 마십니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="5"> <span class="s1">1주일에 4회
									이상 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="4"> <span class="s1">1주일에 2
									~ 3회</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">한달에 2 ~
									4회</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">한달에 한번
									미만</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">전혀 마시지
									않는다</span></td>
						</tr>
					</table>
					<span class="question">Q2.평소 술을 마시는 날 몇잔 정도나 마십니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="5"> <span class="s1">10잔 이상</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="4"> <span class="s1"> 7 ~9잔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">5 ~ 6잔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1"> 3 ~ 4잔</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">1 ~ 2잔</span></td>
						</tr>
					</table>
					<span class="question">Q3.한번 술을 마실 때 소주 1병 또는 맥주 4병 이상의 음주는
						얼마나 자주 하십니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="5"> <span class="s1">매일같이</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="4"> <span class="s1">일주일에 한번</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">한달에 한번</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">한달에 1번
									미만</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">전혀없다</span></td>
						</tr>
					</table>
					<span class="question">Q4.지난 1년간 술을 한번 마시기 시작하면 멈출 수 없다는 것을
						안 때가 얼마나 자주 있었습니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="5"> <span class="s1">매일같이 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="4"> <span class="s1">일주일에 한번
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">한달에 한번</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">한달에 1번
									미만</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">전혀없다</span></td>
						</tr>
					</table>
					<span class="question">Q5.지난 1년간 당신은 평소 같으면 할 수 있었던 일을 음주
						때문에 실패한 적이 얼마나 자주 있었습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="5"> <span class="s1">매일같이 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="4"> <span class="s1">일주일에 한번
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">한달에 한번</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">한달에 1번
									미만</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">전혀없다</span></td>
						</tr>
					</table>
					<span class="question">Q6.지난 1년간 술을 마신 다음날 아침에 일 나나기 위해 다시
						해장술을 필요했던 적이 얼마나 자주 있었습니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="5"> <span class="s1">매일같이 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="4"> <span class="s1">일주일에 한번
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">한달에 한번</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">한달에 1번
									미만</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">전혀없다</span></td>
						</tr>
					</table>
					<span class="question">Q7.지난 1년간 음주 후에 죄책감이 들거나 후회를 한 적이 얼마나
						자주 있었습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="5"> <span class="s1">매일같이 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="4"> <span class="s1">일주일에 한번
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">한달에 한번</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">한달에 1번
									미만</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">전혀없다</span></td>
						</tr>
					</table>
					<span class="question">Q8.지난 1년간 음주 때문에 전날 밤에 있었던 일이 기억나지
						않았던 적이 얼마나 자주 있었습니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="5"> <span class="s1">매일같이 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="4"> <span class="s1">일주일에 한번
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="3"> <span class="s1">한달에 한번</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">한달에 1번
									미만</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">전혀없다</span></td>
						</tr>
					</table>
					<span class="question">Q9.음주로 인해 자신이나 다른 사람이 다친 적이 있었습니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="5"> <span class="s1">지난 1년간
									있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="3"> <span class="s1">있지만, 지난
									1년간에는 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">없었다</span></td>
						</tr>
					</table>
					<span class="question">Q10.친척이나 친구, 또는 의사가 당신이 술 마시는 것을
						걱정하거나 술끊기를 권유한 적이 있습니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="5"> <span class="s1">지난 1년간
									있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="3"> <span class="s1">있지만,
									지난 1년간에는 없었다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">없었다</span></td>
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
	<script src="${contextPath}/exam/js/examCheck.js"></script>
</body>
</html>