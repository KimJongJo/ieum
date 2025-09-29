<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/join/css/join4-2.css" />
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript"></script>
        <script>
            $(function () {
                $("#major-select").on("change", function () {
                    if ($(this).val() === "doctor") {
                        $("#doctor-major").prop("disabled", false);
                    } else {
                        $("#doctor-major").prop("disabled", true);
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="chap-div">
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
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
                            <div class="chapter-in-div yes">
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
                <div>
                    <form action="/ieum/join5" method="post">
                        <div class="info-box">
                            <div class="line-div">
                                <div class="span-div  info-check-div">
                                    <span class="info" id=input-name>성명</span>
                                    <!-- <span class="i-span"><i class="fa-solid fa-xmark span-x"></i></span> -->
                                    <span class="i-span" id=username-span><i class="fa-solid fa-check span-check" id="username-i"></i></span>
                                    <!-- fa-xmark ,  fa-check -->
                                </div>
                                <div class="input-div">
                                    <input type="text" class="input-div-input" id="userName" name="userName"/>
                                    <span class="nick-content">한글 2 ~ 5자</span>
                                </div>
                            </div>
                            <div class="line-div2">
                                 <div class="span-div2  info-check-div">
                                    <span class="info">생년월일</span>
                                    <span class="i-span" id=birth-span><i class="fa-solid fa-check span-check" id="birth-i"></i></span>
                                </div>
                                <div class="input-div2 input">
                                    <select name="year" id="year" name="year" class="year date">
                                        <option value="none">년도</option>
                                    </select>
                                    <span class="text">년</span>
                                    <select name="month" id="month" name="month" class="month date">
                                        <option value="none">월</option>
                                    </select>
                                    <span class="text">월</span>
                                    <select name="day" id="day" name="day" class="day date">
                                        <option value="none">일</option>
                                    </select>
                                    <span class="text">일</span>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2 info-check-div" >
                                    <span class="info" id=input-id>아이디</span>
                                    <span class="i-span" id=userId-span><i class="fa-solid fa-check span-check" id="userId-i"></i></span>
                                </div>
                                <div class="input-div2 input">
                                    <input type="text" class="login-input" id="userId" name="userId"/>
                                    <button id="check-id-btn" class="signUp-btn" type="button">중복확인</button>
                                    <span class="nick-content">4~16자 영문 소문자, 숫자 조합</span>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2  info-check-div">
                                    <span class="info" id=input-pw>비밀번호</span>
                                    <span class="i-span" id=pw-span><i class="fa-solid fa-check span-check" id="pw-i"></i></span>
                                </div>
                                <div class="input-div2 input">
                                    <input type="password" class="login-input" id="pw" name="userPw"/>
                                    <button class="signUp-btn" id="pwch" type="button">보기</button>
                                </div>
                            </div>
                            <div class="check-pw">
                                <div class="span-div2-pw  info-check-div">
                                    <span class="info">비밀번호 확인</span>
                                    <span class="i-span" id=pw2-span><i class="fa-solid fa-check span-check" id="pw2-i"></i></span>
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
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">성별</span>
                                </div>
                                <div class="input-div2 gender input">
                                    <input type="radio" id="man" name="gender" checked /><label for="man">남</label><input type="radio" id="women" name="gender" /><label for="women">여</label>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2 info-check-div">
                                    <span class="info">전화번호</span>
                                    <span class="i-span" id=tel-span><i class="fa-solid fa-check span-check" id="tel-i"></i></span>
                                </div>
                                <div class="input-div2 input tel-div">
                                    <input type="tel" size="4" value="010" disabled class="tel" />
                                    <span class="telspace">―</span>
                                    <input type="tel" size="4" maxlength="4" class="tel" id="inputTel1" name="tel1"/>
                                    <span class="telspace">―</span>
                                    <input type="tel" size="4" maxlength="4" class="tel" id="inputTel2" name="tel2"/>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">이메일</span>
                                </div>
                                <div class="input-div2 input email">
                                    <input type="email" class="input-div-email" value="${sessionScope.email[0]}" disabled />
                                    <i class="fa-solid fa-at"></i>
                                    <input type="email" class="input-div-email" value="${sessionScope.email[1]}"  disabled />
                                </div>
                            </div>
                            <div class="check-pw2">
                                <div class="span-div2-pw2">
                                    <span class="info">소속병원 및 병원코드</span>
                                    <span class="i-span" id=hos-span><i class="fa-solid fa-check span-check" id="hos-i"></i></span>
                                </div>
                                <div class="input-div2-pw2 input">
                                    <div class="input-div2-addr">
                                        <input type="text" class="login-input" />
                                        <button class="signUp-btn" type="button">병원검색</button>
                                    </div>
                                    <div class="input-div2-addr">
                                        <input type="tel" placeholder="병원코드입력" class="login-input" />
                                        <button class="signUp-btn" type="button">인증</button>
                                    </div>
                                    <div class="major-div">
                                        <select class="major-select" id="major-select">
                                            <option value="doctor">의사</option>
                                            <option value="normal">병원관리자</option>
                                        </select>
                                        <select class="major-select" id="doctor-major">
                                            <option>정신건강의학과</option>
                                            <option>소아청소년 정신과</option>
                                            <option>노인정신과</option>
                                            <option>중독,재활 정신과</option>
                                            <option>심리치료/상담</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-div">
                            <button class="sign-btn">가입하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/common/join/js/join4.js"></script>
        <script src="${pageContext.request.contextPath}/common/join/js/join4-2.js"></script>
    </body>
</html>
