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
                    <button class="log-btn">로그인</button>
                    <button class="home-btn">홈화면</button>
                </div>
            </div>
        </div>
    </body>
</html>
