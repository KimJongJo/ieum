<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/join/css/join5.css" />
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
        	<c:import url="/common/header/guestHeader.html" charEncoding="UTF-8"/>
        <div class="main">
            <div class="main-div">
                <div>
                    <span class="main-span"> 회원가입이 완료되었습니다. </span>
                </div>
                <div class="icon-div">
                    <i class="fa-regular fa-handshake"></i>
                </div>
                <div class="sub-div">
                    <span>건강이음은 회원으로 회원 서비스를 이용하실 수 있습니다.</span>
                    <span>건강이음은 회원 여러분께 꼭 필요한 정보와 편리한 기능들을 제공해드리며,</span>
                    <span>여러분의 건강한 삶을 만들어 나가는데 최선을 다하겠습니다.</span>
                    <span class="type">회원정보 변경은 로그인 후 <회원정보수정> 에서 하실 수 있습니다.</span>
                </div>
                <div class="btn-div">
                    <button onclick="location.href='/ieum/index'" class="home-btn">홈화면</button>
                    <button onclick="location.href='/ieum/login'" class="log-btn">로그인</button>
                </div>
            </div>
        </div>
        <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
    </body>
</html>
