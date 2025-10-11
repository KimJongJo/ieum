<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=diagnosis" />
    <link rel="stylesheet" href="${contextPath }/exam/css/examResult.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
    <title>examResult</title>
</head>
<body>
<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
<div class="body-div">
<div class="exam-container">
        <div class="box">
            <div class="icon">
                <span class="material-symbols-outlined">
                        diagnosis
                    </span>
                </div>
            <span class="t1">위험</span>
            <table class="score">
                <tr>
                    <td class="cate">게임생활습관</td>
                    <td class="p1">검진결과</td>
                    <td class="sco">62</td>
                    <td class="p1">점이 나왔습니다.</td>
                </tr>
            </table>
            <span class="result">
                본 검사는 스마트폰 사용 습관을 알아보는 것으로 검사 결과 날아님의 점수는 62점입니다.이는 스마트폰 사용에 지나치게 몰입하여 자율적 통제력을 상실함으로써 일상생활 상의 부정적인 결과에도
                불구하고 지속적으로 사용하고 있음을 의미합니다.따라서 근처의 정신건강센터에 방문하여 전문가와 상담하는 것을 추천 드립니다.▶ 자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한
                증상과 판단을 위해서는 의사의 진료가 필요함을 안내드립니다.
            </span>
        </div>

        <div class="btn">
            <a href="${contextPath }/exam"><button type="button" class="white">목록으로</button></a>
            <button type="button" class="white" onclick="history.back();">다시하기</button>
            <a href="${contextPath }/hospital/search"><button type="button" class="blue" onclick="location.href='resContent.html'">예약하기</button></a>
        </div>
    </div>
    </div>
    <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>