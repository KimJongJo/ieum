<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/* 전체 레이아웃 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #ffffff;
}
.container {
    width: 1280px;
    margin: 0 auto; /* 화면 가운데 정렬 */
}


/* 헤더 위쪽 검정색 줄 (화면 전체 폭) */
#header-line-top {
    position: absolute; 
    top: 31px;
    left: 0;
    right: 0;
    height: 2px;
    background-color: black;
}

/* 헤더 */
.header {
    height: 120px;
    display: flex;
    align-items: center;
    background-color: #fff;
    padding: 0 20px;
}

.header-inner {
    display: flex;
    align-items: center;
    width: 100%;
    max-width: 1280px;
    margin: 15px auto 0 auto;
}
/* 숨기고 싶은 메뉴 */
.header .menu span.hidden {
    visibility: hidden; /* 안 보이지만 자리 유지 */
}
.header .logo {
    font-size: 27.5px;
    font-weight: bold;
    color: #0044cc;
}

.header .menu {
    display: flex;   /* 한 줄로 가로 정렬 */
    gap: 100px;       /* 메뉴 간격 */
    align-items: center;
    margin-left:100px;
}
.menu .optional {
    display: none; /* 자리를 없애고, 오른쪽 메뉴가 한 칸씩 당겨짐 */
}

/* 중 헤더 (화면 전체 폭) */
.middle-header {
    width: 100%;
    height: 90px;
    position: relative;
    margin-top: 20px;
}

.middle-header .full-rect {
    width: 100%;
    height: 120px;
    background-color: #EBF3FF;
    position: absolute;
    bottom: 0;
    right: 0;
    z-index: 0;
}

.middle-header .group {
    display: flex;
    align-items: center;
    position: absolute;
    bottom: 0;
    right: 0;
}

/* 원/사각형 디자인 */
.middle-header .outer-circle {
    width: 110px;
    height: 110px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: -36px;
}
.middle-header .inner-circle {
    width: 55px;
    height: 55px;
    border-radius: 50%;
}
.middle-header .rectangle {
    height: 120px;
    position: relative; 
    z-index: 1; 
}
.middle-header .xlarge-rect { width: 600px; background-color: #D4E5FF; }
.middle-header .large-rect  { width: 400px; background-color: #92BEFF; }
.middle-header .small-rect  { width: 200px; background-color: #488EF6; }
.middle-header .small { z-index: 4; }
.middle-header .large { z-index: 3; }
.middle-header .xlarge { z-index: 2; }
.middle-header .xlarge-circle { background-color: #D4E5FF; }
.middle-header .large-circle  { background-color: #92BEFF; }
.middle-header .small-circle  { background-color: #488EF6; }
.middle-header .xlarge-inner { background-color: #EBF3FF; }
.middle-header .large-inner  { background-color: #D4E5FF; }
.middle-header .small-inner  { background-color: #92BEFF; }

/* 섹션 타이틀 */
#section-title {
    width: 800px;
    font-size: 20px;
    color: #333;
    margin: 20px auto 0 auto;
    font-weight: 700;
    background-color: #fff;
    display: flex;
    justify-content: space-between;
}

/* ✅ 메인 영역 - 1280px 중앙 고정 */
.main-container {
    width: 1280px;
    margin: 20px auto 0 auto; /* 위 60px 띄우고 가운데 정렬 */
    display: flex;
    gap: 40px; /* 사이 간격 */
}

/* 사이드바 */
.sidebar {
    width: 195px;
    height: 550px;
    border: 1px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
}
.sidebar-header {
    background-color: #4a64d6;
    color: white;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    height: 114px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    line-height: 1.6;
}
.welcome {
    background-color: #e9ebf5;
    text-align: left;
    padding: 15px 15px;
    border-bottom: 1px solid #ccc;
}
.welcome strong {
    display: block;
    font-size: 14px;
    margin-bottom: 6px;
}
.welcome span {
    font-size: 12px;
    color: #555;
}
.sidebar-body ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
.sidebar-body ul li {
    padding: 0; /* li 자체 여백 제거 */
    border-top: 1px solid #ccc;
}

.sidebar-body ul li button {
    width: 100%; /* li 전체 넓이 차지 */
    height: 48px; /* 기존 li 높이와 동일 */
    line-height: 48px;
    text-align: left;
    font-size: 14px;
    border: none;
    background-color: #fff;
    cursor: pointer;
    padding: 0 16px; /* 기존 li 좌우 여백 유지 */
}

.sidebar-body ul li button:hover {
    background-color: #f7f7f7;
}

/* 클릭 시 살짝 눌리는 효과 */
.sidebar-body ul li button:active {
    transform: translateY(2px);
    filter: brightness(90%);
}
/* 메인 컨텐츠 */
.container-three {
    flex: 1; /* 남은 공간 차지 */
}



/* 텍스트 박스 */
#text-box {
    width: 100%;
    padding: 20px;
    background-color: #F7FAFF;
    border: 1px solid #ccc;
    border-radius: 8px;
    margin-bottom: 10px;
}
#text-box h3 {
    margin: 0 0 10px 0;
    font-size: 18px;
    color: #333;
}
#text-box li {
    list-style-type: disc;
    color: #555;
}

/* 정보 수정 */
#modipy {
    margin: 20px 0 0 5px;
    font-size: 18px;
    font-weight: 700;
}
#smaillModipy {
    font-size: 12.5px;
    margin: 0 0 0 5px;
    color: #555;
}
#passwordModipy {
    border: 1px solid #d9d9d9;
    width: 100%;
    height: 640px;
    border-radius: 8px;
    padding: 20px;
    margin-top: 10px;
}
.form-row {
    display: flex;
    align-items: center;
    margin-bottom: 34.5px;
}
.form-row label {
    width: 150px;
    font-weight: 700;
    font-size: 14px;
}
.form-row input {
    width: 250px;
    height: 20px;
    padding: 5px 10px;
    font-size: 13px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #e1e8ff;
    margin-left: 60px;
}
.form-row input::placeholder {
    color: #999;
    font-size: 12px;
}
.form-row button {
    height: 34px;
    margin-left: 60px;
    font-size: 13px;
    border: 1px solid #d9d9d9;
    border-radius: 4px;
    background-color: #d9d9d9;
    color: #fff;
    cursor: pointer;
}
.form-row1 {
    display: flex;
    align-items: center;
    margin-bottom: 34.5px;
}
.form-row1 label {
    width: 150px;
    font-weight: 700;
    font-size: 14px;
}
.form-row1 input {
    width: 20px;
    height: 15px;
    font-size: 13px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #e1e8ff;
    margin-left: 50px;
}

#postcode-btn {
    height: 30px;
    padding: 0 10px;
    background-color: #E5E7ED;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 13px;
    color: black;
    transition: all 0.3s ease;
}

#postcode-btn:hover {
    background-color: #d9d9d9; /* 호버 시 색 변화 */
    transform: scale(1.05); /* 약간 커짐 */
    box-shadow: 0 3px 8px rgba(0,0,0,0.2);
}

#postcode-btn:active {
    transform: translateY(2px); /* 클릭 시 눌림 효과 */
    filter: brightness(90%);
    box-shadow: inset 0 2px 5px rgba(0,0,0,0.2);
}
.checkbox-group {
    display: flex;
    gap: 20px;
    margin-left: 10px;
}
#name{
    margin-left: 60px;

}

#edit {
    margin-top: 30px;
    text-align: center; /* 추가 */
}

#edit button {
    width: 100px;
    height: 36px;
    border-radius: 5px;
    color: white;
	background-color: #488EF6;
    border: none;
    cursor: pointer;
}

#btn1{
	color: black;
	background-color: #E5E7ED;
	border: 1px solid #E5E7ED;
}

#btn1:hover{
	filter: brightness(90%); /* 10% 어둡게 */
    transform: translateY(-2px); /* 살짝 떠 있는 느낌 */
}
#btn2:hover{
	filter: brightness(90%); /* 10% 어둡게 */
    transform: translateY(-2px); /* 살짝 떠 있는 느낌 */
}
#btn1:active{
	transform: translateY(2px); /* 눌린 느낌 */
    box-shadow: inset 0 2px 5px rgba(0,0,0,0.2); /* 안쪽 그림자 */
    filter: brightness(80%); /* 조금 더 어둡게 */
}
#btm2:active{
	transform: translateY(2px); /* 눌린 느낌 */
    box-shadow: inset 0 2px 5px rgba(0,0,0,0.2); /* 안쪽 그림자 */
    filter: brightness(80%); /* 조금 더 어둡게 */
}

#profile-upload-box {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-left: 55px;
}

#profile-preview {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    overflow: hidden;
    border: 1px solid #488EF6;
}

#profile-preview img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#uploadBtn {
    height: 32px;
    font-size: 12px;
    background-color: #488EF6;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

#uploadBtn:hover {
    filter: brightness(90%);
}

#uploadBtn:active {
    transform: translateY(2px);
    filter: brightness(80%);
}

</style>

<script>
window.addEventListener('DOMContentLoaded', () => {
    const uploadBtn = document.getElementById('uploadBtn');
    const profileInput = document.getElementById('profileInput');

    // 업로드 버튼 클릭 시 파일 선택 창 열기
    uploadBtn.addEventListener('click', function() {
        profileInput.click();
    });

    // 파일 선택 시 미리보기 적용
    profileInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = function(e) {
            document.querySelector('#profile-preview img').src = e.target.result;
        }
        reader.readAsDataURL(file);

        // 같은 파일도 다시 선택할 수 있도록 input 초기화
        profileInput.value = '';
    });

    // 기존 '관리 메뉴' 숨기기 코드
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) manageMenu.style.display = 'none';
});

// 다음 우편번호 찾기
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>

<script>
window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});
</script>
<!-- <input type="text" id="extraAddress" placeholder="참고항목"> -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                /* // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                } */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /* document.getElementById('postcode').value = data.zonecode; */
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>

    <!-- 헤더 위 검정 줄 -->
    <div id="header-line-top"></div>
    
    <!-- Header -->
    <div class="container">
        <div class="header">
            <div class="header-inner">
                <div class="logo">건강이음</div>
                <div class="menu">
                    <span>병원조회/예약</span>
                    <span>자가진단</span>
                    <span>커뮤니티</span>
                    <span>공지사항</span>
                    <span>관리 메뉴</span>
                    <span>마이페이지</span>
                </div>
            </div>
        </div>
    </div>


    <!-- Middle Header -->
    <div class="middle-header">
        <div class="full-rect"></div>
        <div class="group xlarge">
            <div class="outer-circle xlarge-circle">
                <div class="inner-circle xlarge-inner"></div>
            </div>
            <div class="rectangle xlarge-rect"></div>
        </div>
        <div class="group large">
            <div class="outer-circle large-circle">
                <div class="inner-circle large-inner"></div>
            </div>
            <div class="rectangle large-rect"></div>
        </div>
        <div class="group small">
            <div class="outer-circle small-circle">
                <div class="inner-circle small-inner"></div>
            </div>
            <div class="rectangle small-rect"></div>
        </div>
    </div>

    <!-- Section Title -->
    <div id="section-title">
        <span>나의 기본 정보</span>
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
                <div class="sidebar-body">
                     <ul>
				        <li><button type="button">나의 기본 정보</button></li>
				        <li><button type="button">예약 내역</button></li>
				        <li><button type="button">진단 이력</button></li>
				        <li><button type="button">나의 커뮤니티</button></li>
				        <li><button type="button">차단 목록</button></li>
				        <li><button type="button">다이어리</button></li>
				        <li><button type="button">즐겨찾는 병원</button></li>
				    </ul>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container-three">
            <div id="text-box">
                <h3>나의 정보 수정 이용 가능한 서비스</h3>
                <ul>
                    <li>회원 기본정보 관리(닉네임, 주소, 연락처, 이메일, 다이어리 공개 여부)</li>
                </ul>
            </div>
            <div id="modipy">나의 정보 수정</div>
            <span id="smaillModipy">(보다 나은 서비스 제공을 위해 고객님의 변경된 정보를 수정해주세요.)</span>
            
            <div id="passwordModipy">
            	<!-- 기존 성명 아래에 추가 -->
				<div class="form-row" style="align-items: center;">
				    <label>프로필 사진</label>
				    <div id="profile-upload-box">
				        <div id="profile-preview">
				            <img src="profile_default.png">
				        </div>
				        <input type="file" id="profileInput" accept="image/*" style="display:none;">
				        <button type="button" id="uploadBtn">이미지 선택</button>
				    </div>
				</div>
                <div class="form-row">
                    <label>성명</label>
                    <span id="name">최지성</span>
                </div>
                <div class="form-row">
                    <label>닉네임</label>
                    <input type="text" id="nickName" placeholder="닉네임">
                </div>
                <div class="form-row">
                    <label>이메일 *</label>
                    <input type="email" id="email" placeholder="이메일">
                </div>
                <div class="form-row">
                    <label>비밀번호 *</label>
                    <button id="btn1">비밀번호 변경</button>
                </div>
                <div class="form-row">
                    <label>전화번호 *</label>
                    <input type="tel" id="tel" placeholder="전화번호">
                </div>
                <div class="form-row" style="align-items: flex-start;">
				    <label>주소</label>
				    <div style="display: flex; flex-direction: column; gap: 5px;">
				        <!-- 첫 줄: 우편번호 + 버튼 -->
				        <div style="display: flex; gap: 5px; width:50px; margin-bottom:20px;">
				            
				            <input type="button" id="postcode-btn" onclick="execDaumPostcode()" value="우편번호 찾기" style="height: 30px;">
				        </div>
				        <!-- 두 번째 줄: 주소 + 상세주소 -->
				        <div style="display: flex;">
				            <input type="text" id="address" placeholder="주소" readonly style="width: 250px;">
				            <input type="text" id="detailAddress" placeholder="상세주소" style="width: 200px;">
				        </div>
				    </div>
				</div>
                <div class="form-row1">
                    <label>성별</label>
                    <div class="checkbox-group">
                        <label><input type="radio" name="gender" value="male"> 남</label>
                        <label><input type="radio" name="gender" value="female"> 여</label>
                    </div>
                </div>
                
                <div class="form-row1">
                    <label>다이어리 공개 여부</label>
                    <div class="checkbox-group">
                        <label><input type="radio" name="diary-public" value="yes"> 네</label>
                        <label><input type="radio" name="diary-public" value="no"> 아니오</label>
                    </div>
                </div>
            </div>
            <div id="edit">
                <button id="btn2">수정완료</button>
            </div>
        </div>
    </div>
    
</body>
</html>
