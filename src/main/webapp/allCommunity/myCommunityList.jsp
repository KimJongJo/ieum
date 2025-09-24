<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="css/myCommunityList.css"></link>
<style>

</style>

<script>
    // 탭 클릭 시 active 바꾸기
    // 탭 클릭 시 active 바꾸기
    document.querySelectorAll(".tab").forEach(tab => {
        tab.addEventListener("click", function() {
            document.querySelectorAll(".tab").forEach(t => t.classList.remove("active"));
            this.classList.add("active");
        });
    });
</script>
<script>
/* 댓글 길면 짤리게 */
  const p = document.getElementById('text');
  const maxChars = 50;

  if(p.innerText.length > maxChars){
      p.innerText = p.innerText.slice(0, maxChars) + '...';
  }
</script>
<script>

/* 헤더 숨기는 기능 */
window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});
</script>


<script>

/* 클릭 이벤트 */
document.addEventListener('DOMContentLoaded', () => {
    const tabCommu = document.querySelector('.tab-commu');
    const tabComment = document.querySelector('.tab-comment');
    const tabHeart = document.querySelector('.tab-heart');

    const frame = document.querySelector('.frame');   // 게시판 영역
    const comment = document.querySelector('.comment'); // 댓글 영역

    // 처음에는 게시판만 보이도록
    frame.style.display = 'flex';
    comment.style.display = 'none';

    // 공통 탭 클릭 이벤트 함수
    function activateTab(selectedTab) {
        // 모든 탭 active 제거
        [tabCommu, tabComment, tabHeart].forEach(t => t.classList.remove('active'));
        // 선택된 탭만 active
        selectedTab.classList.add('active');
    }

    tabCommu.addEventListener('click', () => {
        activateTab(tabCommu);
        frame.style.display = 'flex';
        comment.style.display = 'none';
    });

    tabComment.addEventListener('click', () => {
        activateTab(tabComment);
        frame.style.display = 'none';
        comment.style.display = 'flex';
    });

    tabHeart.addEventListener('click', () => {
        activateTab(tabHeart);
        frame.style.display = 'flex';   // 좋아요 누른 게시판 영역도 게시판처럼
        comment.style.display = 'none';
    });
});
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

        <!-- 오른쪽 컨테이너: 옵션 + 새로운 영역 세로 배치 -->
        <div class="right-container" style="display:flex; flex-direction:column; gap:20px;">
            <!-- Options 컨테이너 -->
            <div id="option-container">
                <button class="tab-commu">작성한 게시판</button>
                <button class="tab-comment">작성한 댓글</button>
                <button class="tab-heart">좋아요 누른 게시판</button>
            </div>

            <!-- 옵션 밑 새로운 영역 -->
            <div class="frame">
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="frame-top">
                    <div class="text-wrapper-1">닉네임</div>
                    <div class="text-wrapper-2">진로/취업</div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <div class="title">요즘 너무 힘듭니다</div>
                    <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구 그러니까 전 아니라니까요 그게 뭐냐니까요?</p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">업로드 날짜</div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
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
            
            
            <!-- 옵션 밑 새로운 영역 -->
            <div class="comment">
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="comment-top">
                    <div class="nickName">닉네임</div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구 그러니까 전 아니라니까요 그게 뭐냐니까요?</p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">업로드 날짜</div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
                <div id="actions">
                    <span class="action-item">
				        ❤️ <span class="action-count">15</span>
				    </span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


