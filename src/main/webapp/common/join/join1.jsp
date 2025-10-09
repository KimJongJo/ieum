<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/join/css/join1.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
    </head>
    <body>
    	<c:import url="/common/header/guestHeader.html" charEncoding="UTF-8"/>
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
                    <form action="/ieum/join2" method="get" class="under-div">
                    	<input type="hidden" name="userType" id="usertypeInput">
                        <div class="select-type-div">
                            <div class="type-div">
                                <span class="type-name">일반 회원</span>
                                <img src="${pageContext.request.contextPath}/img/일반회원.png" alt="" class="type-img" />
                                <div class="span-div">
                                    <span>편리하게 병원 진료를 예약하고 기록을 확인할 수 있습니다.</span>
                                    <span>서비스 이용을 위해 간단한 회원가입을 진행해주세요.</span>
                                </div>
                                <button class="select-btn" onclick="submitForm('USER')">선택하기</button>
                            </div>
                        </div>
                        <div class="select-type-div">
                            <div class="type-div">
                                <span class="type-name">병원 관리자</span>
                                <img src="${pageContext.request.contextPath}/img/병원관리자.png" alt="" class="type-img" />
                                <div class="span-div">
                                    <span>편리하게 병원 진료를 예약하고 기록을 확인할 수 있습니다.</span>
                                    <span>서비스 이용을 위해 간단한 회원가입을 진행해주세요.</span>
                                </div>
                                <button class="select-btn" onclick="submitForm('HOSMANAGER')">선택하기</button>
                            </div>
                        </div>
                    </form>
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
        
        <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
        
        <script>
	        function submitForm(usertype) {
	            document.getElementById('usertypeInput').value = usertype;
	            
	            console.log(usertype);
	        }
        </script>
    </body>
</html>
