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
                                <div class="span-div">
                                    <span class="info">성명</span>
                                </div>
                                <div class="input-div">
                                    <input type="text" class="input-div-input" />
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">생년월일</span>
                                </div>
                                <div class="input-div2 input">
                                    <select name="" id="year" name="year" class="year date">
                                        <option value="">년도</option>
                                    </select>
                                    <span class="text">년</span>
                                    <select name="" id="month" name="month" class="month date">
                                        <option value="">월</option>
                                    </select>
                                    <span class="text">월</span>
                                    <select name="" id="day" name="day" class="day date">
                                        <option value="">일</option>
                                    </select>
                                    <span class="text">일</span>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">아이디</span>
                                </div>
                                <div class="input-div2 input">
                                    <input type="text" class="login-input" />
                                    <button class="signUp-btn" type="button">중복확인</button>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">비밀번호</span>
                                </div>
                                <div class="input-div2 input">
                                    <input type="password" class="login-input" id="pw" />
                                    <button class="signUp-btn" id="pwch" type="button">보기</button>
                                </div>
                            </div>
                            <div class="check-pw">
                                <div class="span-div2-pw">
                                    <span class="info">비밀번호 확인</span>
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
                                    <input type="radio" id="man" name="gender" /><label for="man">남</label><input type="radio" id="women" name="gender" /><label for="women">여</label>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">전화번호</span>
                                </div>
                                <div class="input-div2 input tel-div">
                                    <input type="tel" size="4" value="010" disabled class="tel" />
                                    <span class="telspace">―</span>
                                    <input type="tel" size="4" maxlength="4" class="tel" />
                                    <span class="telspace">―</span>
                                    <input type="tel" size="4" maxlength="4" class="tel" />
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">이메일</span>
                                </div>
                                <div class="input-div2 input email">
                                    <input type="email" class="input-div-email" disabled />
                                    <i class="fa-solid fa-at"></i>
                                    <input type="email" class="input-div-email" disabled />
                                </div>
                            </div>
                            <div class="check-pw2">
                                <div class="span-div2-pw2">
                                    <span class="info">소속병원 및 병원코드</span>
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

        <script>
            const yearSelect = document.getElementById("year");
            const monthSelect = document.getElementById("month");
            const daySelect = document.getElementById("day");

            const currentYear = new Date().getFullYear();

            // 연도 채우기 (현재 연도부터 1900년까지 내림차순)
            for (let y = currentYear; y >= 1900; y--) {
                const option = document.createElement("option");
                option.value = y;
                option.textContent = y + "년";
                yearSelect.appendChild(option);
            }

            // 월 채우기
            for (let m = 1; m <= 12; m++) {
                const option = document.createElement("option");
                option.value = m;
                option.textContent = m + "월";
                monthSelect.appendChild(option);
            }

            // 일 채우는 함수
            function updateDays() {
                const year = parseInt(yearSelect.value);
                const month = parseInt(monthSelect.value);

                if (!year || !month) return;

                let daysInMonth;
                if (month === 2) {
                    daysInMonth = year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0) ? 29 : 28;
                } else if ([4, 6, 9, 11].includes(month)) {
                    daysInMonth = 30;
                } else {
                    daysInMonth = 31;
                }

                daySelect.innerHTML = '<option value="">일</option>';
                for (let d = 1; d <= daysInMonth; d++) {
                    const option = document.createElement("option");
                    option.value = d;
                    option.textContent = d;
                    daySelect.appendChild(option);
                }
            }

            yearSelect.addEventListener("change", updateDays);
            monthSelect.addEventListener("change", updateDays);

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
