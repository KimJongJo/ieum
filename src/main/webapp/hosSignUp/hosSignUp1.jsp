<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/hosSignUp/css/hosSignUp1.css" />
<title>Insert title here</title>
</head>
<body>
<c:import url="/common/header/header.html" charEncoding="UTF-8"/>
	<div class="main">
		<div class="main-div">
			<div class="chap-div">
				<div class="chapter">
						<div class="chapter-in">
							<div class="chapter-in-div yes">
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
							<div class="chapter-in-div no">
								<span>STEP 3</span> <i class="icon fa-regular fa-thumbs-up"></i>
							</div>
							<span>신청완료</span>
						</div>
					</div>
				</div>
				<div>
					<form action="/ieum/hosSignUp1" method="POST">
						<div class="info-box">
							<div class="line-div">
								<div class="span-div info-check-div">
									<span class="info" id=input-name>신청자 성명</span>
									<span class="i-span" id=requestName-span><i class="fa-solid fa-check span-check" id="requestName-i"></i></span>
								</div>
								<div class="input-div">
									<input type="text" class="input-div-input" id="requestName" name="requestName"/>
								</div>
							</div>
							<div class="line-div2">
								<div class="span-div2 info-check-div" >
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
							<div class="check-pw">
								<div class="span-div2-pw info-check-div">
									<span class="info">이메일</span>
									<span class="i-span" id=email-span><i class="fa-solid fa-check span-check" id="eamil-i"></i></span>
								</div>
								<div class="email-div-new">
									<table>
										<tr>
											<td>
												<div class="middle-div">
	                                                <input id="firstEmail" type="text" class="auth-div-input auth-div-email" />
	                                                <i class="fa-solid fa-at"></i>
	                                                <input id="directInput" type="text" class="auth-div-input auth-div-email" />
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
											<td><button type="button" class="btn" id="mailSendBtn">전송</button></td>
											<td></td>
										</tr>
	
										<tr>
											<td><input id="authCode" type="text" placeholder="인증코드 입력"
												class="auth-div-input input-id" /></td>
											<td><button type="button" class="btn" id="codeCheckBtn">인증</button></td>
											<td><span class="warning">*추후 등록된 이메일로 승인 등록코드 발송</span></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-div">
					<button class="no-btn" type=button>취소</button>
					<button class="sign-btn" id="nextBtn">다음으로</button>
				</div>
			</form>
		</div>
		</div>
	</div>

<c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/hosSignUp/js/hosSignUp1.js"></script>
</body>
</html>