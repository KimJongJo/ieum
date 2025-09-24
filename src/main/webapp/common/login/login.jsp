<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>

        <style>
            html {
                height: 850px;
            }

            .main {
                width: 100%;
                height: 850px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .main-div {
                display: flex;
                flex-direction: column;
                width: 370px;
                height: 570px;
            }

            .form {
                margin-top: 30px;
            }

            .login-div {
                display: flex;
                flex-direction: column;
            }

            .hi-comment {
                margin-bottom: 10px;
            }

            .comment-title {
                display: flex;
                justify-content: center;
            }

            .comment-title > span {
                font-size: 16px;
            }
            .comment {
                font-size: 13px;
            }

            .input-info {
                height: 45px;
                padding-left: 15px;
                font-size: 14px;
                margin-bottom: 7px;
                border: 2px solid #cdcdcd;
                border-radius: 5px;
            }

            #autoLogin {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;

                width: 15px;
                height: 15px;
                border: 2px solid #bdbdbd;
                border-radius: 5px;
                cursor: pointer;
            }

            #autoLogin:checked {
                background: #162f6f;
            }

            .autologin {
                margin-bottom: 17px;
                display: flex;
                align-items: center;
                line-height: 20px;
            }

            .autoLogin-span {
                font-size: 13px;
                height: 20px;
                cursor: pointer;
            }

            .login-btn {
                width: 100%;
                height: 55px;
                background-color: #162f6f;
                color: white;
                font-size: 18px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                transition-duration: 0.2s;
                cursor: pointer;
            }

            .login-btn:hover {
                background-color: #2c5ace;
            }

            .navigation {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
                margin-bottom: 40px;
                width: 250px;
            }

            /* .navigation > a > span:hover {
                background-color: #bdbdbd;
            } */

            .navigation > a {
                font-size: 13px;
                text-decoration-line: none;
                width: 80px;
                display: flex;
                justify-content: center;
                text-decoration: none;
            }

            .button-div {
                display: flex;
                justify-content: center;
            }

            .social-login-btn-div {
                width: 230px;
                display: flex;
                justify-content: space-around;
            }

            .Kimg,
            .Nimg {
                width: 49px;
            }

            .span-div {
                display: flex;
                justify-content: center;
            }

            .nav-div {
                display: flex;
                justify-content: center;
            }

            .img-div {
                display: flex;
                justify-content: center;
            }

            .blue-text {
                font-weight: bold;
                margin-left: 5px;
                color: #162f6f;
            }

            .Gimg {
                border: 2px solid #bdbdbd;
                border-radius: 50px;
            }

            .nav {
                border-radius: 15px;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="img-div">
                    <a href="">
                        <img src="./image/건강이음누끼로고.png" alt="" width="200px" />
                    </a>
                </div>
                <div class="hi-comment">
                    <div class="comment-title">
                        <span>안녕하세요</span>
                        <span class="blue-text">건강이음</span>
                        <span>입니다.</span>
                    </div>
                </div>
                <div class="span-div">
                    <span class="comment">회원 서비스를 이용하시려면 로그인이 필요합니다.</span>
                </div>
                <form action="" class="form">
                    <div class="login-div">
                        <input class="input-info" type="text" placeholder="아이디" />
                        <input class="input-info" type="password" placeholder="비밀번호" />
                        <div class="autologin">
                            <input type="checkbox" id="autoLogin" /> <label for="autoLogin"><span class="autoLogin-span">아이디 저장</span></label>
                        </div>
                    </div>
                    <button class="login-btn">로그인</button>
                </form>
                <div class="nav-div">
                    <div class="navigation">
                        <a href=""><span class="nav">회원가입</span></a>
                        <a href=""><span class="nav">아이디 찾기</span></a>
                        <a href=""><span class="nav">비밀번호 찾기</span></a>
                    </div>
                </div>

                <div class="button-div">
                    <div class="social-login-btn-div">
                        <a href=""><img src="./image/카카오로그인.webp" alt="" width="45px" class="Kimg" /></a>
                        <a href=""><img src="./image/btnG_아이콘원형.png" alt="" width="45px" class="Nimg" /></a>
                        <a href=""><img src="./image/구글_로그인.png" alt="" width="45px" class="Gimg" /></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
