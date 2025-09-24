<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

            .div-type-style {
                margin-bottom: 25px;
                display: flex;
                justify-content: center;
            }

            .div-type-style > span {
                font-size: 20px;
                font-weight: bold;
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

            .email-text {
                font-size: 20px;
                font-weight: bold;
            }

            .email-div {
                background-color: #d4d4d4;
                width: 60px;
                height: 60px;
                border-radius: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .email-span {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .input {
                border: 3px solid #d4d4d4;
                border-radius: 5px;
                width: 270px;
                height: 40px;
                font-size: 13px;
            }

            .next-btn {
                width: 270px;
                height: 60px;
                background-color: #162f6f;
                color: white;
                border-radius: 15px;
                font-size: 16px;
                margin-top: 10px;
                cursor: pointer;
                transition-duration: 0.2s;
                border: none;
            }

            .next-btn:hover {
                background-color: #2c5ace;
            }

            .right-div {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-around;
                height: 400px;
            }

            .send-btn {
                width: 60px;
                height: 45px;
                font-size: 13px;
                color: white;
                background-color: #565f7c;
                border-radius: 15px;
                border: none;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .send-btn:hover {
                background-color: #162f6f;
            }

            table {
                text-align: center;
            }
            td {
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 25px;
            }

            .right-under-div {
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100px;
            }

            .right-high-div {
                display: flex;
                flex-direction: column;
                justify-content: space-around;
            }

            .email-check {
                margin-bottom: 15px;
            }

            .auth-icon {
                display: none;
            }

            .text-span {
                font-size: 13px;
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
        </style>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="title-div">
                    <span>아이디를 잊으셨나요?</span>
                    <span>아래 회원 유형을 선택후 진행하여 주세요.</span>
                </div>
                <div style="width: 100%" class="div-type-style">
                    <span>이메일을 통한 본인인증을 진행해주세요</span>
                </div>
                <div class="under-div">
                    <div class="select-type-div">
                        <div class="type-div">
                            <span class="email-text">이메일</span>
                            <div class="email-div">
                                <img src="./image/이메일아이콘.png" alt="" width="40px" height="40px" />
                            </div>

                            <div class="email-span">
                                <span>인터넷 상에서의 실명확인 시 실제 본인 여부의 확인을 위한</span>
                                <span>본인인증 서비스 실제 실명확인을 받는 사람의 명의 확인이 가능해</span>
                                <span>주민등록번호 도용을 원천 방지할 수 있습니다.</span>
                            </div>
                        </div>
                    </div>
                    <div class="select-type-div">
                        <div class="type-div">
                            <div class="right-div">
                                <div class="right-high-div">
                                    <table>
                                        <tr>
                                            <td><span class="text-span">이메일</span></td>
                                            <td><input type="text" class="input" /></td>
                                            <td><button class="send-btn">전송</button></td>
                                        </tr>
                                        <tr>
                                            <td><span class="text-span">인증코드</span></td>
                                            <td><input type="text" class="input" /></td>
                                            <td><button class="send-btn">인증</button></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div style="height: 60px">
                                                    <img src="./image/인증확인아이콘.png" alt="" style="width: 50px" class="auth-icon" />
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <div class="right-under-div">
                                        <div><span class="email-check">이메일을 인증해주세요</span></div>

                                        <button class="next-btn">다음으로</button>
                                    </div>
                                </div>
                            </div>
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
