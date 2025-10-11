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
<title>examQues_외상후 스트레스(PTSD)</title>
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
					<span class="ename">외상후스트레스(PTSD)</span> <span
						class="content"> 자가진단 시, 문항들을 천천히 잘 읽으시고 지난 1개월 동안 본인이 느끼시고
						행동한 것을 가장 잘 나타낸다고 생각하는 칸에 체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로
						정확한 증상과 판단을 위해서는 의사의 진료가 필요함을 안내 드립니다.</span> <span class="source">※출처:
						은헌정, 권태완, 이선미, 김태형, 최말례, 조수진(2005). 한국판 사건충격척도 수정판의 신뢰도 및 타당도 연구.</span>
				</div>
			</div>

			<form action="${contextPath }/exam/score" method="post">
				<div class="ques">
					<span class="question">Q1. 그 때의 일이 생갔났고, 그 때의 느낌도 되살아났다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q2. 밤에 잠을 설쳤다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q3. 다른 일로 인해 그 때의 일이 생각났다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q4. 짜증이 나고 화가 났다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q5. 그 일을 생각하거나 기억하게 되면서 흥분되었으나 꾹 참았다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q6. 생각하지 않으려고 해도 그 일이 생각났다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q7. 마치 그 일이 없었거나 사실이 아닌 것처럼 느껴졌다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q8. 그 일을 생각하게 하는 것은 피했다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q9. 갑자기 그 때 장면이 머릿 속에 떠올랐다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q10. 신경이 날카로워지고 잘 놀랐다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q11. 그 일을 생각하지 않으려고 노력했다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q12. 그 일로 아직 마음이 혼란스러웠지만 그냥 참았다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q13. 그 일로 인해 무감각해지는 걸 느꼈다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q14. 마치 그 당시로 되돌아 간 듯이 느끼고 행동할 때가 있었다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q15. 그 일이 떠올라서 잠들기가 어려웠다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q16. 그 일과 관련된 감정이 불쑥 북받쳐 올랐다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q17. 그 기억을 지워버리려고 애썼다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q18. 집중하기가 힘들었다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q19. 그 일을 생각하면 식은땀이 나거나 호흡장애, 현기증 또는 심장이 두근거리는 등 신체적으로 반응하였다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q20. 그 사건에 대해 꿈을 꾸었다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q21. 내가 매우 조심하며 경계하고 있다고 느꼈다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score21" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score21" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score21" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score21" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score21" value="5"> <span class="s1">매우 자주 있다</span></td>
						</tr>
					</table>
					<span class="question">Q22. 그 일에 대해 말하지 않으려고 했다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score22" value="1"> <span class="s1">전혀 아니다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score22" value="2"> <span class="s1">드물게 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score22" value="3"> <span class="s1">가끔 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score22" value="4"> <span class="s1">자주 있다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score22" value="5"> <span class="s1">매우 자주 있다</span></td>
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