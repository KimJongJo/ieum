<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/findPw/css/findPw2.css" />
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div>
                    <span class="main-span"> 비밀번호가 성공적으로 변경되었습니다. </span>
                </div>
                <div class="sub-div">
                    <span>보다 안전한 서비스 이용을 위해 비밀번호는 타인에게 알리지 않으시길 권장드립니다.</span>
                    <span>비밀번호를 정기적으로 변경하시고, 다른 사이트와 동일한 비밀번호 사용은 피해 주시면 계정을 더욱 안전하게 보호하실 수 있습니다.</span>
                </div>
                <div class="btn-div">
                    <button onclick="location.href='/ieum/login'" class="log-btn">로그인</button>
                    <button class="home-btn">홈화면</button>
                </div>
            </div>
        </div>
    </body>
</html>
