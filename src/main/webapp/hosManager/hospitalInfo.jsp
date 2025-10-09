<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/manager.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/managerHeader.css" />
 		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/profileInfo.css" />
        <!-- jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		

    <script>
        const context = "${pageContext.request.contextPath}";
    </script>

    </head>
    <body>
    <c:import url="/common/header/header.html" charEncoding="UTF-8"/>
        <div class="main">
            <div class="main-div">
                <!-- 헤더 들어올 곳 -->
                <!-- 아래 -->
                <div class="under-section">
                    <!-- 네비 들어올 곳 -->
                    <jsp:include page="managerHeader.html"></jsp:include>
                    <div class="info">
                       
                        <!-- Main Content -->
				        <form class="container-three">
				        	<div class="hosImgDiv">
								<img src="${pageContext.request.contextPath}/${hospital.filePath}${hospital.fileName}">
							</div>
				            <div class="content">
				                <span id="box3">병원명</span>
				                <span class="contentSpan" id="box4"><c:out value="${hospital.hNm}"/></span>
				                <span id="box5">병원주소</span>
				                <span class="contentSpan" id="box6"><c:out value="${hospital.hAddress}"/></span>
				                <span id="box7">병원전화번호</span>
				                <span class="contentSpan" id="box8"><c:out value="${hospital.hTel}"/></span>
				                <span id="box9" class="updateDiv-btn">홈페이지주소</span>
				                <span class="contentSpan" id="box10"><a href="${hospital.hLink}">${hospital.hLink}</a></span>
				                <span id="box11" class="updateDiv-btn">오시는길</span>
				                <span class="contentSpan" id="box12"><c:out value="${hospital.transferInfo}"/></span>
				                <span id="box13">휴무일</span>
				                <span class="contentSpan" id="box14"><c:out value="${hospital.holidayInfo}"/></span>
				                <span id="box15" class="updateDiv-btn">병원공지</span>
				                <span class="contentSpan" id="box16"><c:out value="${hospital.newsTitle}"/></span>
				                <span id="box17" class="updateDiv-btn">공지내용</span>
				                <span class="contentSpan" id="box18"><c:out value="${hospital.newsContent}"/></span>
				            </div>
				           
				           <div class="update_hos_btn">
				           	<button type="button" id="modifyHosInfo">수정</button>
				           	<button class="firsthide" id="saveHosInfo" value="${hospital.hNo}">저장</button>
				           </div>
				        </form>
                        
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
        <script src="${pageContext.request.contextPath}/hosManager/js/hospitalInfo.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/managerHeader.js"></script>
    </body>
</html>

