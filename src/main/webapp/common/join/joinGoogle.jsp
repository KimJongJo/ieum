<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/join/css/join4-1.css" />
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    </head>
    <body>
            	<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
        <div class="main">
            <div class="main-div">
                <div class="chap-div">
                   
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div yes">
                                <span>STEP 1</span>
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
                                <span>STEP 2</span>
                                <i class="icon fa-regular fa-thumbs-up"></i>
                            </div>
                            <span>가입완료</span>
                        </div>
                    </div>
                </div>
                <div>
                    <form action="/ieum/social/googleSignUp" method="post">
                        <div class="info-box">
                            <div class="line-div">
                                <div class="span-div  info-check-div">
                                    <span class="info" id="input-nickName">닉네임</span>
                                    <span class="i-span" id="nickName-span"><i class="fa-solid fa-check span-check" id="nickName-i"></i></span>
                                </div>
                                <div class="input-div">
                                    <input type="text" class="input-div-input" id="nickName" name="nickName" />
                                    <span class="nick-content">최소 2자 ~ 최대 12자</span>
                                    <span class="nick-content">닉네임은 마이페이지 회원정보 수정에서 변경할 수 있습니다.</span>
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
                                <div class="span-div2">
                                    <span class="info">성별</span>
                                </div>
                                <div class="input-div2 gender input">
                                    <input type="radio" id="man" name="gender" value="M" checked/><label for="man">남</label><input type="radio" id="women" value="F" name="gender" /><label for="women">여</label>
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
                                    <span class="info">다이어리 공개 여부</span>
                                </div>
                                <div class="input-div2 input">
                                    <div class="input-div2 diary input">
	                                    <input type="radio" id="yes" name="diary" value="yes" checked/><label for="yes">예</label><input type="radio" id="no" value="no" name="diary" /><label for="no">아니오</label>
	                                </div>
                                    <span class="nick-content">회원님의 메모/다이어리 기록을 진료 의사가 확인할 수 있습니다.</span>
                                </div>
                            </div>
                            <div class="check-pw">
                                <div class="span-div2-pw  info-check-div">
                                    <span class="info">이메일</span>
                                    <span class="i-span" id=email-span><i class="fa-solid fa-check span-check" id="email-i"></i></span>
                                </div>
                                <div class="input-div2-pw input">
                                    <div class="input-div2-pw-div">
                                        <input name="email" type="email" class="login-input" id="email" placeholder="이메일"/>
                                        <button class="signUp-btn" id="emailSend" type="button">전송</button>
                                    </div>
                                    <div class="input-div2-pw-div">
                                        <input type="email" class="login-input" id="emailCode" placeholder="인증코드"/>
                                        <button class="signUp-btn" id="emailAuthCheck" type="button">인증</button>
                                    </div>
                                </div>
                            </div>
                            <div class="check-pw">
                                <div class="span-div2-pw info-check-div">
                                    <span class="info">주소</span>
                                    <span class="i-span" id=address-span><i class="fa-solid fa-check span-check" id="address-i"></i></span>
                                </div>
                                <div class="input-div2-pw input">
                                    <div class="input-div2-pw-div">
                                        <input type="text" class="login-input" id="postcode" disabled/>
                                        <button class="signUp-btn" onclick="searchAddr()" id="search-postcode" type="button">주소 검색</button>
                                    </div>
                                    <div class="address-div">
                                        <input type="text" class="first-address addr" id="address-auto" name="address" readonly/>
                                        <input type="text" class="detail-address addr" id="address-detail" name="addressDetail" placeholder="상세 주소를 입력해주세요." />
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
        <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="${pageContext.request.contextPath}/common/join/js/joinGoogle.js"></script>
        
    </body>
</html>
