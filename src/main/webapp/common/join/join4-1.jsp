<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/join/css/join4-1.css" />
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		  <script>
		    $(function() {
		      
		    	$("#signUp-btn").click(function(){
		    		
		    	})
		    	
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
                                    <span class="info" id=input-name>성명</span>
                                </div>
                                <div class="input-div">
                                    <input type="text" class="input-div-input" />
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info" id=input-nickname>닉네임</span>
                                </div>
                                <div class="input-div2 input">
                                    <input type="text" class="input-div-input" />
                                    <span class="nick-content">닉네임은 회원정보수정에서 변경할 수 있습니다.</span>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">생년월일</span>
                                </div>
                                <div class="input-div2 input">
                                    <select name="" id="year" name="year" class="year date">
                                        <option value="none">년도</option>
                                    </select>
                                    <span class="text">년</span>
                                    <select name="" id="month" name="month" class="month date">
                                        <option value="none">월</option>
                                    </select>
                                    <span class="text">월</span>
                                    <select name="" id="day" name="day" class="day date">
                                        <option value="none">일</option>
                                    </select>
                                    <span class="text">일</span>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info" id=input-id>아이디</span>
                                </div>
                                <div class="input-div2 input">
                                    <input type="text" class="login-input" />
                                    <button class="signUp-btn" type="button">중복확인</button>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info" id=input-pw>비밀번호</span>
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
                                    <input type="radio" id="man" name="gender" checked/><label for="man">남</label><input type="radio" id="women" name="gender" /><label for="women">여</label>
                                </div>
                            </div>
                            <div class="line-div2">
                                <div class="span-div2">
                                    <span class="info">전화번호</span>
                                </div>
                                <div class="input-div2 input tel-div">
                                    <input type="tel" size="4" value="010" disabled class="tel" />
                                    <span class="telspace">―</span>
                                    <input type="tel" size="4" maxlength="4" class="tel" id=input-tel1/>
                                    <span class="telspace">―</span>
                                    <input type="tel" size="4" maxlength="4" class="tel" id=input-tel2/>
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
                            <div class="check-pw">
                                <div class="span-div2-pw">
                                    <span class="info">주소</span>
                                </div>
                                <div class="input-div2-pw input">
                                    <div class="input-div2-pw-div">
                                        <input type="text" class="login-input" id="postcode" disabled/>
                                        <button class="signUp-btn" onclick="searchAddr()" id="search-postcode" type="button">주소 검색</button>
                                    </div>
                                    <div class="address-div">
                                        <input type="text" class="first-address addr" id="address-auto" disabled/>
                                        <input type="text" class="detail-address addr" id="address-detail" placeholder="상세 주소를 입력해주세요." />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-div">
                            <button class="sign-btn" id="signUp-btn">가입하기</button>
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
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
	        function searchAddr() {
	        	
	            new daum.Postcode({
	                oncomplete: function(data) {
	                	
	                	var addr = ''; // 주소 변수
	                	
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
	                    
	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById("postcode").value = data.zonecode;
	                    document.getElementById("address-auto").value = addr;
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("address-detail").focus();
	                }
	            }).open();
	        }
        </script>
        
    </body>
</html>
