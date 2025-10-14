<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=diagnosis" />
    <link rel="stylesheet" href="${contextPath }/exam/css/examResult.css" />
    <link rel="stylesheet" href="${contextPath}/css/header.css" />
    <link rel="stylesheet" href="${contextPath}/css/footer.css" />
    <link rel="stylesheet" href="${contextPath }/common/button/button.css"/>
    <title>examResult</title>
</head>
<body>
<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
<div class="body-div">
<div class="exam-container">
        <div class="box">
            <div class="examicon">
                <span class="material-symbols-outlined">
                        diagnosis
                    </span>
                </div>
            <span class="t1">
            <c:out value="${examSign }"/>
            </span>
            <table class="score">
                <tr>
                    <td class="cate">
                    <c:out value="${examName }"/>
                    </td>
                    <td class="p1">검진결과</td>
                    <td class="sco">
                    <c:out value="${total }"/>
                    </td>
                    <td class="p1">점이 나왔습니다.</td>
                </tr>
            </table>
            <div class="result">
                <div class="er1"><c:out value="${examResult1 }"/></div>
                <div class="er2"><c:out value="${examResult2 }"/></div>
                <c:out value="${examNotice }"/>
            </div>
        </div>

        <div class="btn">
            <a href="${contextPath }/exam"><button type="button" class="btn-rec-w">목록으로</button></a>
            <a href="${contextPath }/exam/exam${eNo}"><button type="button" class="btn-rec-w">다시하기</button></a>
            <a href="${contextPath }/hospital/search"><button type="button" class="btn-rec-b">예약하기</button></a>
        </div>
    </div>
    </div>
    <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>