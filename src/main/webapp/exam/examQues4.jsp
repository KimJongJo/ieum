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
<title>examQues_조울증(성인)</title>
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
					<span class="ename">한국형 조울병 질문지 - 성인용(K-MDQ)</span> <span
						class="content"> 자가진단 시, 문항들을 천천히 잘 읽으시고 과거의 본인이 느끼시고 행동한
						것을 가장 잘 나타낸다고 생각하는 칸에 체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한
						증상과 판단을 위해서는 의사의 진료가 필요함을 안내 드립니다.</span> <span class="source">※출처:
						대한우울조울병학회 </span>
				</div>
			</div>

			<form action="${contextPath }/exam/score" method="post">
				<div class="ques">
					<span class="question">Q1.다음처럼 당신은 평소의 자신과는 달랐던 적이 과거(예전)에
						있었습니까?</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 1) 기분이 너무
									좋거나 들떠서 다른 사람들이 평소의 당신 모습이 아니다라고 한 적이 있었다. 또는 너무 들떠서 문제가 생긴 적이
									있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 2) 지나치게 흥분하여
									사람들에게 소리를 지르거나, 싸우거나 말다툼을 한 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 3) 평소보다 더욱
									자신감에 찬 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 4) 평소보다 더욱
									잠을 덜 잤거나, 또는 잠잘 필요를 느끼지 않은 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 5) 평소보다 말이 더
									많았거나 말이 매우 빨라졌던 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 6) 생각이 머리
									속에서 빠르게 돌아가는 것처럼 느꼈거나 마음을 차분하게 하지 못한 적이 있다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 7) 주위에서 벌어지는
									일로 쉽게 방해 받았기 때문에, 하던 일에 집중하기 어려웠거나 할 일을 계속하지 못한 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 8) 평소보다 더욱
									에너지가 넘쳤던 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 9) 평소보다 더욱
									활동적이었거나 더 많은 일을 하였던 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 10) 평소보다 더욱
									사교적이거나 적극적 (외향적)이었던 적이 있었다 (하나의 예를 들면, 한밤중에 친구들에게 전화를 했다). </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 11) 평소보다 더욱
									성행위에 관심이 간 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score11" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 12) 평소의 당신과는
									맞지 않는 행동을 했거나, 남들이 생각하기에 지나치거나 바보 같거나 또는 위험한 행동을 한 적이 있었다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score12" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 13) 돈쓰는 문제로
									자신이나 가족을 곤경에 빠뜨린 적이 있었다 </span></td>
						</tr>
						<tr class="margin"><td> </td></tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score13" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<span class="question"> Q2.만약 위의 질문 중에서 하나 이상 예라고 했다면, 그 중 몇
						가지는 같은 시기에 벌어진 것입니까? </span>
					<table class="quesTa">
						<tr class="radio">
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="2"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score14" value="1"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<span class="question"> Q3.이러한 일들로 인해서 어느 정도의 문제가 발생했습니까? </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 예를 들어 일할 수
									없었다. 금전적 문제, 법적 문제 또는 가족 내에 분란이 생겼다. 말다툼하거나 싸웠다 등.. (다음 중 하나만
									표시하십시오) </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="3"> <span class="s1"> 심각한 문제
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="2"> <span class="s1"> 중등도의 문제
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="1"> <span class="s1">경미한 문제 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="1"> <span class="s1"> 문제없었다 </span></td>
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