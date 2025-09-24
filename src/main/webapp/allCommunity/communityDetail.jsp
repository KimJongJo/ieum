<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="css/communityDetail.css"></link>
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
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".comment-box").forEach(box => {
        const btn  = box.querySelector(".menu-button");
        const menu = box.querySelector(".userMenu");

        btn.addEventListener("click", e => {
            e.stopPropagation();
            // 모든 메뉴 닫기
            document.querySelectorAll(".userMenu").forEach(m => m.style.display = "none");
            // 현재 댓글 메뉴만 열기
            menu.style.display = "flex";
        });
    });

    // 바깥 클릭 시 모든 메뉴 닫기
    document.addEventListener("click", () => {
        document.querySelectorAll(".userMenu").forEach(m => m.style.display = "none");
    });
});
</script>


<script>

//완료 모달
document.addEventListener("DOMContentLoaded", () => {

 // 작성 완료 모달
    document.getElementById("btn-delete").addEventListener("click", () => {//btn-delete에 적용하고 싶은 버튼 id, class를 넣으시오
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
window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});
</script>


</head>
<body>
	<c:import url="../common/header/header.html" charEncoding="UTF-8"/>

    <div class="community">
        <div class="post-header">
            <h2>진로/취업</h2>
        </div>
        <div class="Title">
            <div id="title">지금 너무 힘들어오 진짜 쉬고 싶어요 씻으라고 계속 컴필 들어와서 ㅋㅋㅋ ㄴㄷㅇㅁㄴㅇㄹL</div>
            <div id="btn1">
                <button id="btn-update">수정</button>
                <button id="btn-delete">삭제</button>
            </div>
        </div>
        <div id="san"></div>
        <div id="nickANDdate">
            <div id="nickName">닉네임</div>
            <div id="data">2025-09-07</div>
        </div>
        <div id="content">
            작성자가 입력한 내용 (줄바꿈, 문단 유지)
        </div>
        <div class="actions">
				    <button class="action-item">
				        ❤️ <span class="action-count">15</span>
				    </button>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">100</span>
				    </span>
				</div>
        <div id="san"></div>
        <div class="comment-box">
		    <div class="comment-row">
		        <div id="row1">
		            <div id="number">1</div>
		            <div id="comNick">무명의 더쿠</div>
		            <div id="date">2025-09-18</div>
		            <!-- 점 3개 버튼 -->
		            <div class="menu-button">⋯</div>
		        </div>
		        <div id="comment">
		            작성자가 입력한 내용 (줄바꿈, 문단 유지)
		        </div>
		        <button class="comment-action-item">
				        ❤️ <span class="comment-action-count">15</span>
				</button>
		    </div>
		
		    <!-- ✅ 이 위치가 중요!!  comment-box 안쪽에 userMenu 삽입 -->
		    <div class="userMenu">
		        <div class="menu-item">신고하기</div>
		        <div class="menu-item">차단하기</div>
		    </div>
		</div>
			
        <div id="comment-write-box">
            <div id="comment-name">닉네임</div>
            <textarea id="comment-write"></textarea>
            <div id="btn2">
                <button id="btn2-registration">등록</button>
            </div>
        </div>
    </div>
    
    
    <!-- ✅ 모달 추가 (처음에는 숨김) -->
	<div class="modal-main-div" id="completeModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseComplete">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">삭제 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button class="modal-btn-left modal-btn" id="modalCancelComplete">취소</button>
	                <button class="modal-btn-right modal-btn" id="modalOkComplete">삭제</button>
	            </div>
	        </div>
	    </div>
	</div>

</body>
</html>

