<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=checklist" />
    <link rel="stylesheet" href="${contextPath }/exam/css/examQues.css" />
    <title>examQues</title>
</head>
<body>
<div class="container">
        <div class="left">
        <jsp:include page="examnav.html"></jsp:include>
        </div>

        <div class="right">
            <div class="header">
                <div class="icon">
                    <span class="material-symbols-outlined">
                        checklist
                    </span>
                </div>
                <div class="text">
                    <span class="ename">질환별 자가검진</span>
                    <span class="content">
                        자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가 필요함을 안내드립니다.
                    </span>
                </div>
            </div>
            <div class="ques">
                <span class="question">Q1. 게임을 자주 하지 않을때에도 게임에 대한 생각이 자꾸 떠오른다.</span>
                <table class="ques">
                    <tr class="radio">
                        <td class="score"><input type="radio" name="score" value="5"><spna class="s1">매우그렇다</spna></td>
                    </tr>
                    <tr class="radio">
                        <td class="score"><input type="radio" name="score" value="4"><spna class="s1">그렇다</spna></td>
                    </tr>
                    <tr class="radio">
                        <td class="score"><input type="radio" name="score" value="3"><spna class="s1">보통이다</spna></td>
                    </tr>
                    <tr class="radio">
                        <td class="score"><input type="radio" name="score" value="2"><spna class="s1">그렇지 않다</spna></td>
                    </tr>
                    <tr class="radio">
                        <td class="score"><input type="radio" name="score" value="1"><spna class="s1">매우 그렇지 않다</spna></td>
                    </tr>
                </table>
            </div>

            <div class="btn">
                <a href="${contextPath }/examList"><button type="button" class="white">그만두기</button></a>
                <a href="${contextPath }/examResult"><button type="button" class="blue">결과확인</button></a>
            </div>
        </div>

    </div>
    <script src="./js/examQues.js"></script>
</body>
</html>