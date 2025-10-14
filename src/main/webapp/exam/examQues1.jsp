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
<title>examQues_우울</title>
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
					<span class="ename">우울증 (한국판 CES-D척도)</span> <span class="content">
						자가진단 시, 문항들을 천천히 잘 읽으시고 지난 1주일 동안 본인이 느끼시고 행동한 것을 가장 잘 나타낸다고 생각하는
						칸에 체크 바랍니다. 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가
						필요함을 안내 드립니다. </span> <span class="source">※출처: 전겸구, 최상진,
						양병창(2001), 통합적 한국판 CES - D 개발, 한국심리학회지:건강, 6(1), 59-76 </span>
				</div>
			</div>

			<form action="${contextPath }/exam/exam1" method="post">
				<div class="ques">
					<span class="question">Q1. 평소에는 아무렇지도 않던 일들이 괴롭고 귀찮게 느껴졌다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score1" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q2. 먹고 싶지 않았고 식욕이 없었다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score2" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q3. 어느 누가 도와준다 하더라도, 나의 울적한 기분을 떨쳐버릴
						수 없을 것 같았다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score3" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q4. 무슨 일을 하던 정신을 집중하기가 어려웠다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score4" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q5. 비교적 잘 지냈다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="3"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="2"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="1"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score5" value="0"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q6. 상당히 우울했다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score6" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q7. 모든 일들이 힘들게 느껴졌다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score7" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q8. 앞일이 암담하게 느껴졌다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score8" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q9. 지금까지의 내 인생은 실패작이라는 생각이 들었다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score9" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q10. 적어도 보통 사람들만큼의 능력은 있었다고 생각한다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="3"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="2"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="1"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score10" value="0"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q11. 잠을 설쳤다(잠을 잘 이루지 못했다).</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score11" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q12. 두려움을 느꼈다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score12" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q13. 평소에 비해 말수가 적었다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score13" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q14. 세상에 홀로 있는 듯한 외로움을 느꼈다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score14" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q15. 큰 불만 없이 생활했다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="3"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="2"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="1"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score15" value="0"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q16. 사람들이 나에게 차갑게 대하는 것 같았다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score16" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q17. 갑자기 울음이 나왔다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score17" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q18. 마음이 슬펐다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score18" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q19. 사람들이 나를 싫어하는 것 같았다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score19" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
						</tr>
					</table>
					<span class="question">Q20. 도무지 뭘 해 나갈 엄두가 나지 않았다.</span>
					<table class="quesTa">
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="0"> <span class="s1">극히
									드물게(1일 이하)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="1"> <span class="s1">가끔
									(1-2일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="2"> <span class="s1">자주
									(3-4일)</span></td>
						</tr>
						<tr class="radio">
							<td class="score"><input class="scores" type="radio"
								name="score20" value="3"> <span class="s1">거의 대부분
									(5-7일)</span></td>
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