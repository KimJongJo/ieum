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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/blackList.css" />
<script src="${pageContext.request.contextPath}/myPage/css/blackList.js"></script>


<style>
    .modal-main-div {
                display: flex;
                /* display: none; */
				z-index: 1000;
                width: 100%;
                height: 100%;
                background-color: rgba(217, 217, 217, 0.7);
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                justify-content: center;
                align-items: center;
            }
            .modal-div-over {
                background-color: white;
                width: 380px;
                /* height: 190px; */
                border: 1px solid #ededee;

                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                border-radius: 8px;
            }

            .modal-header-div {
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
                width: 340px;
                margin-bottom: 40px;
            }

            .modal-header-div-span {
                font-weight: bold;
                font-size: 16px;
            }

            .modal-content-div {
                width: 320px;
                margin-bottom: 20px;
            }

            .modal-content-div-span {
                font-size: 12px;
            }

            .modal-btn-div {
                width: 340px;
                display: flex;
                justify-content: flex-end;
                margin-top: 15px;
                margin-bottom: 15px;
            }

            .modal-btn {
                width: 65px;
                height: 30px;
                margin-left: 8px;
                border-radius: 3px;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .modal-btn-left {
                color: black;
                background-color: white;
                border: 0.5px solid #b7b7b7;
            }

            .modal-btn-left:hover {
                background-color: #ededee;
            }

            .modal-btn-right {
                color: white;
                background-color: #488ef6;
                border: none;
            }

            .modal-btn-right:hover {
                background-color: #4356b3;
            }

            .modal-div-under {
                width: 100%;
                height: 100%;
                border-top: 1px solid #ededee;
                display: flex;
                align-items: center;
            }

            .x-button {
                background-color: transparent;
                border: none;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .x-button:hover {
                background-color: #ededee;
                border-radius: 5px;
            }
</style>
<style>
/* 전체 레이아웃 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #ffffff;
}


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
        margin: 20px auto 0 auto; 
        display: flex;
        gap: 40px;
        align-items: flex-start; /* 높이 정렬 */
        grid-template-columns: repeat(2, 1fr); /* 2열 */
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

    

    .boxes {
        display: flex;
        gap: 20px; /* 두 박스 사이 간격 */
    }

    .boxes {
        position: relative;
        width: 100%;
        max-width: 500px;
        background-color: #F6F8FE;
        border-radius: 15px;
        border: 2px solid #d9d9d9;
        padding: 15px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    /* 닉네임 */
    .text-wrapper-1 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 12px;
        color: #000;
    }

    /* 카테고리 */
    .text-wrapper-2 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 14px;
        color: #000;
        font-weight: bold;
    }

    /* 업로드 날짜 */
        .text-wrapper-3 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 12px;
        color: #000;
        }

    /* 버튼 스타일 */
    .unblock-btn {
        padding: 6px 12px;
        border: 1px solid red;
        border-radius: 6px;
        background-color: #F6F8FE;
        color: red;
        font-size: 13px;
        cursor: pointer;
    }

    #btn:hover {
        background-color: #84A2FE;
    }

</style>
<script type="text/javascript">
$(function () {
    // 1️⃣ '관리 메뉴' 숨기기
    $(".menu span:nth-child(5)").hide();

    // 2️⃣ 탭 클릭 시 active 바꾸기
    $(".tab").on("click", function() {
        $(".tab").removeClass("active"); // 모든 탭에서 active 제거
        $(this).addClass("active");      // 클릭한 탭에 active 추가
    });
});




$(document).ready(function () {
    // 차단 해제 버튼 클릭
    $(document).on("click", ".unblock-btn", function (e) {
        e.preventDefault(); // 폼 제출 막기
        $("#completeModalBlack").fadeIn(); // 모달 열기

        // 클릭한 버튼의 폼 저장
        window.currentForm = $(this).closest("form");
    });

    // 모달 닫기 (X 버튼, 취소 버튼)
    $("#modalCloseCompleteBlack, #modalCancelCompleteBlack").click(function () {
        $("#completeModalBlack").fadeOut();
    });

    // 모달 확인 버튼 클릭 시 폼 제출
    $("#modalOkCompleteBlack").click(function () {
        if(window.currentForm) {
            window.currentForm.submit(); // 실제 POST 요청
        }
        $("#completeModalBlack").fadeOut();
    });
});


$(document).ready(function() {
    $('.hide-if-user').hide();
});
</script>
</head>
<body>

    <c:import url="/common/header/header.html" charEncoding="UTF-8"/>
    <!-- Section Title -->
    <div id="section-title">
        <span>차단 목록</span>
    </div>

    <!-- 메인 컨테이너: 1280px 중앙 고정 -->
    <div class="main-container">
        
        <!-- Sidebar -->
        <div class="container-two">
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
					        <a href="/ieum/pInfo"><li><button type="button">나의 기본 정보</button></li></a>
					        <li><button type="button">예약 내역</button></li>
					        <a href="/ieum/myPage/diagnosisHistory"><li><button type="button">진단 이력</button></li></a>
					        <a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
					        <a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
					        <li><button type="button">다이어리</button></li>
					        <li><button type="button">즐겨찾는 병원</button></li>
					    </ul>
	                </div>
	            </div>
	        </div>
        </div>
        

            <!-- 오른쪽 박스 컨테이너 -->
        <c:forEach var="blackMember" items="${blackMember}" varStatus="status">
        <div class="boxes">
        
            <!-- 닉네임 -->
            <div class="text-wrapper-1">
            	<c:out value="${blackMember.nickname}" default="성명"/>
            </div>

            <!-- 이메일 + 버튼 같은 줄 -->
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <div class="text-wrapper-2">
                	<c:out value="${blackMember.email}" default="이메일"/>
                </div>
               <!-- form POST 방식 -->
	            <form action="${pageContext.request.contextPath}/black" method="post">
				    <input type="hidden" name="blockedNo" value="${blackMember.blockedNo}"/>
				    <button type="submit" class="unblock-btn">차단 해제</button>
				</form>
            </div>

            <!-- 업로드 날짜 -->
            <div class="text-wrapper-3">
            	<c:out value="${blackMember.blackCreated}" default="차단닐짜"/>
            </div>
        
        </div>
		</c:forEach>
    </div>
    
    <!-- 차단헤제 모달 -->
    <div class="modal-main-div" id="completeModalBlack" style="display:none;">
        <div class="modal-div-over">
            <div class="modal-header-div">
                <span class="modal-header-div-span">알림</span>
                <button type="button" class="x-button" id="modalCloseCompleteBlack">✖</button>
            </div>
            <div class="modal-content-div">
                <span class="modal-content-div-span">차단해제 하시겠습니까?</span>
            </div>
            <div class="modal-div-under">
                <div class="modal-btn-div">
                    <button type="button" class="modal-btn-left modal-btn" id="modalCancelCompleteBlack">취소</button>
                    <button type="button" class="modal-btn-right modal-btn" id="modalOkCompleteBlack">해제</button>
                </div>
            </div>
        </div>
    </div>
    
    <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>