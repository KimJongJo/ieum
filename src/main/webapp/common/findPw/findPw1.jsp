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
                align-items: center;
                justify-content: center;
                margin-bottom: 50px;
            }

            .main-div {
                margin-top: 50px;
                width: 1110px;
            }
            .find-pw-nav {
                margin-top: 30px;
                display: flex;
                justify-content: center;
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

            .check-pw {
                display: flex;
                align-items: center;
                height: 110px;
                display: flex;
                margin-bottom: 1px;
            }

            .input-div2,
            .input-div2-pw {
                display: flex;
                align-items: center;
                width: 888px;
            }

            .input-div2 {
                height: 55px;
            }
            .input-div2-pw {
                height: 110px;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                align-items: flex-start;
            }

            .span-div2-pw {
                width: 222px;
                background-color: #f4f5f8;
                display: flex;
                align-items: center;
                height: 110px;
            }

            .info {
                margin-left: 20px;
                font-size: 17px;
            }

            .input {
                border-top: 1px solid #b8b8b8;
                border-bottom: 1px solid #b8b8b8;
            }

            .input-div2-pw-div {
                display: flex;
            }

            .login-input {
                margin-left: 20px;
                width: 275px;
                height: 34px;
                border: 2px solid #d4d4d4;
                border-radius: 5px;
                margin-right: 5.5px;
            }

            .signUp-btn {
                height: 40px;
                width: 50px;
                color: white;
                background-color: #565f7c;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition-duration: 0.2s;
                cursor: pointer;
            }

            .signUp-btn:hover {
                background-color: #162f6f;
            }

            .regx {
                margin-left: 20px;
                display: flex;
                flex-direction: column;
            }

            .line-div2 {
                display: flex;
                align-items: center;
                height: 55px;
                margin-bottom: 1px;
            }

            .span-div2 {
                width: 222px;
                height: 55px;
                background-color: #f4f5f8;
                display: flex;
                align-items: center;
            }

            .auth-div {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: 1110px;
                height: 400px;
                border-radius: 15px;
                background-color: #f7faff;
            }

            .auth-div-span {
                font-size: 18px;
            }

            .auth-div-input {
                height: 34px;
                border: 2px solid #b8b8b8;
                border-radius: 5px;
            }

            .input-id {
                width: 450px;
            }

            .auth-div-email {
                width: 130px;
            }

            #select {
                height: 40px;
            }

            .middle-div {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .btn {
                height: 40px;
                width: 50px;
                color: white;
                background-color: #162f6f;
                border: none;
                border-radius: 5px;
                transition-duration: 0.2s;
                cursor: pointer;
            }

            .btn:hover {
                background-color: #2c5ace;
            }

            .first {
                margin-bottom: 55px;
            }

            .content {
                width: 1110px;
            }

            .title-div {
                margin-bottom: 10px;
            }

            .title {
                margin-left: 20px;
                font-weight: bold;
                font-size: 20px;
            }

            table {
                border-spacing: 15px 10px;
            }

            .btn-div {
                margin-top: 35px;
                display: flex;
                justify-content: center;
            }

            .sign-btn {
                height: 40px;
                width: 170px;
                background-color: #162f6f;
                color: white;
                border-radius: 5px;
                border: none;
                margin-right: 5px;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .sign-btn:hover {
                background-color: #2c5ace;
            }

            .no-btn {
                height: 40px;
                width: 100px;
                background-color: white;
                border-radius: 5px;
                border: 2px solid #b8b8b8;
                transition-duration: 0.2s;
                cursor: pointer;
            }

            .no-btn:hover {
                background-color: #b5b7c0;
            }

            .signUp-btn {
                cursor: pointer;
            }

            .change-pw {
                /* display: none; */
            }
        </style>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="content">
                    <div class="title-div">
                        <span class="title">비밀번호 찾기</span>
                    </div>
                    <div class="auth-div">
                        <span class="auth-div-span">회원가입되어 있는 아이디를 입력하신 후</span>
                        <span class="auth-div-span first">이메일 인증을 통해서 본인 인증을 해주세요.</span>
                        <div>
                            <div>
                                <table>
                                    <tr>
                                        <td><input type="text" placeholder="아이디 입력" class="auth-div-input input-id" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="middle-div">
                                                <input type="text" class="auth-div-input auth-div-email" />
                                                <i class="fa-solid fa-at"></i>
                                                <input type="text" class="auth-div-input auth-div-email" />
                                                <span></span>
                                                <select name="email_domain" class="auth-div-input auth-div-email" id="select">
                                                    <option value="direct">직접 입력</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="daum.net">daum.net</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="hotmail.com">hotmail.com</option>
                                                    <option value="outlook.com">outlook.com</option>
                                                    <option value="icloud.com">icloud.com</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td><button class="btn">전송</button></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td><input type="text" placeholder="인증코드 입력" class="auth-div-input input-id" /></td>
                                        <td><button class="btn">인증</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="find-pw-nav">
                        <span>아이디를 잊으셨나요? <i class="fa-solid fa-arrow-right"></i></span>

                        <a href="">아이디 찾기</a>
                    </div>
                    <div class="change-pw">
                        <div class="title-div">
                            <span class="title">새 비밀번호 설정</span>
                        </div>
                        <div class="line-div2">
                            <div class="span-div2">
                                <span class="info">변경 비밀번호</span>
                            </div>
                            <div class="input-div2 input">
                                <input type="password" class="login-input" id="pw" />
                                <button class="signUp-btn" id="pwch" type="button">보기</button>
                            </div>
                        </div>
                        <div class="check-pw">
                            <div class="span-div2-pw">
                                <span class="info">변경 비밀번호 확인</span>
                            </div>
                            <div class="input-div2-pw input">
                                <div class="input-div2-pw-div">
                                    <input type="password" class="login-input" id="pw2" />
                                    <button class="signUp-btn" id="pwch2" type="button">보기</button>
                                </div>
                                <div class="regx">
                                    <span>길이 : 8 ~ 16자</span>
                                    <span>사용 가능한 문자 : 숫자 0~9, A~Z, a~z, !,@,#,$,%,^,&,*</span>
                                </div>
                            </div>
                        </div>
                        <div class="btn-div">
                            <button class="sign-btn">변경하기</button>
                            <button class="no-btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const pw = document.getElementById("pw");
            const pw2 = document.getElementById("pw2");
            const pwch = document.getElementById("pwch");
            const pwch2 = document.getElementById("pwch2");

            pwch.addEventListener("click", () => {
                if (pw.type === "password") {
                    pw.type = "text";
                    pwch.textContent = "숨기기";
                } else {
                    pw.type = "password";
                    pwch.textContent = "보기";
                }
            });

            pwch2.addEventListener("click", () => {
                if (pw2.type === "password") {
                    pw2.type = "text";
                    pwch2.textContent = "숨기기";
                } else {
                    pw2.type = "password";
                    pwch2.textContent = "보기";
                }
            });
        </script>
    </body>
</html>
