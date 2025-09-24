<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <style>
            .main {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .main-div {
                margin-top: 50px;

                width: 1110px;
                height: 375px;
                border-radius: 15px;
                background-color: #f7faff;

                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .main-span {
                font-size: 24px;
            }

            .sub-div {
                margin-top: 35px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .sub-div span {
                font-size: 15px;
            }

            .btn-div {
                margin-top: 60px;
            }

            .log-btn {
                height: 40px;
                width: 165px;
                color: white;
                background-color: #162f6f;
                border-radius: 15px;
                font-size: 16px;
                cursor: pointer;
                transition-duration: 0.2s;
                border: none;
                margin-right: 5px;
            }

            .log-btn:hover {
                background-color: #2c5ace;
            }

            .home-btn {
                width: 100px;
                height: 40px;
                background-color: white;
                border-radius: 15px;
                font-size: 16px;
                border: 2px solid #b5b7c0;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .home-btn:hover {
                background-color: #b5b7c0;
            }

            .type {
                color: #06b3b0;
                font-weight: bold;
                font-size: 15px;
            }
        </style>
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
                    <button class="log-btn">로그인</button>
                    <button class="home-btn">홈화면</button>
                </div>
            </div>
        </div>
    </body>
</html>
