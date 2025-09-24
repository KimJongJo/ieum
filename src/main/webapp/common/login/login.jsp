<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
		<link rel="stylesheet" href="css/login.css" />
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="img-div">
                    <a href="">
                        <!-- <img src="..../img/건강이음누끼로고.png" alt="" width="200px" /> -->
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
                        <a href=""><img src="../../img/카카오로그인.webp" alt="" width="45px" class="Kimg" /></a>
                        <a href=""><img src="../../img/네이버로그인.png" alt="" width="45px" class="Nimg" /></a>
                        <a href=""><img src="../../img/구글로그인.png" alt="" width="45px" class="Gimg" /></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
