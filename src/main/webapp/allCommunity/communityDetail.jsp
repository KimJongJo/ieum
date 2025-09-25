<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="..css/modal.css"></link>
<link rel="stylesheet" href="../css/footer.css"></link>
<link rel="stylesheet" href="css/communityDetail.css"></link>


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

