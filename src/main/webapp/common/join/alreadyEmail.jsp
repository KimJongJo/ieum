<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/join/css/join5.css" />
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
		<div class="main">
		    <div class="main-div">
		        <div>
		            <span class="main-span">계정을 병합하시겠습니까?</span>
		        </div>
		        <div class="icon-div">
		            <i class="fa-regular fa-object-ungroup"></i>
		        </div>
		        <div class="sub-div">
		            <span>현재 로그인한 네이버 이메일과 동일한 계정이 이미 존재합니다.</span>
		            <span>병합하면 네이버 로그인으로 기존 계정에 바로 접속할 수 있습니다.</span>
		            <span class="type">
		                본인 계정이 아니라면 "새로 가입"을 눌러주세요.<br>
		                이 경우 다른 이메일 계정을 사용해야 합니다.
		            </span>
		        </div>
		        <div class="btn-div">
		            <button onclick="location.href='/ieum/social/naverSignUp'" class="home-btn">새로 가입</button>
		            <button onclick="location.href='/ieum/login'" class="log-btn">병합하기</button>
		        </div>
		    </div>
		</div>
    </body>
</html>
