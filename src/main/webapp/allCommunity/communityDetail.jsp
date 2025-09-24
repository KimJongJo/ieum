<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
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

    .community {
        width: 1000px;
        margin: 10px auto;
    }

    .post-header {
        display: flex;
        margin-bottom: 10px;
    }

    .post-header h2 {
        font-size: 15px;
        margin: 0;
        font-weight: 400;
    }

    .post-meta {
        color: #999;
        font-size: 14px;
    }

    .Title {
        font-size: 16px;
        line-height: 1.6;
        margin-bottom: 10px;
        justify-content: space-between;
        display: flex;
    }
    #title{
        font-size: 16px;
        font-weight: 700;
    }
    #btn1 button {
        transition: all 0.2s ease; /* 움직임과 색 변화 부드럽게 */
    }
    #btn-update{
        background-color: #E5E7ED;
        color: black;
        border: 1px solid #E5E7ED;
        width: 100px;
        height: 30px;
        border-radius: 5px;
    }

    #btn-delete{
        background-color: #488EF6;
        color: white;
        border: 1px solid #488EF6;
        width: 100px;
        height: 30px;
        border-radius: 5px;
    }

    /* 마우스 올렸을 때 살짝 위로 이동 */
    #btn-delete:hover {
        transform: translateY(-3px); /* 위로 3px 이동 */
        background-color: #488EF6;       /* 기존 색 변화 유지 */
    }

    /* 클릭 시 눌린 듯 들어가게 */
    #btn-delete:active {
        transform: translateY(2px);  /* 아래로 2px 이동 */
        background-color: #488EF6;      /* 기존 색 변화 유지 */
    }
    
    /* 마우스 올렸을 때 살짝 위로 이동 */
    #btn-update:hover {
        transform: translateY(-3px); /* 위로 3px 이동 */
        background-color: #E5E7ED;       /* 기존 색 변화 유지 */
    }

    /* 클릭 시 눌린 듯 들어가게 */
    #btn-update:active {
        transform: translateY(2px);  /* 아래로 2px 이동 */
        background-color: #E5E7ED;      /* 기존 색 변화 유지 */
    }

    #san {
        width: 1000px;
        border: 2px solid gray;
    }
    #nickANDdate {
        width: 980px;
        height: 40px; /* 높이를 충분히 줍니다 */
        background-color: #E5E7ED;
        display: flex;
        align-items: center;       /* 세로 가운데 정렬 */
        border: 2px solid #E5E7ED;
        padding: 0 10px;           /* 좌우 여백 */
        gap: 20px;                  /* 닉네임과 날짜 간 간격 */
    }

    #nickName {
        font-size: 16px;            /* 글자 크기 */
        font-weight: 550;
    }

    #data {
        font-size: 14px;    
    }
    #content {
    	width:985px;
        margin: 0;
        padding: 10px;
        height: 450px;
    }

    .comment-box {
    	position: relative;   /* ✅ 메뉴 위치 기준 */
        border-bottom: 1px solid #000; /* 밑줄 */
        padding: 5px 0; /* 위아래 여백 */
    }

    /* row1: 가로 정렬 */
    #row1 {
	    display: flex;
	    align-items: center;
	    gap: 10px;
	    position: relative; /* userMenu 위치 기준 */
	}
	
	/* 점 3개 버튼 */
	.menu-button {
	    cursor: pointer;
	    font-size: 18px;
	    padding: 0 5px;
	    user-select: none;
	}
	
	/* userMenu 기본 숨김 */
	.userMenu {
	    display: none;
	    position: absolute;    /* ✅ 부모(comment-box) 기준 */
	    top: 0;                /* comment-box의 상단에 맞춤 */
	    left: 100%;            /* comment-box의 바로 오른쪽 */
	    margin-left: 10px;     /* 살짝 띄우고 싶으면 조절 */
	    background-color: #fff;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    width: 120px;
	    flex-direction: column;
	    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
	    z-index: 1000;
	}

    .userMenu .menu-item {
        padding: 8px 10px;
        cursor: pointer;
        font-size: 14px;
    }
    .userMenu .menu-item:hover {
        background-color: #f0f0f0;
    }

    /* 필요 시 개별 요소 스타일 */
    #number {
        width: 20px;
        text-align: center;
    }

    #comNick {
        flex-grow: 1; /* 닉네임 길이에 따라 늘어나도록 */
    }

    #comDate {
        color: #666;
        font-size: 0.9em;
    }
    #comment {
        padding: 20px;
        
    }

    #comment-write-box {
        width: 998px;
        height: 180px;
        border: 1px solid #E5E7ED;
        background-color: #E5E7ED;
        margin: 10px auto; /* 상하 10px, 좌우 중앙 정렬 */
        display: flex;
        align-items: center; /* 세로 가운데 정렬 */
        padding: 20px;
        gap: 40px; /* 요소 사이 간격 */
        box-sizing: border-box;
    }

    #comment-name {
        font-weight: 700;
        display: flex;
        align-items: center; /* 텍스트 세로 가운데 */
        height: 100%; /* 부모 높이에 맞춤 */
        margin-left: 30px;
    }
    

    #comment-write {
        width: 700px;
        height: 120px;
        resize: none;
        padding: 10px;
        box-sizing: border-box;
    }

    #btn2 {
        display: flex;
        align-items: center; /* 버튼 세로 가운데 */
    }

    #btn2 button {
        height: 50px;
        padding: 0 20px;
        cursor: pointer;
    }
    .actions {
	    bottom: 10px;
	    right: 15px;
	    display: flex;
	    gap: 10px;
	    font-size: 14px;
	    margin-bottom: 10px;
	}
	
	.action-item {
	    display: flex;
	    align-items: center;
	    gap: 2px;          /* 아이콘과 숫자 사이 간격 */
	    width: 50px;        /* 3자리 기준 고정 */
	}
	
	.action-item span.action-count {
	    display: inline-block;
	    min-width: 20px;   /* 숫자 자리 고정 */
	    text-align: left;  /* 숫자 왼쪽 정렬 */
	}
	
	.actions button.action-item {
	    background: none;  /* 버튼 기본 배경 제거 */
	    border: none;      /* 테두리 제거 */
	    padding: 0;        /* 패딩 제거 */
	    cursor: pointer;   /* 마우스 커서 포인터 */
	    display: flex;
	    align-items: center;
	    gap: 2px;
	    width: 50px;
	    font-size: 14px;
	}
	
	
	.comment-action-item{
		border:none;
		background-color: white;	
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

