<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="css/communityWrite.css"></link>
<style>

    
    .modal-main-div {
                display: flex;
                /* display: none; */

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
<script>
    function toggleCategory() {
    const categoryBox = document.getElementById("categoryBox");
    const arrow = document.querySelector(".arrow");
    const btn = document.querySelector(".category-btn");

    if (categoryBox.style.display === "block") {
        categoryBox.style.display = "none";
        arrow.classList.remove("rotate");
    } else {
        // 버튼 위치 계산
        const rect = btn.getBoundingClientRect();
        const scrollTop = window.scrollY || document.documentElement.scrollTop;
        const scrollLeft = window.scrollX || document.documentElement.scrollLeft;

        // 🔥 버튼 바로 옆에 위치시키기
        categoryBox.style.top  = (rect.top + scrollTop - 14) + "px";
        categoryBox.style.left = (rect.right + scrollLeft + 20) + "px"; // +10은 여백
        categoryBox.style.display = "block";

        arrow.classList.add("rotate");
    }
}

// ✅ 카테고리 클릭 시 버튼 텍스트 변경
document.addEventListener("DOMContentLoaded", () => {
    const categoryBox = document.getElementById("categoryBox");
    const categoryBtn = document.querySelector(".category-btn");

    categoryBox.querySelectorAll("span").forEach(span => {
        span.addEventListener("click", function() {
            categoryBtn.querySelector(".category-text").textContent = this.textContent;
            categoryBox.style.display = "none";
            document.querySelector(".arrow").classList.remove("rotate");
        });
    });
});
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

<script>

//완료 모달
document.addEventListener("DOMContentLoaded", () => {

 // 작성 완료 모달
    document.getElementById("btn-complete").addEventListener("click", () => {
        document.getElementById("completeModal").style.display = "flex";
    });
    ["modalCloseComplete", "modalCancelComplete", "modalOkComplete"].forEach(id => {
        document.getElementById(id).addEventListener("click", () => {
            document.getElementById("completeModal").style.display = "none";
        });
    });

});
</script>
<script>
//취소 모달
document.addEventListener('DOMContentLoaded', () => {

 // 작성 취소 모달
    document.getElementById("btn-cancellation").addEventListener("click", () => {
        document.getElementById("cancelModal").style.display = "flex";
    });
    ["modalCloseCancel", "modalCancelCancel", "modalOkCancel"].forEach(id => {
        document.getElementById(id).addEventListener("click", () => {
            document.getElementById("cancelModal").style.display = "none";
        });
    });
});

</script>
</head>
<body>

	<c:import url="../common/header/header.html" charEncoding="UTF-8"/>
	<!-- ✅ 중헤더 바로 밑에 텍스트 -->
	<div id="section-title">
		<div>
			<span>커뮤니티 작성</span>
		</div>
	</div>
	
	<div class="community-title">
	    <div id="title-header">
	        제목
	    </div>
	    <div class="category-btn" onclick="toggleCategory()">
		    <span class="category-text">카테고리</span> <span class="arrow"><<</span>
		</div>
	</div>
    
	<div class="community-content">
        <div id="title-wrtie">
            <input type="text" id="title" placeholder="제목" maxlength="1000">
        </div>
        <div id="content-header">
            내용
        </div>
		<div>
			<textarea id="content-write" placeholder="내용" maxlength="3000"></textarea>
		</div>
	</div>

    <div id="btn-event">
        <button id="btn-cancellation">작성 취소</button>
        <button id="btn-complete">작성 완료</button>
    </div>
	
	<!-- 작성 완료 모달 -->
	<div class="modal-main-div" id="completeModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseComplete">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">완료 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button class="modal-btn-left modal-btn" id="modalCancelComplete">취소</button>
	                <button class="modal-btn-right modal-btn" id="modalOkComplete">완료</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 작성 취소 모달 -->
	<div class="modal-main-div" id="cancelModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseCancel">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">작성 내용을 저장하지 않고 나가시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button class="modal-btn-left modal-btn" id="modalCancelCancel">취소</button>
	                <button class="modal-btn-right modal-btn" id="modalOkCancel">확인</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="category-box" id="categoryBox">
	    <p>사연 종류</p>
	    <span>육아/출산</span>
	    <span>금전/사업</span>
	    <span>LGBT</span>
	    <span>자아/성격</span>
	    <span>이별/이혼</span>
	    <span>성범죄</span>
	    <span>펫로스</span>
	    <span>학업/고시</span>
	    <span>성생활</span>
	    <span>대인관계/따돌림</span>
	    <span>외모</span>
	    <span>신체건강</span>
	    <span>정신건강</span>
	    <span>취업/진로</span>
	    <span>부부관계</span>
	    <span>직장</span>
	    <span>기타</span>
	</div>

</body>
</html>