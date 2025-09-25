<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/hosSignUp.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<div class="main-div">
			<div class="chap-div">
				<div class="chapter">
					<div class="chapter-in">
						<div class="chapter-in-div no">
							<span>STEP 1</span> <i class="icon fa-regular fa-envelope-open"></i>
						</div>
						<span>정보입력</span>
					</div>
					<div class="arrow">
						<i class="fa-solid fa-arrow-right"></i>
					</div>
				</div>
				<div class="chapter">
					<div class="chapter-in">
						<div class="chapter-in-div yes">
							<span>STEP 2</span> <i class="icon fa-regular fa-comment-dots"></i>
						</div>
						<span>관리자승인</span>
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
						<span>가입완료</span>
					</div>
				</div>
			</div>
			<div>
				<form action="">
					<div class="info-box">
						<div class="line-div">
							<div class="span-div">
								<span class="info" id=input-name>병원명</span>
							</div>
							<div class="input-div">
								<input type="text" class="input-div-input" />
							</div>
						</div>
						<div class="line-div2">
							<div class="span-div2">
								<span class="info" id=input-nickname>신청자</span>
							</div>
							<div class="input-div2 input">
								<input type="text" class="input-div-input" />

							</div>
						</div>
						<div class="line-div2">
							<div class="span-div2">
								<span class="info">전화번호</span>
							</div>
							<div class="input-div2 input tel-div">
								<input type="tel" size="4" value="010" disabled class="tel" />
								<span class="telspace">―</span> <input type="tel" size="4"
									maxlength="4" class="tel" id=input-tel1 /> <span
									class="telspace">―</span> <input type="tel" size="4"
									maxlength="4" class="tel" id=input-tel2 />
							</div>
						</div>
						<div class="check-pw">
							<div class="span-div2-pw">
								<span class="info">이메일</span>
							</div>
							<div>
								<table>
									<tr>
										<td>
											<div class="middle-div">
												<input type="text" class="auth-div-input auth-div-email" />
												<i class="fa-solid fa-at"></i> <input type="text"
													class="auth-div-input auth-div-email" /> <span></span> <select
													name="email_domain" class="auth-div-input auth-div-email"
													id="select">
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
										<td><button class="btn">전송</button></td>
										<td></td>
									</tr>

									<tr>
										<td><input type="text" placeholder="인증코드 입력"
											class="auth-div-input input-id" /></td>
										<td><button class="btn">인증</button></td>
										<td><span class="warning">*추후 등록된 이메일로 승인 등록코드 발송</span></td>
									</tr>
								</table>
							</div>

						</div>
						<div class="check-pw">
							<div class="span-div2-pw">
								<span class="info">주소</span>
							</div>
							<div class="input-div2-pw input">
								<div class="input-div2-pw-div">
									<input type="text" class="login-input" id="postcode" disabled />
									<button class="signUp-btn" onclick="searchAddr()"
										id="search-postcode" type="button">주소 검색</button>
								</div>
								<div class="address-div">
									<input type="text" class="first-address addr" id="address-auto"
										disabled /> <input type="text" class="detail-address addr"
										id="address-detail" placeholder="상세 주소를 입력해주세요." />
								</div>
							</div>
						</div>
						<div class="line-div2">
							<div class="span-div2">
								<span class="info" id=input-nickname>사업자등록증</span>
							</div>
							<div class="input-div2 input">
								<input type="text" class="login-input" id="postcode" disabled />
								<button class="signUp-btn" id="pwch2" type="button">첨부파일</button>
							</div>
						</div>

					</div>
			</div>

		</div>
		<div class="btn-div">
			<button class="sign-btn" type=button id="signUp-btn">제출하기</button>
			<button class="no-btn" type=button>취소</button>
		</div>
		</form>
	</div>
	</div>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        function searchAddr() {

            new daum.Postcode({
                oncomplete: function (data) {

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