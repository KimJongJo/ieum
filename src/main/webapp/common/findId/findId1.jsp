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
       	<link rel="stylesheet" href="${pageContext.request.contextPath}/common/findId/css/findId1.css" />
       	<script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
    <c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
        <div class="main">
            <div class="main-div">
                <div class="title-div">
                    <span>아이디를 잊으셨나요?</span>
                    <span>아래 회원 유형을 선택후 진행하여 주세요.</span>
                </div>
                <div style="width: 100%" class="div-type-style">
                    <span class="div-span">가입된 회원 유형</span>
                </div>
                <div class="under-div">
	                <form action="/ieum/findId2" method="get" class="under-div">
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
	                            <span class="type-name">일반 회원</span>
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
                <div class="find-pw-nav">
                    <span>비밀번호를 잊으셨나요? <i class="fa-solid fa-arrow-right"></i></span>

                    <a href="/ieum/findPw1">비밀번호 찾기</a>
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
