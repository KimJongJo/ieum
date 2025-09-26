<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=heart_minus" />
    <link rel="stylesheet" href="${contextPath }/myPage/css/resCancel.css" />
    <title>resCancel</title>
</head>
<body>
 <div class="container">
        <div class="box">
            <div class="icon"><span class="material-symbols-outlined">
                    heart_minus
                </span></div>
            <span class="t1">예약이 취소되었습니다.</span>
        </div>

        <div class="btn">
            <a href="${contextPath }/myPage/reservation/list"><button type="button" class="white">확인</button></a>
            <a href="${contextPath }/hospital/search"><button type="button" class="blue">예약하기</button></a>

        </div>
    </div>
</body>
</html>