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
<title>examQues_조울증(청소년)</title>
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
					<span class="ename">한국형 조울병 질문지 - 청소년용(K-MDQ-A)</span> <span
						class="content"> 자가진단 시, 각 질문을 읽으시고 해당되는 내용에 '예' 또는 '아니오' 에
						표시해 주십시오. (본 질문지는 현재 상태를 평가하는 것이 아니며, 과거에 있었던 기분의 상태를 조사하는
						질문입니다.)자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가 필요함을
						안내 드립니다. </span> <span class="source">※출처: 대한우울조울병학회</span>
				</div>
			</div>

			<form action="${contextPath }/exam/exam5" method="post">
				<div class="ques">
					<span class="question">Q1.여러분의 자녀가 평소와는 다른 아래의 모습을 1주일 또는 그
						이상 보인 적이 있다면 '예' 에 체크 표시 합니다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 1) 평소와 달리
									기분이 너무 좋거나 흥분되어 보였다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score1" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1">2) 평소와 달리
									지나치게 과민해져 사람들과 싸우거나 말다툼을 했다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score2" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 3) 평소와 달리
									무엇이든 할 수 있을 것 같은 자신감을 보였다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score3" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 4) 평소와 달리 잠을
									적게 자려고 했다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score4" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1">5) 평소와 달리 머리
									안의 생각이 빠르고 많아 보이고 생각을 차분하게 하지 못했다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score5" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 6) 평소와 달리 주위
									자극에 쉽게 산만해졌다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score6" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 7) 평소와 달리 더욱
									에너지가 넘쳤다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score7" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 8) 평소와 달리 더욱
									활동적이었거나 더 많은 일을 하였다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score8" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 9) 평소와 달리
									동시에 여러 명의 이성 친구와 교제했다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score9" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 10) 평소와 달리
									성(性)에 대한 관심이 많았다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score10" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 11) 평소와 달리
									위험하거나 무분별한 행동을 많이 했다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score11" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 12) 평소와 달리
									돈을 지나치게 많이 썼다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score12" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 13) 평소와 달리
									음주를 하거나 안 좋은 약물을 먹거나 흡입했다 </span></td>
						</tr>
						<tr class="margin">
							<td></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="1"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score13" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<span class="question"> Q2.만약 위의 자녀에 대한 질문 중에서 두 개 이상 '예' 라고
						표시했다면 그런 모습은 동시에 있었습니까? </span>
					<table class="quesTa">
						<tr class="radio">
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="0"> <span class="s1">예</span></td>
							<td class="score"><input class="scores" type="radio"
								name="score14" value="0"> <span class="s1">아니오</span></td>
						</tr>
					</table>
					<span class="question"> Q3.이러한 일들로 인해서 자녀에게 어느 정도의 문제가
						발생했습니까? 다음 중 하나만 표시하십시오. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score-ques"><span class="s1"> 예를 들어, 학교문제,
									성적저하, 가족과 친구 사이 문제, 법적 문제 등</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="0"> <span class="s1"> 심각한
									문제 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="0"> <span class="s1"> 중등도의
									문제 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="0"> <span class="s1">경미한 문제
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="0"> <span class="s1"> 문제없었다
							</span></td>
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