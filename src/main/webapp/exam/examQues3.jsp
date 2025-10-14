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
<title>examQues_아동용ADHD</title>
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
					<span class="ename">아동용ADHD</span> <span class="content">
						자가진단 시, 문항들을 천천히 잘 읽으시고 당신의 자녀가 집에서 보이는 행동한 것을 가장 잘 나타낸다고 생각하는 칸에
						체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가
						필요함을 안내 드립니다.</span> <span class="source">※보건복지부 국립정신건강센터에서 참조</span>
				</div>
			</div>

			<form action="${contextPath }/exam/exam3" method="post">
				<div class="ques">
					<span class="question">Q1.세부적인 면에 대해 꼼꼼하게 주의를 기울이지 못하거나 학업에서
						부주의한 실수를 한다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q2.손발을 가만히 두지 못하거나 의자에 앉아서도 몸을
						꼼지락거린다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q3.일을 하거나 놀이를 할 때 지속적으로 주의를 집중하는데
						어려움이 있다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q4.자리에 앉아 있어야 하는 교실이나 다른 상황에서 앉아있지
						못한다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q5.다른 사람이 마주보고 이야기 할 때 경청하지 않는 것처럼
						보인다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q6.그렇게 하면 안 되는 상황에서 지나치게 뛰어다니거나
						기어오른다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q7.지시를 따르지 않고, 일을 끝내지 못한다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q8.여가활동이나 재미있는 일에 조용히 참여하기가 어렵다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q9.과제와 일을 체계적으로 하지 못한다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">때때로 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q10.세끊임없이 무엇인가를 하거나 마치 모터가 돌아가듯 움직인다.
					</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q11.지속적인 노력이 요구되는 과제(학교공부나 숙제)를 하지
						않으려 한다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q12.지나치게 말을 많이 한다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q13.과제나 일을 하는데 필요한 물건들은 잃어버린다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q14.질문이 채 끝나기도 전에 성급하게 대답한다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q15.쉽게 산만해 진다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q16.차례를 기다리는데 어려움이 있다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q17.일상적으로 하는 일을 잊어버린다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q18.다른 사람을 방해하거나 간섭한다. </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="0"> <span class="s1">전혀 그렇지
									않다</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="1"> <span class="s1">때때로
									그렇다 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="2"> <span class="s1">자주 그렇다
							</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="3"> <span class="s1">매우 자주
									그렇다</span></td>
						</tr>
					</table>
					<span class="question">Q19.검사 대상자의 성별을 선택해주세요 </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="0"> <span class="s1">남성</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="0"> <span class="s1">여성 </span></td>
						</tr>

					</table>
					<span class="question">Q20.검사 대상자의 나이를 선택해주세요.(만 나이) </span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="0"> <span class="s1">6세</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="0"> <span class="s1">7세 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="0"> <span class="s1">8세</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="0"> <span class="s1">9세 </span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="0"> <span class="s1">10세</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="0"> <span class="s1">11세 </span></td>
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