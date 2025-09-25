<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=heart_minus" />
    <link rel="stylesheet" href="./css/resCancel.css" />
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
            <button type="button" class="white" onclick="history.back();">확인</button>
            <button type="button" class="blue" onclick="location.href='resContent.html'">예약하기</button>

        </div>
    </div>
</body>
</html>