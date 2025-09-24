<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="css/profileInfoModify.css"></link>
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

    <c:import url="../common/header/header.html" charEncoding="UTF-8"/>

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
