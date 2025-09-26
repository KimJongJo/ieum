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
    <title>resSummary</title>
</head>
<body>
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
                <span class="hname">구로구보건소</span>
                <table class="date">
                    <tr>
                        <td class="hd">2025.09.07</td>
                        <td class="hd">(일)</td>
                        <td class="hd">오전</td>
                        <td class="hd">11:30</td>
                    </tr>
                </table>
                <div class="line"></div>
            </div>


            <div class="docbox">
                <img class="docprof" src="" />

                <div class="info">
                    <div class="doci">
                    <p class="dname">황해진</p>
                    <p class="intro">
                        안녕하세요 적당히 바람이 불어 기분이 좋아요 유후
                    </p>
                    </div>
                    <span class="major">가정의학과</span>
                </div>
            </div>

            <div class="painfo">
                <span class="t2">예약자 정보</span>
                <span class="pname">임지혜</span>
                <span class="ptel">010-1234-1234</span>
                <div class="line"></div>
            </div>

            <div class="councon">
                <span class="t2">상담내용</span>
                <div class="counbox"></div>
            </div>
        </div>

    </div>

    <div class="btn">
        <a href="${contextPath }/common/main/index.jsp"><button type="button" class="white">홈으로</button></a>
        <a href="${contextPath }/resList"><button type="button" class="blue">예약확인</button></a>
    </div>
</body>
</html>