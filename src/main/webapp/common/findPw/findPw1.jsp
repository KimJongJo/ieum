<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/findPw/css/findPw1.css" />
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
                            <button onclick="location.href='/ieum/findPw2'" class="sign-btn">변경하기</button>
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
