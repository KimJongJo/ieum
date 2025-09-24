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
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            .under-div {
                display: flex;
                justify-content: space-between;
                width: 100%;
            }

            .title-div {
                width: 1110px;
                height: 160px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: #f7faff;
                border-radius: 15px;
                font-size: 18px;
                margin-bottom: 25px;
            }

            .span-div {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .span-div > span {
                font-size: 15px;
            }

            .select-btn {
                border: 3px solid #d4d4d4;
                border-radius: 15px;
                background-color: white;
                width: 460px;
                height: 60px;
                font-size: 20px;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .select-btn:hover {
                background-color: #4356b3;
                color: white;
            }

            .div-type-style {
                margin-bottom: 25px;
            }

            .div-type-style > span {
                font-size: 20px;
                font-weight: bold;
            }

            .type-img {
                width: 111px;
            }

            .type-name {
                font-size: 20px;
            }

            .type-div {
                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
                align-items: center;
                width: 540px;
                height: 350px;
            }

            .select-type-div {
                display: flex;
                justify-content: center;
                align-items: center;
                border: 3px solid #d4d4d4;
                border-radius: 15px;
                height: 410px;
            }

            .find-pw-nav {
                margin-top: 65px;
                display: flex;
                justify-content: flex-end;
                width: 100%;
            }

            .find-pw-nav > span {
                font-size: 15px;
                color: #b5b7c0;
            }

            .find-pw-nav i {
                padding-left: 20px;
                padding-right: 20px;
                color: #b5b7c0;
            }

            .find-pw-nav > a {
                text-decoration-line: none;
                color: #162f6f;
                font-weight: bold;
                font-size: 16px;
            }

            .div-span {
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="title-div">
                    <span>아이디를 잊으셨나요?</span>
                    <span>아래 회원 유형을 선택후 진행하여 주세요.</span>
                </div>
                <div style="width: 100%" class="div-type-style">
                    <span class="div-span">가입된 회원 유형</span>
                </div>
                <div class="under-div">
                    <div class="select-type-div">
                        <div class="type-div">
                            <span class="type-name">일반 회원</span>
                            <img src="./image/일반회원.png" alt="" class="type-img" />
                            <div class="span-div">
                                <span>편리하게 병원 진료를 예약하고 기록을 확인할 수 있습니다.</span>
                                <span>서비스 이용을 위해 간단한 회원가입을 진행해주세요.</span>
                            </div>
                            <button class="select-btn">선택하기</button>
                        </div>
                    </div>
                    <div class="select-type-div">
                        <div class="type-div">
                            <span class="type-name">일반 회원</span>
                            <img src="./image/병원관리자.png" alt="" class="type-img" />
                            <div class="span-div">
                                <span>편리하게 병원 진료를 예약하고 기록을 확인할 수 있습니다.</span>
                                <span>서비스 이용을 위해 간단한 회원가입을 진행해주세요.</span>
                            </div>
                            <button class="select-btn">선택하기</button>
                        </div>
                    </div>
                </div>
                <div class="find-pw-nav">
                    <span>비밀번호를 잊으셨나요? <i class="fa-solid fa-arrow-right"></i></span>

                    <a href="">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </body>
</html>
