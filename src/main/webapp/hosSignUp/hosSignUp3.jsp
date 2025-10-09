<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/hosSignUp/css/hosSignUp3.css" />
<title>Insert title here</title>
</head>
<body>
<c:import url="/common/header/header.html" charEncoding="UTF-8"/>
	<div class="main">
		<div class="main-div">
			<div class="chap-div">
			<div class="chapter">
					<div class="chapter-in">
						<div class="chapter-in-div no">
							<span>STEP 1</span> <i class="icon fa-regular fa-user"></i></i>
						</div>
						<span>신청자 정보 작성</span>
					</div>
					<div class="arrow">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
				</div>
				<div class="chapter">
					<div class="chapter-in">
						<div class="chapter-in-div no">
							<span>STEP 2</span> <i class="icon fa-regular fa-hospital"></i></i>
						</div>
						<span>병원정보 작성</span>
					</div>
					<div class="arrow">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
				</div>
				<div class="chapter">
					<div class="chapter-in">
						<div class="chapter-in-div yes">
							<span>STEP 3</span> <i class="icon fa-regular fa-thumbs-up"></i>
						</div>
						<span>신청완료</span>
					</div>
				</div>
			</div>
			<div class="result-div">
				
				
                <div class="icon-div">
                    <i class="fa-regular fa-handshake"></i>
                </div>
                <div class="main-span-h">
                    <span class="main-span"> 병원 등록 신청이 완료되었습니다. </span>
                </div>
                <div class="sub-div">
                    <span>관리자 승인 절차가 진행된 후, 입력하신 이메일로 병원 인증 코드와 안내 메일이 발송됩니다.</span>
                    <span>승인이 완료되면 병원 등록이 즉시 반영됩니다.</span>
                </div>
                <div class="btn-div">
                    <button onclick="location.href='/ieum/index'" class="home-btn">홈화면</button>
                </div>
				
			</div>
		</div>
	</div>
<c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="./js/hosSignUp.js"></script>
</body>
</html>