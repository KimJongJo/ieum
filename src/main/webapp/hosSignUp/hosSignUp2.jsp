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
<link rel="stylesheet" href="${pageContext.request.contextPath}/hosSignUp/css/hosSignUp2.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
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
						<div class="chapter-in-div yes">
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
				<form action="/ieum/hosSignUp2" method="POST" enctype="multipart/form-data">
					<div class="info-box">
						<div class="line-div">
						    <div class="span-div info-check-div">
						        <span class="info" id=input-name>병원사진</span>
						        <span class="i-span" id=hosImg-span><i class="fa-solid fa-check span-check" id="hosImg-i"></i></span>
						    </div>
						    <div class="input-div">
						    	<div class="left-div">
						    		<div class="left-div-in-div">
								        <!-- 숨긴 input -->
								        <input name="hosImgFile" type="file" id="imgInput" accept="image/*" style="display:none;">
								        <!-- 커스텀 버튼 -->
								        <button type="button" id="imgSelectBtn" class="select-file-btn">📂 파일 선택</button>
								        <!-- 선택 파일명 표시 -->
								        <span id="imgFileName">선택된 파일 없음</span>
							        </div>
							        <!-- 미리보기 이미지 -->
							        <img id="preview" src="" alt="미리보기" style="width:300px; height: 170px; display:none; margin-top:10px;">
						        </div>
						    </div>
						</div>
						
						<div class="line-div2">
							<div class="span-div2 info-check-div">
								<span class="info" id=input-name>병원명</span>
								<span class="i-span" id=hosName-span><i class="fa-solid fa-check span-check" id="hosName-i"></i></span>
							</div>
							<div class="input-div2">
								<input type="text" class="input-div-input" id="hosName" name="hosName"/>
								<span class="nick-content">2 ~ 50자 한글/영문/숫자/-,& 가능</span>
							</div>
						</div>
						
						<div class="line-div2">
							<div class="span-div2 info-check-div">
								<span class="info" id=input-nickname>병원 카테고리</span>
								<span class="i-span" id=hosCate-span><i class="fa-solid fa-check span-check" id="hosCate-i"></i></span>
							</div>
							<div class="input-div2 input">
								<select
									name="hosCategory" class="auth-div-input auth-div-email marL20"
									id="hosCate">
									<option value="none">선택</option>
									<option value="1">종합병원</option>
									<option value="2">상급종합병원</option>
									<option value="3">정신요양시설</option>
									<option value="4">자살예방센터</option>
									<option value="5">정신재활시설</option>
									<option value="6">국립</option>
									<option value="7">의원</option>
									<option value="8">공립</option>
									<option value="9">병원</option>
									<option value="10">보건소</option>
									<option value="11">중독통합관리 지원센터</option>
									<option value="12">광역정신건강 복지센터</option>
									<option value="13">기초정신건강 복지센터</option>
								</select>
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
						
						<div class="line-div2">
							<div class="span-div2 info-check-div">
								<span class="info">병원 전화번호</span>
								<span class="i-span" id=tel-span><i class="fa-solid fa-check span-check" id="tel-i"></i></span>
							</div>
							<div class="input-div2 input tel-div">
                                <input type="tel" size="4" maxlength="4" class="tel" id="inputTel1" name="tel1"/>
                                <span class="telspace">―</span>
                                <input type="tel" size="4" maxlength="4" class="tel" id="inputTel2" name="tel2"/>
                                <span class="telspace">―</span>
                                <input type="tel" size="4" maxlength="4" class="tel" id="inputTel3" name="tel3"/>
                            </div>
						</div>
						
						<div class="line-div2">
							<div class="span-div2">
								<span class="info">병원 휴무일</span>
							</div>
							<div class="input-div2 input tel-div">
								<div class="weekdays">
								  <label class="leftMar">
								    <input type="checkbox" name="weekday" value="월" />
								    월
								  </label>
								  <label class="leftMar">
								    <input type="checkbox" name="weekday" value="화" />
								    화
								  </label>
								  <label class="leftMar">
								    <input type="checkbox" name="weekday" value="수" />
								    수
								  </label>
								  <label class="leftMar">
								    <input type="checkbox" name="weekday" value="목" />
								    목
								  </label>
								  <label class="leftMar">
								    <input type="checkbox" name="weekday" value="금" />
								    금
								  </label>
								  <label class="leftMar">
								    <input type="checkbox" name="weekday" value="토" />
								    토
								  </label>
								  <label class="leftMar">
								    <input type="checkbox" name="weekday" value="일" />
								    일
								  </label>
								</div>
							</div>
						</div>
						<div class="line-div2">
							<div class="span-div2">
								<span class="info">편의 서비스</span>
							</div>
							<div class="input-div2 input tel-div">
								<div class="weekdays">
								    <label class="leftMar"><input type="checkbox" name="services" value="주차">주차</label>
							        <label class="leftMar"><input type="checkbox" name="services" value="발렛 파킹"> 발렛 파킹</label>
						            <label class="leftMar"><input type="checkbox" name="services" value="남녀 화장실 구분"> 남녀 화장실 구분</label>
					                <label class="leftMar"><input type="checkbox" name="services" value="무료 Wi-Fi"> 무료 Wi-Fi</label>
				                    <label class="leftMar"><input type="checkbox" name="services" value="카페 / 편의점"> 카페 / 편의점</label>
			                        <label class="leftMar"><input type="checkbox" name="services" value="ATM / 은행"> ATM / 은행</label>
								</div>
							</div>
						</div>
						
						<div class="line-div2">
							<div class="span-div2">
								<span class="info">실손24 서비스</span>
							</div>
							<div class="input-div2 input tel-div">
								<div class="weekdays">
								  <label class="leftMar">
								    <input type="radio" name="service" value="yes" />
								    제공
								  </label>
								  <label class="leftMar">
								    <input type="radio" name="service" value="no" checked />
								    미제공
								  </label>
								</div>
							</div>
						</div>
						
						<div class="line-div2">
							<div class="span-div2 info-check-div">
								<span class="info" id=input-nickname>사업자등록번호</span>
								<span class="i-span" id=requestNo-span><i class="fa-solid fa-check span-check" id="requestNo-i"></i></span>
							</div>
							<div class="input-div2 input tel-div">
								<input type="tel" size="3" maxlength="3" class="tel" id=requestNo1 name="requestNo1" />
								<span class="telspace">―</span>
								<input type="tel" size="2" maxlength="2" class="tel" id=requestNo2 name="requestNo2" />
								<span class="telspace">―</span>
								<input type="tel" size="5" maxlength="5" class="tel" id=requestNo3 name="requestNo3" />
							</div>
						</div>
						
						
						<div class="line-div2">
							<div class="span-div2 info-check-div">
								<span class="info" id=hosSignFile>사업자등록증</span>
								<span class="i-span" id=fileInput-span><i class="fa-solid fa-check span-check" id="fileInput-i"></i></span>
							</div>
							<div class="input-div2 input">
							  <input name="hosFile" type="file" class="file-input" id="fileInput" />
							  <button class="select-file-btn marL20" id="selectFileBtn" type="button">📂 파일 선택</button>
							  <span class="file-name" id="fileName">선택된 파일 없음</span>
							</div>
						</div>
						
						<input name="hos_y" type="hidden" id="hos_y">
						<input name="hos_x" type="hidden" id="hos_x">

					</div>
			</div>

		</div>
		<div class="btn-div">
			<button class="no-btn" type=button>취소</button>
			<button class="sign-btn" id="signUp-btn">제출하기</button>
		</div>
		</form>
	</div>
	</div>
	</div>


	<script type="text/javascript" 
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/hosSignUp/js/hosSignUp2.js"></script>

</body>
</html>