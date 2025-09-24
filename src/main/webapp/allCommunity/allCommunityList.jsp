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

/* ✅ 메인 영역 - 1280px 중앙 고정 */
.main-container {
    width: 1280px;
    margin: 20px auto 0 auto; 
    display: flex;
    gap: 40px;
    align-items: flex-start; /* 높이 정렬 */
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
    background-color: #4356B3;
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

    
    /* category-box 왼쪽 끝 정렬 */
    .community-box {
        width: 497px;          /* 2열 배치 */
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 10px;
        background-color: #f9f9f9;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 5px;
    }
    .category-title {
        font-weight: bold;
        text-align: center;
        border-bottom: 1px solid #ccc;
        padding-bottom: 5px;
        margin-bottom: 10px;
    }
    .community-list {
        width: 1020px;        /* 2열 기준 */
        display: flex;
        flex-wrap: wrap;       /* 여러 줄로 배치 */
        gap: 20px;
        margin: 20px auto;
    }

    .community-box .meta {
        font-size: 12px;
        color: #555;
        display: flex;
        justify-content: space-between;
    }

    .community-box .content {
        font-size: 14px;
        font-weight: bold;
        color: #333;
    }

    .category-list li {
        margin: 5px 0;
        display: flex;
        align-items: center;
    }
    .category-list label {
        margin-left: 5px;
        cursor: pointer;
    }

    .boxes {
        display: flex;
        gap: 20px; /* 두 박스 사이 간격 */
        margin: 0 0 20px 20px;
        position: relative;
        width: 100%;
        max-width: 500px;
        background-color: #ffffff;
        border-radius: 15px;
        border: 2px solid #d9d9d9;
        padding: 15px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 10px;
        
    }

    .box {
        display: flex;
        align-items: center;/* 좌-우 분리 */
        justify-content: space-between;
        gap: 10px; /* 닉네임과 카테고리 사이 간격 */
    }

        /* 상단: 닉네임 + 카테고리 */
    .community-box {
        display: flex;
        justify-content: space-between; /* 좌우 분리 */
        align-items: center;
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
        margin-left: 0;
    }
    /* 제목 및 본문 */
    .overlap-group {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .div {
        font-family: "Noto Sans-Medium", Helvetica;
        font-weight: 500;
        font-size: 18px;
        color: #000;
    }

    .p {
        font-family: "Inter-Regular", Helvetica;
        font-size: 14px;
        color: #000;
        margin: 0;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        max-width: 50ch; /* 약 20글자 */
    }


    /* 업로드 날짜 */
        .text-wrapper-3 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 12px;
        color: #000;
        }

    .actions {
	    position: absolute;
	    bottom: 10px;
	    right: 15px;
	    display: flex;
	    gap: 10px;
	    font-size: 14px;
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


    .sort-buttons {
        display: flex;
        justify-content: space-between; /* 좌-우 분리 */
        align-items: center;
        margin: 0 0 15px 15px;
        width: 100%;
        max-width: 1020px; /* 게시글 박스와 맞춤 */
    }

    .right-container {
        flex: 1; /* 카테고리 옆 공간을 전부 차지 */
        display: flex;
        flex-direction: column;
    }

    .left-buttons {
        display: flex;
        gap: 10px;
    }

    .right-button {
        display: flex;
    }

    .sort-buttons button {
        width: 80px;
        height: 30px;
        border-radius: 15px;
        border: 1px solid #ccc;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        cursor: pointer;
        margin: 5px;
        background-color: #f9f9f9;
        transition: 0.2s;
    }
    
    /* 마우스 올렸을 때 */
	.sort-buttons button:hover {
	    background-color: #e6e6e6;
	}
	
	/* 클릭 시 눌리는 효과 */
	.sort-buttons button:active {
	    transform: translateY(2px);
	    filter: brightness(90%);
	}

    /* 마우스 올렸을 때 */
    #latest:hover, #empathy:hover, #by-view:hover, #write:hover {
        background-color: #e6e6e6;
    }
</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const latestBtn = document.getElementById('latest');
    const empathyBtn = document.getElementById('empathy');
    const byViewBtn = document.getElementById('by-view');
    const rightContainer = document.querySelector('.right-container');

    // 최신순
    latestBtn.addEventListener('click', () => {
        const boxes = Array.from(rightContainer.querySelectorAll('.boxes'));
        boxes.sort((a, b) => {
            const dateA = new Date(a.querySelector('.text-wrapper-3').textContent.trim());
            const dateB = new Date(b.querySelector('.text-wrapper-3').textContent.trim());
            return dateB - dateA; // 최신순 내림차순
        });
        boxes.forEach(box => rightContainer.appendChild(box));
    });

    // 공감순
    empathyBtn.addEventListener('click', () => {
        const boxes = Array.from(rightContainer.querySelectorAll('.boxes'));
        boxes.sort((a, b) => {
            const countA = parseInt(a.querySelector('.actions .action-item:nth-child(1) .action-count').textContent);
            const countB = parseInt(b.querySelector('.actions .action-item:nth-child(1) .action-count').textContent);
            return countB - countA; // 공감수 내림차순
        });
        boxes.forEach(box => rightContainer.appendChild(box));
    });

    // 조회순
    byViewBtn.addEventListener('click', () => {
        const boxes = Array.from(rightContainer.querySelectorAll('.boxes'));
        boxes.sort((a, b) => {
            const countA = parseInt(a.querySelector('.actions .action-item:nth-child(3) .action-count').textContent);
            const countB = parseInt(b.querySelector('.actions .action-item:nth-child(3) .action-count').textContent);
            return countB - countA; // 조회수 내림차순
        });
        boxes.forEach(box => rightContainer.appendChild(box));
    });
});
</script>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const categoryRadios = document.querySelectorAll('.category-list input[type="radio"]');
    const boxes = document.querySelectorAll('.right-container .boxes');

    categoryRadios.forEach(radio => {
        radio.addEventListener('change', () => {
            const selectedCategory = radio.nextElementSibling.textContent.trim(); // 라벨 텍스트
            boxes.forEach(box => {
                const boxCategory = box.querySelector('.text-wrapper-2').textContent.trim();
                if (selectedCategory === "모든 사연") {
                    box.style.display = "flex"; // 전체 보여주기
                } else if (boxCategory === selectedCategory) {
                    box.style.display = "flex"; // 선택한 카테고리만 보여주기
                } else {
                    box.style.display = "none"; // 나머지 숨기기
                }
            });
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

    <!-- Section Title -->
    <div id="section-title">
        <span>모든 커뮤니티</span>
    </div>

    <!-- 메인 컨테이너: 1280px 중앙 고정 -->
    <div class="main-container">
        <div class="category-box">
        <div class="category-title">카테고리</div>
        <ul class="category-list">
            <li><input type="radio" name="category" id="all"><label for="all">모든 사연</label></li>
            <li><input type="radio" name="category" id="baby"><label for="baby">육아/출산</label></li>
            <li><input type="radio" name="category" id="finance"><label for="finance">금전/사업</label></li>
            <li><input type="radio" name="category" id="lgbt"><label for="lgbt">LGBT</label></li>
            <li><input type="radio" name="category" id="child"><label for="child">자아/성격</label></li>
            <li><input type="radio" name="category" id="love"><label for="love">연애</label></li>
            <li><input type="radio" name="category" id="divorce"><label for="divorce">이별/이혼</label></li>
            <li><input type="radio" name="category" id="crime"><label for="crime">성범죄</label></li>
            <li><input type="radio" name="category" id="pets"><label for="pets">펫로스</label></li>
            <li><input type="radio" name="category" id="study"><label for="study">학업/고시</label></li>
            <li><input type="radio" name="category" id="sex"><label for="sex">성생활</label></li>
            <li><input type="radio" name="category" id="social"><label for="social">대인관계/따돌림</label></li>
            <li><input type="radio" name="category" id="appearance"><label for="appearance">외모</label></li>
            <li><input type="radio" name="category" id="health"><label for="health">신체건강</label></li>
            <li><input type="radio" name="category" id="mental"><label for="mental">정신건강</label></li>
            <li><input type="radio" name="category" id="family"><label for="family">가족</label></li>
            <li><input type="radio" name="category" id="job"><label for="job">취업/진로</label></li>
            <li><input type="radio" name="category" id="marriage"><label for="marriage">부부관계</label></li>
            <li><input type="radio" name="category" id="work"><label for="work">직장</label></li>
            <li><input type="radio" name="category" id="etc"><label for="etc">기타</label></li>
        </ul>
        </div>

         <!-- 👉 오른쪽 영역 전체 -->
	     <div class="right-container">
	        <!-- 버튼 영역 -->
	        <div class="sort-buttons">
	            <div class="left-buttons">
	                <button id="latest">최신순</button>
	                <button id="empathy">공감순</button>
	                <button id="by-view">조회순</button>
	            </div>
	            <div class="right-button">
	                <button id="write">작성하기</button>
	            </div>
	        </div>
	
	        <!-- ✅ box를 버튼 아래로 -->
		    <div class="boxes">
		        <div class="box">
		            <div class="text-wrapper-1">닉네임</div>
		            <div class="text-wrapper-2">취업/진로</div>
		        </div>
		        <div class="overlap-group">
		            <div class="div">요즘 너무 힘듭니다</div>
		            <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구...</p>
		        </div>
		        <div class="text-wrapper-3">2025-09-22</div>
		        <div class="actions">
				    <span class="action-item">
				        ❤️ <span class="action-count">50</span>
				    </span>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">90</span>
				    </span>
				</div>
		    </div>
		    <div class="boxes">
		        <div class="box">
		            <div class="text-wrapper-1">닉네임</div>
		            <div class="text-wrapper-2">학업/고시</div>
		        </div>
		        <div class="overlap-group">
		            <div class="div">요즘 너무 힘듭니다</div>
		            <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구...</p>
		        </div>
		        <div class="text-wrapper-3">2026-09-22</div>
		        <div class="actions">
				    <span class="action-item">
				        ❤️ <span class="action-count">20</span>
				    </span>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">15</span>
				    </span>
				</div>
		    </div>
		    <div class="boxes">
		        <div class="box">
		            <div class="text-wrapper-1">닉네임</div>
		            <div class="text-wrapper-2">부부관계</div>
		        </div>
		        <div class="overlap-group">
		            <div class="div">요즘 너무 힘듭니다</div>
		            <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구...</p>
		        </div>
		        <div class="text-wrapper-3">2027-09-22</div>
		        <div class="actions">
				    <span class="action-item">
				        ❤️ <span class="action-count">15</span>
				    </span>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">100</span>
				    </span>
				</div>
		    </div>
	    </div>

    </div>

</body>
</html>