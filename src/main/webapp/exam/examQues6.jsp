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
<title>examQues_조기정신증</title>
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
					<span class="ename">조기정신증 설문(CAPE-15)</span> <span class="content">
						자가진단 시, 문항들을 천천히 잘 읽으시고 본인이 느끼시고 행동한 것을 가장 잘 나타낸다고 생각하는 칸에 체크
						바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가 필요함을
						안내 드립니다. </span> <span class="source">※출처:
						마인드링크(http://mindlink.or.kr/)</span>
				</div>
			</div>

			<form action="${contextPath }/exam/score" method="post">
				<div class="ques">
					<span class="question">Q1.사람들이 당신에 대해 넌지시 말하거나, 숨겨진 의미로 어떤
						말을 하는 것 같은 느낌이 든 적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q2.어떤 사람들이 겉으로 보이는 것과 다른 것 같다는 느낌이 든
						적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score4" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q3.어떤 식으로든 당신이 괴롭힘을 당하고 있는 것 같다는 느낌이
						든 적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score6" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score7" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q4.당신을 둘러싼 음모가 있는 것 같은 느낌이 든 적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score8" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score8" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score9" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score9" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score9" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>
					<span class="question">Q5.당신의 외모 때문에 사람들이 당신을 이상하게 쳐다보는 것 같은
						느낌이 든 적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score10" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score10" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score10" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score11" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score11" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score11" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score11" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q6.컴퓨터와 같은 전자 기기들이 당신이 생각하는 방식에 영향을
						끼치는 것처럼 느껴질 때가 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score12" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score12" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score12" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score12" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score13" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score13" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score13" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score13" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>


					<span class="question">Q7.당신의 머릿속 생각들을 누군가 빼앗아 가고 있는 것처럼 느껴질
						때가 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score14" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score14" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score14" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score14" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score15" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score15" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score15" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score15" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>


					<span class="question">Q8.당신의 머릿속 생각들이 자신의 것이 아닌 것처럼 느껴질 때가
						있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score16" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score16" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score16" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score16" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score17" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score17" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score17" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score17" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>


					<span class="question">Q9.당신의 생각들이 너무나 생생해서 다른 사람들이 당신의 생각을
						들을까 봐 걱정된 적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score18" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score18" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score18" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score18" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score19" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score19" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score19" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score19" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>


					<span class="question">Q10.당신의 생각을 메아리처럼 들어본 적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score20" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score20" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score20" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score20" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score21" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score21" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score21" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score21" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q11.어떤 기운이나 힘이 당신을 통제하는 것처럼 느껴질 때가
						있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score22" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score22" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score22" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score22" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score23" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score23" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score23" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score23" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q12.가족이나 친구, 지인들과 똑같이 생긴 분신이 나타난 것처럼
						느껴질 때가 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score24" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score24" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score24" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score24" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score25" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score25" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score25" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score25" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q13.혼자 있을 때 어떤 음성을 들은 적이 있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score26" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score26" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score26" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score26" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score27" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score27" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score27" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score27" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q14.혼자 있을 때 어떤 사람들이 서로 말하는 것을 들은 적이
						있습니까?</span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score28" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score28" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score28" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score28" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score29" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score29" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score29" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score29" value="1"> <span class="s1">없음</span></td>
						</tr>
					</table>

					<span class="question">Q15.다른 사람 눈에는 보이지 않는 어떤 사물이나, 사람, 혹은
						동물을 본 적이 있습니까? </span>
					<table class="quesTa">
						<tr class="radio1">
							<td class="often">빈도</td>

							<td class="score2"><input class="scores" type="radio"
								name="score30" value="4"> <span class="s1">거의항상</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score30" value="3"> <span class="s1">자주</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score30" value="2"> <span class="s1">가끔</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score30" value="1"> <span class="s1">없음</span></td>
						</tr>
						<tr class="radio">
							<td class="often">고통</td>

							<td class="score2"><input class="scores" type="radio"
								name="score5" value="4"> <span class="s1">매우</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">상당히</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">조금</span></td>

							<td class="score2"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">없음</span></td>
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