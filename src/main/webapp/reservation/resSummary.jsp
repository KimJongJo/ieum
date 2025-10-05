<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/8d48045bdd.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=heart_plus" />
    <link rel="stylesheet" href="${contextPath}/reservation/css/resSummary.css" />
    <link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
    <title>resSummary</title>
</head>
<body>
<jsp:include page="/common/header/header.html" />
<div class="container">
        <div class="success">
            <div class="icon">
                <span class="material-symbols-outlined">
                    heart_plus
                </span>
            </div>
            <span class="t1">예약이 확정되었습니다!</span>
        </div>

        <div class="sumbox">
            <div class="ht">
                <span class="hname">
                <c:out value="${nowRes.hNm }"/>
                </span>
                <table class="date">
                    <tr>
                        <td class="hd">일정</td>
                        <td class="hd">
                        <c:out value="${nowRes.rDate }"/>
                        </td>
                        <td class="hd">
                        <c:out value="${nowRes.rDay }"/>
                        </td>
                        <td class="hd">
                        <c:out value="${nowRes.rTime }"/>
                        </td>
                    </tr>
                </table>
                <div class="line"></div>
            </div>


            <div class="docbox">
                <img class="docprof" src="" />

                <div class="info">
                    <div class="doci">
                    <p class="dname">
                    <c:out value="${resDoc.username }"/>
                    </p>
                    <p class="intro">
                    <c:out value="${resDoc.introduction }" default="믿음을 주는 상담사"/>
                    </p>
                    </div>
                    <span class="major">
                    <c:out value="${resDoc.major }"/>
                    </span>
                </div>
            </div>

            <div class="painfo">
                <span class="t2">예약자 정보</span>
                <span class="pname">
                <c:out value="${nowRes.actName }" default="${nowRes.username }"/>
                </span>
                <span class="ptel">
                <c:out value="${nowRes.actTel }" default="${nowRes.uTel }"/>
                </span>
                <div class="line"></div>
            </div>

            <div class="councon">
                <span class="t2">상담내용</span>
                <div class="counbox">
                <c:out value="${nowRes.rContent }"/>
                </div>
            </div>
        </div>

    </div>

    <div class="btn">
        <a href="${contextPath }/index"><button type="button" class="btn-rec-w">홈으로</button></a>
        <a href="${contextPath }/myPage/reservation/list"><button type="button" class="btn-rec-b">예약확인</button></a>
    </div>
</body>
</html>