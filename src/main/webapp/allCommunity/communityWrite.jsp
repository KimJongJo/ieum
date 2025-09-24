<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



    .community-title {
        width: 980px;
        margin: 0 auto;
        margin-top: 20px;
        border: 2px solid #d9d9d9;
        border-radius: 5px;
        padding: 10px;
        display: flex;
        justify-content: space-between; /* 제목 왼쪽 / 카테고리 오른쪽 */
        align-items: center;
        background-color: #E5E7ED;
    }
    
    .community-content {
        width: 1000px;
        height: 700px;
        margin: 0 auto;
        border: 2px solid #d9d9d9;
        border-radius: 5px;
        display: flex;
        flex-direction: column;   /* 🔥 세로 정렬 */
        justify-content: flex-start; /* 🔥 위쪽부터 배치 */
    }

    #title-header {
        font-weight: bold;
        font-size: 18px;
        border: none;        /* 테두리 제거 */
    	outline: none;       /* 포커스 시 테두리 제거 */
    	width:700px;
    	
    }

    #title {
        width: 100%;              /* 🔥 부모 div(.community-content)의 가로 크기와 동일 */
        box-sizing: border-box;   /* 패딩/테두리 포함해서 100% 유지 */
        border: 2px solid white;  /* 🔥 테두리 흰색 */
        background-color: white;   /* 배경색(필요 시 조절) */
        font-size: 18px;          /* 텍스트 크기 */
        outline: none;            /* 클릭 시 기본 아웃라인 제거 */
        height: 40px;
        font-size: 20px;
        padding: 5px;
    }

    #content-header{
        height: 30px;
        width: 980px;
        border: none;
        background-color: #E5E7ED;
        padding: 10px;
        font-weight: bold;
    }

    #content-write {
        font-size: 18px;
        border: none;        /* 테두리 제거 */
    	outline: none;       /* 포커스 시 테두리 제거 */
    	width: 980px;
        height: 590px;
        padding: 10px;
    }

    .category-btn {
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 5px;
        font-weight: bold;
    }

    .arrow {
        display: inline-block;
        transition: transform 0.3s ease; /* 회전 애니메이션 */
    }

    .arrow.rotate {
        transform: rotate(180deg);
    }

    /* 카테고리 드롭다운 */
    .category-box {
        position: absolute;   /* ✅ JS에서 좌표를 직접 넣기 위해 absolute */
        width: 250px;
        border: 1px solid #999;
        border-radius: 5px;
        padding: 10px;
        background: #fff;
        display: none;        /* 기본 숨김 */
        z-index: 1000;
    }

    .category-box p {
        margin: 0;
        font-size: 14px;
        font-weight: bold;
        color: purple;
    }

    .category-box span {
        display: inline-block;
        margin: 5px 10px 0 0;
        font-size: 14px;
        cursor: pointer;
    }

    .category-box span:hover {
        text-decoration: underline;
    }
    
    /* 공통 버튼 디자인 */
    #btn-event button {
        padding: 6px 15px;
        font-size: 12px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.25s ease;  /* 🔥 hover/active 부드러운 전환 */
    }

    /* 작성 취소 버튼 */
    #btn-cancellation {
        background-color: #E5E7ED;
        color: black;
        border: 1px solid #E5E7ED;
        width: 100px;
        height: 30px;
        border-radius: 5px;
    }
    #btn-cancellation:hover {
        transform: translateY(-3px); /* 위로 3px 이동 */
        background-color: #E5E7ED;       /* 기존 색 변화 유지 */
    }
    #btn-cancellation:active {
        transform: translateY(2px);  /* 아래로 2px 이동 */
        background-color: #E5E7ED;      /* 기존 색 변화 유지 */
    }

    /* 작성 완료 버튼 */
    #btn-complete {
        background-color: #488EF6;
        color: white;
        border: 1px solid #488EF6;
        width: 100px;
        height: 30px;
        border-radius: 5px;               /* 흰색 글씨 */
    }
    #btn-complete:hover {
        transform: translateY(-3px); /* 위로 3px 이동 */
        background-color: #488EF6;       /* 기존 색 변화 유지 */
    }
    #btn-complete:active {
        transform: translateY(2px);  /* 아래로 2px 이동 */
        background-color: #488EF6;      /* 기존 색 변화 유지 */
    }
    #btn-event {
        display: flex;
        justify-content: center;
        gap: 20px; /* 버튼 사이 간격 */
        margin: 20px 0 0 20px;

    }
    
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

	<!-- 헤더 위 검정 줄 (화면 전체) -->
	<div id="header-line-top"></div>
	
	<!-- Header 영역 (1280px 중앙) -->
	<div class="container">
	    <div class="header">
	        <div class="header-inner">
	            <div class="logo">건강이음</div>
	            <div class="menu">
	                <span>병원조회</span>
	                <span>상담예약</span>
	                <span>자가진단</span>
	                <span>커뮤니티</span>
	                <span>공지사항</span>
	                <span>마이페이지</span>
	            </div>
	        </div>
	    </div>
	</div>


	<!-- Middle Header 영역 (화면 전체) -->
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