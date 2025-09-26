<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/findId/css/findId3.css" />
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div>
                    <span class="main-span"> 요청하신 정보의 검색결과 내용은 아래와 같습니다. </span>
                </div>
                <div class="sub-div">
                    <span>고객님 소유의 아이디는 아래와 같습니다.</span>
                    <div>
                        <span class="type">일반회원</span>
                        <span>으로 가입된 아이디는</span>
                        <span class="type">desk1614(성명 : 김종조)</span>
                        <span>입니다.</span>
                    </div>
                </div>
                <div class="btn-div">
                    <button onclick="location.href='/ieum/login'" class="log-btn">로그인</button>
                    <button class="home-btn">홈화면</button>
                </div>
            </div>
        </div>
    </body>
</html>
