<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/allCommunity/css/myCommunityList.css" />
<%-- <script src="${pageContext.request.contextPath}/allCommunity/js/myCommunityList.js"></script> --%>
<script type="text/javascript">
window.addEventListener("pageshow", function(event) {
    if (event.persisted) {
        // bfcache(뒤로가기 캐시)에서 불러온 경우
        window.location.reload();
    }
});
</script>
<style type="text/css">
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



/* 옵션 컨테이너 */
.option-containerList {
    flex: 1;       /* 남은 공간 차지 */
    display: flex;
    align-items: flex-start; /* 사이드바와 상단 맞춤 */
}

#option-container {
    width: 998px;
    display: flex;
    border-radius: 5px;
    overflow: hidden;
}

/* 공통 탭 스타일 */
.tab-commu, .tab-comment, .tab-heart {
    flex: 1;
    text-align: center;
    padding: 10px 0;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s, color 0.3s;
}


/* 클릭 시 활성화 탭 색상 */
.tab-commu.active, .tab-comment.active, .tab-heart.active {
    background-color: #4356B3;
    color: #fff;
    font-weight: bold;
}

/* 비활성 탭 색상 */
.tab-commu, .tab-comment, .tab-heart {
    background-color: #f0f0f0;
    color: #000;
}

.frame {
  position: relative;
  width: 100%;
  max-width: 1003px;
  background-color: #ffffff;
  border-radius: 15px;
  border: 2px solid #d9d9d9;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 10px;
}


.frame1 {
  position: relative;
  width: 100%;
  max-width: 1003px;
  background-color: #ffffff;
  border-radius: 15px;
  border: 2px solid #d9d9d9;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

/* 상단: 닉네임 + 카테고리 */
.frame-top {
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
}

/* 제목 및 본문 */
.overlap-group {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.title {
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


/* 댓글 스타일 */
.comment {
  position: relative;
  width: 100%;
  max-width: 1003px;
  background-color: #ffffff;
  border-radius: 15px;
  border: 2px solid #d9d9d9;
  padding: 15px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

/* 상단: 닉네임 + 카테고리 */
.comment-top {
  display: flex;
  justify-content: space-between; /* 좌우 분리 */
  align-items: center;
}

/* 닉네임 */
.nickName {
  font-family: "Inter-Regular", Helvetica;
  font-size: 12px;
  color: #000;
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

/* 액션 아이콘 오른쪽 아래 고정 */
#actions {
  position: absolute;
  bottom: 10px;
  right: 15px;
  display: flex;
  gap: 10px;
  font-size: 14px;
}


.heart-button {
    background: none;       /* 버튼 배경 제거 */
    border: none;           /* 테두리 제거 */
    padding: 0;
    margin: 0;
    font-size: 14px;
    cursor: pointer;
    line-height: 1;

    display: inline-flex;   /* ✅ 내부 요소 가로 정렬 */
    align-items: center;    /* 세로 가운데 정렬 */
    gap: 4px;               /* 하트와 숫자 간격 */
}

.heart-button:focus {
    outline: none;          /* 클릭 시 파란 테두리 제거 */
}
.heart {
	    display: flex;           /* flex 컨테이너로 설정 */
	    justify-content: center; /* 가로 중앙 정렬 */
	    align-items: center;     /* 세로 중앙 정렬 */
	    height: 20px;            /* 필요에 따라 높이 조정 */
	}
	.heart1 img {
	    display: block;          /* 이미지 주변 여백 제거 */
	    max-width: 100%;         /* 영역 넘치지 않게 */
	    max-height: 100%;        /* 영역 넘치지 않게 */
	}

</style>

<script>


//게시글 하트 색 변경
$(function(){
    $('.actions form').submit(function(e){
        e.preventDefault(); // 새로고침 방지
        var form = $(this);
        var commuNo = form.find('input[name="commuNo"]').val();
        var countSpan = form.find('.action-count').first(); // 공감 수
        var heartSpan = form.find('.heart'); // 하트 이미지 span

        $.post(form.attr('action'), {commuNo: commuNo}, function(data){
            // 공감 수 갱신
            countSpan.text(data.newCount);

            // 하트 색상 갱신
            if(data.liked){
                heartSpan.html('<img src="' + '${pageContext.request.contextPath}/img/빨간하트.png' + '" alt="좋아요" width="15" height="15"/>');
            } else {
                heartSpan.html('<img src="' + '${pageContext.request.contextPath}/img/횐색하트.png' + '" alt="좋아요" width="15" height="15"/>');
            }
        }, "json");
    });
});



$(document).ready(function() {

    const $tabCommu = $('.tab-commu');
    const $tabComment = $('.tab-comment');
    const $tabHeart = $('.tab-heart');

    const $frame = $('.frame');      // 작성한 게시판
    const $comment = $('.comment');  // 작성한 댓글
    const $frame1 = $('.frame1');    // 좋아요 누른 게시판

    // 처음에는 작성한 게시판만 active
    $tabCommu.addClass('active');
    $frame.show();
    $comment.hide();
    $frame1.hide();

    // 탭 클릭 이벤트
    $tabCommu.click(function() {
        $tabCommu.addClass('active');
        $tabComment.removeClass('active');
        $tabHeart.removeClass('active');
        $frame.show();
        $comment.hide();
        $frame1.hide();
    });

    $tabComment.click(function() {
        $tabComment.addClass('active');
        $tabCommu.removeClass('active');
        $tabHeart.removeClass('active');
        $frame.hide();
        $comment.show();
        $frame1.hide();
    });

    $tabHeart.click(function() {
        $tabHeart.addClass('active');
        $tabCommu.removeClass('active');
        $tabComment.removeClass('active');
        $frame.hide();
        $comment.hide();
        $frame1.show();
    });
});



// 숨김 요소 처리
$(document).ready(function() {
    $('.hide-if-user').hide();
});

</script>
</head>
<body>

	<c:import url="/common/header/header.html" charEncoding="UTF-8"/>

    <!-- Section Title -->
    <div id="section-title">
        <span>나의 커뮤니티</span>
    </div>

    <!-- Main -->
    <!-- a태그 <a href="/mypage"> -->
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
				        <a href="/ieum/pInfo"><li><button type="button">나의 기본 정보</button></li></a>
				        <li><button type="button">예약 내역</button></li>
				        <li><button type="button">진단 이력</button></li>
				        <a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
				        <a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
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
            <!-- 작성한 게시판 -->
			<c:forEach var="myComList" items="${myComList}" varStatus="status">
			    <div class="frame" data-commu-no="${myComList.commuNo}"
			    	onclick="location.href='${pageContext.request.contextPath}/comDetail?no=${myComList.commuNo}'">
			    <button type="submit" class="hidden-submit" style="display:none;"></button>
			        <!-- 상단: 닉네임 + 카테고리 -->
			        <div class="frame-top">
			            <div class="text-wrapper-1">
			            	<c:out value="${myComList.nickName}" default="익명"/>
			            </div>
			            <div class="text-wrapper-2">
			            	<c:out value="${myComList.categoryName}" default="카테고리"/>
			            </div>
			        </div>
			
			        <!-- 제목 및 본문 -->
			        <div class="overlap-group">
			            <div class="title"><c:out value="${myComList.commuTitle}"/></div>
			            <p class="p">
			            	<c:out value="${myComList.commuContent}" escapeXml="false"/>
			            </p>
			        </div>
			
			        <!-- 업로드 날짜 -->
			        <div class="text-wrapper-3">
			        	<fmt:formatDate value="${myComList.commuCreated}" pattern="yyyy-MM-dd"/>
			        </div>
			
			        <!-- 액션 아이콘 (오른쪽 아래) -->
			        <div class="actions">
				            <span class="action-item">
				            <input type="hidden" name="commuNo" value="${myComList.commuNo}"/>
				            <button type="submit" class="heart-button">
				                <span class="heart1">
								    <c:choose>
								        <c:when test="${myComList.likedByUserCom}">
								        	 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
								        </c:when>
								        <c:otherwise>
								        	<img id="Heart1" src="${pageContext.request.contextPath}/img/횐색하트.png" alt="좋아요" width="15" height="15"/>
								        </c:otherwise>
								    </c:choose>
								</span>
				                <span class="action-count">
				                	<c:out value="${myComList.empathy}" />
				                </span>
				                </button>
				            </span>
			            <span class="action-item">
			                💬 <span class="action-count"><c:out value="${myComList.commuComment}" /></span>
			            </span>
			            <span class="action-item">
			                🔗 <span class="action-count"><c:out value="${myComList.commuViews}" /></span>
			            </span>
			        </div>
			                <!-- 숨겨진 버튼: 전체 frame 클릭 시 제출 -->
        			<button type="submit" style="position:absolute; top:0; left:0; width:100%; height:100%; opacity:0; cursor:pointer; border:none; background:none;"></button>
			    </div>
			</c:forEach>
            
            <!-- 댓글 작성한 곳 -->
            <c:forEach var="myCommeList" items="${myCommeList}" varStatus="status">
            <!-- 옵션 밑 새로운 영역 -->
            <div class="comment" >
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="comment-top">
                    <div class="nickName">
                    	<c:out value="${myCommeList.nickname}" default="익명"/>
                    </div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <p class="p">
                    	<c:out value="${myCommeList.comContent}" escapeXml="false"/>
                    </p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">
                	<fmt:formatDate value="${myCommeList.comCreated}" pattern="yyyy-MM-dd"/>
                </div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
                <div id="actions">
                    <span class="action-item">
                     <input type="hidden" name="commuNo" value="${myCommeList.commuNo}"/>
				        <button type="submit" class="heart-button">
				                <span class="heart1">
								    <c:choose>
								        <c:when test="${myCommeList.likedByUserCom}">
								        	 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
								        </c:when>
								        <c:otherwise>
								        	<img id="Heart1" src="${pageContext.request.contextPath}/img/횐색하트.png" alt="좋아요" width="15" height="15"/>
								        </c:otherwise>
								    </c:choose>
								</span>
							<span class="action-count"><c:out value="${myCommeList.comEmpathy}"/></span>
				        </button>				        
				    </span>
                </div>
            </div>
            </c:forEach>
            
            
            
            
            <c:forEach var="myEmpathy" items="${myEmpathy}" varStatus="status">

			    <input type="hidden" name="commu_no" class="commu_no" value="${myEmpathy.commuNo}" />
			    
			    <div class="frame1" data-commu-no="${myEmpathy.commuNo}"
			    	onclick="location.href='${pageContext.request.contextPath}/comDetail?no=${myEmpathy.commuNo}'">
			    <button type="submit" class="hidden-submit" style="display:none;"></button>
			        <!-- 상단: 닉네임 + 카테고리 -->
			        <div class="frame-top">
			            <div class="text-wrapper-1">
			            	<c:out value="${myEmpathy.nickName}" default="익명"/>
			            </div>
			            <div class="text-wrapper-2">
			            	<c:out value="${myEmpathy.categoryName}" default="카테고리"/>
			            </div>
			        </div>
			
			        <!-- 제목 및 본문 -->
			        <div class="overlap-group">
			            <div class="title"><c:out value="${myEmpathy.commuTitle}"/></div>
			            <p class="p">
			            	<c:out value="${myEmpathy.commuContent}" escapeXml="false"/>
			            </p>
			        </div>
			
			        <!-- 업로드 날짜 -->
			        <div class="text-wrapper-3">
			        	<fmt:formatDate value="${myEmpathy.commuCreated}" pattern="yyyy-MM-dd"/>
			        </div>
			
			        <!-- 액션 아이콘 (오른쪽 아래) -->
			        <div class="actions">
			            <span class="action-item">
			                 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
			                 <span class="action-count"><c:out value="${myEmpathy.empathy}" /></span>
			            </span>
			            <span class="action-item">
			                💬 <span class="action-count"><c:out value="${myEmpathy.commuComment}" /></span>
			            </span>
			            <span class="action-item">
			                🔗 <span class="action-count"><c:out value="${myEmpathy.commuViews}" /></span>
			            </span>
			        </div>
			                <!-- 숨겨진 버튼: 전체 frame 클릭 시 제출 -->
        			<button type="submit" style="position:absolute; top:0; left:0; width:100%; height:100%; opacity:0; cursor:pointer; border:none; background:none;"></button>
			    </div>
			</c:forEach>
            
        </div>
    </div>
    
    <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>

