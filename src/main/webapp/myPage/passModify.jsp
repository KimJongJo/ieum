<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/passModify.css" />
<script src="${pageContext.request.contextPath}/myPage/css/passModify.js"></script>
</head>
<body>

    <c:import url="/common/header/header.html" charEncoding="UTF-8"/>
    

    <!-- Section Title -->
    <div id="section-title">
        <span>비밀번호 변경</span>
    </div>

    <!-- Main -->
    <div class="main-container">
        <!-- Sidebar -->
        <div class="container-two">
            <div class="sidebar">
                <div class="sidebar-header">
                    건강이음<br>마이페이지
                </div>
                <div class="welcome">
                    <strong>*환영합니다*<br>최지성 회원님</strong>
                    <span>심원의방</span>
                </div>
                <c:if test="${userType == 'USER'}">
               		<jsp:include page="/myPage/myPageNav.jsp"></jsp:include>
                </c:if>	
            </div>
        </div>

        <!-- Main Content -->
        <div class="container-three">
	
		    <!-- 텍스트 박스 영역 -->
		    <div id="text-box">
		        <h3>나의 정보 수정 이용 가능한 서비스</h3>
		        <ul>
			        <li>홈페이지 비밀번호(영문자, 숫자, 특수문자 9자리 이상)변경</li>
			        <li>개인정보와 관련된 숫자, 연속된 숫자, 동일 반복된 숫자 등은 사용하지 마십시오</li>
		    	</ul>
		    </div>
		    <div id="modipy">비밀번호 수정</div>
		    <span id="smaillModipy">(보다 나은 서비스 제공을 위해 고객님의 변경된 정보를 수정해주세요.)</span>
		    <form action="${pageContext.request.contextPath}/pModify" method="post">
		    <div id="passwordModipy">
			    <div class="form-row">
			        <label for="current-pass">기존 비밀번호 *</label>
			        <input type="password" id="current-pass" name="current-pass" placeholder="비밀번호를 입력하세요.">
			    </div>
			    <div class="form-row">
			        <label for="new-pass">신규 비밀번호 *</label>
			        <input type="password" id="new-pass" name="new-pass" placeholder="신규 비밀번호를 입력하세요.">
			    </div>
			    <div class="form-row">
			        <label for="confirm-pass">확인 비밀번호 *</label>
			        <input type="password" id="confirm-pass" name="confirm-pass" placeholder="확인 비밀번호를 입력하세요.">
			    </div>
			</div>
			<div id="edit"><button type="submit">수정완료</button></div>
			</form>
			
			<c:if test="${not empty message}">
			    <div style="color:red; font-weight:bold; margin-top:10px;">
			        ${message}
			    </div>
			</c:if>
		</div>
    </div>
<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>
