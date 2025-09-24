<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width= , initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <style>
            .main {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .main-div {
                margin-top: 50px;
                width: 1110px;
            }

            .chap-div {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 175px;
                width: 1110px;
                border-radius: 15px;
                background-color: #f7faff;
            }

            .chapter {
                display: flex;
            }

            .chapter-in-div {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 110px;
                width: 110px;
                border-radius: 50%;
                margin-bottom: 20px;
            }

            .yes {
                background-color: #334186;
                color: white;
            }

            .no {
                background-color: white;
            }

            .chapter-in-div > span {
                font-size: 14px;
            }

            .chapter-in {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .chapter-in > span {
                font-size: 15px;
            }

            .icon {
                margin-top: 5px;
                font-size: 30px;
                padding-bottom: 20px;
            }

            .arrow {
                display: flex;
                align-items: center;
                height: 110px;
                margin-left: 25px;
                margin-right: 25px;
            }

            .signup-type {
                margin-top: 80px;
            }

            .type-span {
                font-size: 20px;
                font-weight: bold;
                margin-left: 20px;
            }

            .under-div {
                display: flex;
                justify-content: space-between;
                width: 1110px;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .select-type-div {
                display: flex;
                justify-content: center;
                align-items: center;
                border: 3px solid #d4d4d4;
                border-radius: 15px;
                height: 410px;
            }

            .type-div {
                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
                align-items: center;
                width: 540px;
                height: 350px;
            }

            .type-name {
                font-size: 20px;
            }

            .type-img {
                width: 111px;
            }

            .span-div {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
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

            .singup-content {
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 1110px;
                height: 85px;
                background-color: #f7faff;
                margin-top: 20px;
                margin-bottom: 20px;
                border-radius: 15px;
            }

            .content-span {
                padding-left: 15px;
                font-size: 16px;
            }

            .signup-service {
                display: flex;
                flex-direction: column;
            }

            .menu-div {
                display: flex;
                justify-content: space-between;
                width: 1110px;
                display: flex;
                flex-wrap: wrap;
            }
            .menu {
                width: 540px;
                height: 50px;
                border-radius: 15px;
                background-color: #f7faff;
                margin-top: 10px;
                margin-bottom: 10px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .menu-title {
                font-size: 16px;
            }

            .menu-content {
                font-size: 16px;
                margin-top: 10px;
                margin-bottom: 10px;
                margin-left: 20px;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="chap-div">
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div yes">
                                <span>STEP 1</span>
                                <i class="icon fa-regular fa-user"></i>
                            </div>
                            <span>회원선택</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 2</span>
                                <i class="icon fa-solid fa-list-check"></i>
                            </div>
                            <span>약관동의</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 3</span>
                                <i class="icon fa-regular fa-envelope-open"></i>
                            </div>
                            <span>본인인증</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 4</span>
                                <i class="icon fa-regular fa-comment-dots"></i>
                            </div>
                            <span>정보입력</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 5</span>
                                <i class="icon fa-regular fa-thumbs-up"></i>
                            </div>
                            <span>가입완료</span>
                        </div>
                    </div>
                </div>

                <div class="signup-type">
                    <span class="type-span">회원가입유형</span>
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
                </div>
                <div>
                    <span class="type-span">가입 안내</span>
                </div>
                <div class="singup-content">
                    <span class="content-span">- 가입을 위해서는, 인증이 필요합니다.</span>
                    <span class="content-span">- 병원관리자로 가입을 하는 경우, 소속 병원의 고유 코드를 입력하여 인증합니다.</span>
                    <span class="content-span">- 본인인증은 이메일 인증을 사용합니다.</span>
                </div>
                <div class="signup-service">
                    <span class="type-span">회원 서비스</span>
                    <span class="menu-content">건강이음 홈페이지 회원으로 가입하시면 아래와 같은 서비스를 제공받으실 수 있습니다.</span>
                </div>
                <div class="menu-div">
                    <div class="menu">
                        <span class="menu-title">자가진단</span>
                    </div>
                    <div class="menu">
                        <span class="menu-title">전국 병원/보건소 예약</span>
                    </div>
                    <div class="menu">
                        <span class="menu-title">병원정보찾기</span>
                    </div>
                    <div class="menu">
                        <span class="menu-title">대기열 관리</span>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
