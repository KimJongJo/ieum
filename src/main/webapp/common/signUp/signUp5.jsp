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

            .icon-div {
                width: 100px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .icon-div i {
                padding: 10px;
                font-size: 50px;
            }
        </style>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
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
                    <button class="log-btn">로그인</button>
                    <button class="home-btn">홈화면</button>
                </div>
            </div>
        </div>
    </body>
</html>
