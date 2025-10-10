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
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/calender.css" />
<%-- <script src="${pageContext.request.contextPath}/myPage/css/calender.js"></script> --%>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css"
	rel="stylesheet"> -->
	
	
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
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
    margin: 20px auto 0 auto; /* 위 60px 띄우고 가운데 정렬 */
    display: flex;
    gap: 40px; /* 사이 간격 */
}

.right-content {
    display: flex;
    flex-direction: column; /* 세로 정렬 */
    gap: 40px; /* 세로 간격 */
    width: 1000px;
}
/* 사이드바 */
.sidebar {
    width: 195px;
    height: 560px;
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

#diagnosis-box{
    border: 2px solid #d9d9d9;
    background-color: white;
    width: 996px;
    height: 230px;
    margin:0;
    display: flex;            /* flex 사용 */
    flex-direction: column;   /* 세로로 쌓기 */
    align-items: center;      /* 가로 중앙 정렬 */
}


#diagnosis1 {
    width: 996px;
    height: 50px;
    display: flex;
    justify-content: space-between; /* 왼쪽-오른쪽 배치 */
    align-items: center;            /* 세로 가운데 정렬 */
    margin: 0px;
    border: 2px solid #E5E7ED;
    padding: 0 10px;                /* 좌우 여백 */
    background-color: #E5E7ED;
    border-radius: 15px 15px 0 0;
}
#diagnosis2 {
    width: 996px;
    height: 50px;
    display: flex;
    justify-content: space-between; /* 왼쪽-오른쪽 배치 */
    align-items: center;            /* 세로 가운데 정렬 */
    margin-top: 40px;
    border: 2px solid #E5E7ED;
    padding: 0 10px;                /* 좌우 여백 */
    background-color: #E5E7ED;
    border-radius: 15px 15px 0 0;
}

#recent {
    font-size: 16px;
    font-weight: bold;
}

#btn1 {
    background: none;   /* 버튼 배경 제거 */
    border: none;       /* 버튼 테두리 제거 */
    cursor: pointer;    /* 손가락 모양 커서 */
    padding: 5px;
    
}

#btn1 img {
    width: 17px;   /* 원하는 크기 */
    height: 17px;
    transform: rotate(180deg);
    transition: transform 0.3s ease; /* 회전 애니메이션 미리 설정 */
}


#box1{
    width: 950px;
    height: 45px;
    border: 1px solid #d9d9d9;
    margin: 20px auto 0 auto;
    display: flex; 
    justify-content: space-between;
}
#box2{
    width: 950px;
    height: 45px;
    border: 1px solid #d9d9d9;
    display: flex; 
    justify-content: space-between;
    margin: 0 auto 0 auto;
}

/* 각 영역 */
.box-item {
    flex: 1;                    /* 영역을 균등 분할 */
    border-right: 1px solid #d9d9d9; /* 구분선 */
    display: flex;              /* 안쪽 텍스트 정렬용 */
    align-items: center;        /* 세로 가운데 */
    justify-content: center;    /* 가로 가운데 */
    font-size: 14px;
}

/* 마지막 영역은 오른쪽 선 제거 */
.box-item:last-child {
    border-right: none;
}
#btn2 {
    width: 100px;
    height: 30px;
    border: 1px solid #888;
    background-color: #E5E7ED;
    color: black;
    border-radius: 15px;
    cursor: pointer; /* 손가락 커서 */
    transition: all 0.2s ease; /* 부드러운 애니메이션 */
}

/* 마우스를 올렸을 때 */
#btn2:hover {
    background-color: #E5E7ED;
    transform: translateY(-2px); /* 살짝 위로 */
    box-shadow: 0 4px 6px rgba(0,0,0,0.2); /* 눌린 듯한 그림자 */
}

/* 클릭 중(active)일 때 */
#btn2:active {
    transform: translateY(1px); /* 눌린 듯 아래로 */
    box-shadow: 0 2px 3px rgba(0,0,0,0.2);
}

#doc-comment{
    font-size: 14px;
    width: 900px;
    margin: 20px auto 0 auto;
}

#upload {
    display: flex;          /* 가로 정렬 */
    justify-content: flex-start; /* 왼쪽 정렬 */
    gap: 20px;              /* 요소 사이 간격 */
    margin: 20px auto 0 auto;
    font-size: 12px;
    width: 940px;
}

#btn3 {
    background: none;   /* 버튼 배경 제거 */
    border: none;       /* 버튼 테두리 제거 */
    cursor: pointer;    /* 손가락 모양 커서 */
    padding: 5px;
    
}

#btn3 img {
    width: 17px;   /* 원하는 크기 */
    height: 17px;
    transform: rotate(180deg);
    transition: transform 0.3s ease; /* 회전 애니메이션 미리 설정 */
}

.frame {
  position: relative;
  width: 100%;
  max-width: 996px;
  background-color: #ffffff;
  border-radius: 0 0 15px 15px;
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
  align-items: flex-start; /* ← 추가: 왼쪽 정렬 */
}

.title {
  font-family: "Noto Sans-Medium", Helvetica;
  font-weight: 500;
  font-size: 18px;
  color: #000;
}
.div {
  font-family: "Noto Sans-Medium", Helvetica;
  font-weight: 500;
  font-size: 18px;
  text-align: left;      /* ← 추가 */
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



/* 액션 아이콘 (좋아요, 댓글, 조회수) */
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


.action-item span.action-count {
  display: inline-block;
  min-width: 20px;   /* 숫자 자리 고정 */
  text-align: left;  /* 숫자 왼쪽 정렬 */
}

/* 좋아요(하트) 버튼 */
.heart-button {
  background: none;       /* 버튼 배경 제거 */
  border: none;           /* 테두리 제거 */
  padding: 0;
  margin: 0;
  font-size: 14px;
  cursor: pointer;
  line-height: 1;
  display: inline-flex;   /* 내부 요소 가로 정렬 */
  align-items: center;    /* 세로 가운데 정렬 */
  gap: 4px;               /* 하트와 숫자 간격 */
}

.heart-button:focus {
  outline: none; /* 클릭 시 파란 테두리 제거 */
}

/* 하트 이미지 정렬 */
.heart {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 20px;
}

.heart1 img {
  display: block;
  max-width: 100%;
  max-height: 100%;
}


#calendar {
    width: 900px;  /* 기존 600px → 900px */
    height: 700px; /* 기존 400px → 600px */
    margin: 0;
}
#calendar td, #calendar th {
    width: 80px;  /* 날짜 셀 너비 */
    height: 80px; /* 날짜 셀 높이 */
    font-size: 16px;
    text-align: center;
    vertical-align: middle;
}
</style>

<script type="text/javascript">

$(function() {

    /* ===========================
       1️⃣ diagnosis-box 토글
    =========================== */
    var $diagnosisBox = $("#diagnosis-box");
    var $btn1 = $("#btn1");
    var $btnImg = $btn1.find("img");

    $diagnosisBox.hide(); // 처음 숨김

    $btn1.on("click", function() {
        $diagnosisBox.toggle(); // display: none <-> block 전환
        if ($diagnosisBox.is(":visible")) {
            $btnImg.css("transform", "rotate(0deg)");
        } else {
            $btnImg.css("transform", "rotate(180deg)");
        }
    });


    /* ===========================
       2️⃣ community-box 토글
    =========================== */
    var $frame = $("#community-box .frame");
    var $btn3 = $("#btn3");
    var $btn3Img = $btn3.find("img");

    $frame.hide(); // 처음 숨김

    $btn3.on("click", function() {
        $frame.toggle(); // display none <-> flex 전환
        if ($frame.is(":visible")) {
            $frame.css("display", "flex"); // toggle 후 flex 유지
            $btn3Img.css("transform", "rotate(0deg)");
        } else {
            $btn3Img.css("transform", "rotate(180deg)");
        }
    });


    /* ===========================
       3️⃣ '관리 메뉴' 숨기기
    =========================== */
    $(".menu span:nth-child(5)").hide();

});
</script>

<script>
window.addEventListener("pageshow", function(event) {
    if (event.persisted || window.performance.getEntriesByType("navigation")[0].type === "back_forward") {
        window.location.reload();
    }
});
</script>


<script type="text/javascript">
//// 마우스 클릭 이벤트 리스너 추가
$(document).ready(function() {
	let todayDt = new Date();
	let todayYear = todayDt.getFullYear();
	let todayMonth = String(todayDt.getMonth() + 1).padStart(2, "0");
	let todayDay = String(todayDt.getDate() + 1).padStart(2, "0");
	let todayFormatDt = `${todayYear}-${todayMonth}-${todayDay}`;
	// 상세팝업
	const popup = $('.detail-popup');
	const writeConfirmModal = $("#writeConfirmModal");
	const closeButton = $('#close-btn');
	// 삭제 버튼 클릭
	$("#delBtn").click(function() {
		popup.hide();
		$("#delConfirmModal").show();
	})
	// enter검색
	$("#searchInput").on("keypress", function(e) {
		if (e.which === 13) {
			e.preventDefault();
			searchDiary();
		}
	});
	// 캘린더
	var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
		customButtons: {
			write: {
				text: "작성",
				click: function() {
					const contextPath = document.location.pathname.split('/');
					location.href = `${contextPath[0]}/${contextPath[1]}/myPage/diary/write`;
				},
			},
		},
		selectable: true,
		headerToolbar:
		{
			left: 'today',
			center: 'prev,title,next',
			right: 'write'
		},
		initialView: 'dayGridMonth',
/* 		validRange: {
			end: todayFormatDt   // 유효한 범위의 끝 날짜
		}, */
		// n년 n월 형식
		titleFormat: function(arg) {
			const year = arg.date.year;
			const month = arg.date.month + 1; // 0부터 시작하므로 +1
			return year + '년 ' + month + '월';
		},

		//요일column 한글로
		dayHeaderContent: function(arg) {
			const day = arg.date.getDay();
			const days = ['일', '월', '화', '수', '목', '금', '토'];
			return days[day];

		},
		// 다이어리 데이터 가져오기()
		events: function(fetchInfo, successCallback, failureCallback) {
			// fetchInfo.start, fetchInfo.end -> FullCalendar가 보내는 시작/끝 날짜
			const start = fetchInfo.startStr; // "2025-09-01"
			const end = fetchInfo.endStr;     // "2025-09-30"

			$.ajax({
				url: '/ieum/myPage/reservation/event',
				type: 'GET',
				data: { start: start, end: end },
				success: function(res) {
					
					successCallback(res);
				},
				error: function(e) {
					console.log("캘린더 조회 오류", e);
				}
			});
		},
		
		
		
		dateClick: function(info) {
			popup.hide();
			writeConfirmModal.hide();
			//			console.log('Clicked on: ' + info.dateStr);
			info.dayEl.style.backgroundColor = '#fff';
			const clickedDate = info.dateStr;
			// 클릭한 날짜 데이터 존재 유무 확인
			$.ajax({
				url: '/ieum/myPage/diary/check',
				type: 'post',
				data: { date: clickedDate },
				success: function(res) {
					// 상세 팝업 노출
					if (res.exists) {
						popup.css({
							'display': 'flex',
							'left': info.jsEvent.pageX + 'px',
							'top': info.jsEvent.pageY + 'px'
						});
						$("#popupMood").html(`<i class="fa-regular fa-face-${res.diary.mood}"></i>`)
						$("#popupDt").text(clickedDate.split("-").join("."));
						$('#popupTitle').text(res.diary.title);
						$('#popupContent').text(res.diary.content);
						$("#popupDNo").val(res.diary.dNo);
					} else {
						writeConfirmModal.show();
						$("#clickedDt").val(clickedDate);
					}
				}
			})
		}
	});
	calendar.render();
	// 닫기 버튼 클릭 이벤트 리스너 추가
	closeButton.on('click', function() {
		// 팝업 숨기기
		popup.css("display", "none");
	});
})
</script>


 <style>
 
 
 
 
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: "Noto Sans KR", sans-serif;
      background-color: #fff;
      color: #000000;
    }

    .diary-container {
      max-width: 800px;
      margin: 0 20px;
      padding: 20px;
    }

    /* ìºë¦°ë í¤ë */
    .fc-toolbar-chunk div {
      display: flex;
      flex-direction: row;
      gap: 10px;
    }

    .fc-toolbar-title {
      width: 230px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .fc-direction-ltr .fc-button-group{
      border-bottom-left-radius: 6px;
      border-top-left-radius: 6px;
    }

    .fc .fc-prev-button,
    .fc .fc-next-button {
      background: #fff;
      border: none;
      color: #2c3e50;
    }

    .fc .fc-write-button {
      border: 1.5px solid #B7B7B7;
      right: 0;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 20px;
      padding: 10px 25px;
      position: relative;
      background-color: #fff;
      border-radius: 6px;
      width: 78px;
      height: 40px;
      font-size: 13px;
      font-weight: 600;
      color: #000;
    }

    .fc .fc-write-button:hover {
      background-color: #B7B7B7;
    }

    /* ê²ìì°½ */
    .notice-search {
      margin-left: auto;
      display: flex;
      align-items: center;
      border: 1px solid #E7E7E7;
      background: #f9fbff;
      border-radius: 4px;
      overflow: hidden;
      width: 216px;
      height: 38px;
    }

    .notice-search input {
      border: none;
      outline: none;
      width: 160px;
      padding: 0 8px;
      font-size: 13px;
      background-color: #f9fbff;
    }

    .notice-search button {
      border: none;
      background: #f9fbff;
      cursor: pointer;
      display: flex;
      align-items: center;
      font-size: 13px;
      color: #555;
    }

    .search-icon {
      width: 13px;
      height: 13px;
      font-size: 13px;
      display: flex;
      text-align: center;
      justify-content: center;
      align-items: center;
      margin-left: 4px;
    }

    /* ì ë ¬ ìë í¸ */
    .notice-select {
      background: #f9fbff;
      border: 1px solid #E7E7E7;
      border-radius: 4px;
      width: 100px;
      height: 38px;
      font-size: 13px;
      color: #333;
      padding-left: 6px;
    }

    /* ìì¸ íì  */
    .detail-popup {
      position: absolute;
      z-index: 10000;
      width: 500px;
      min-height: 300px;
      padding: 20px;
      background-color: #F7FAFF;
      display: none;
      flex-direction: column;
      align-items: center;
      justify-content: space-around;
      border-radius: 10px;
    }

    .title {
      display: flex;
      flex-direction: row;
      gap: 10px;
      justify-content: center;
      align-items: center;
    }

    .title span {
      font-size: 20px;
      font-weight: bold;
    }

    .emoji {
      font-size: 20px;
    }

    .sub-title {
      font-size: 16px;
      font-weight: 600;
      /* color: #B5B7C0; */
    }

    .sub-title span {
      margin-left: 10px;
      font-size: 14px;
      font-weight: 400;
      color: #000000;
    }

    .content {
      font-size: 8px;
    }

    #close-btn {
      cursor: pointer;
      position: absolute;
      top: 10px;
      right: 10px;
      background: none;
      border: none;
    }

    .button-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 8px;
      margin-top: 20px;
      margin-bottom: 20px;
    }

    .btn-link {
      text-decoration: none;
    }

    .primary-big-btn {
      right: 0;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 20px;
      padding: 10px 25px;
      position: relative;
      background-color: #488ef6;
      border-radius: 6px;
      height: 40px;
      border: none;
      font-size: 13px;
      font-weight: 600;
      color: #fff;
    }

    .primary-big-btn:hover {
      background-color: #1565c0;
    }

    .basic-big-btn {
      border: 1.5px solid #B7B7B7;
      right: 0;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 20px;
      padding: 10px 25px;
      position: relative;
      background-color: #fff;
      border-radius: 6px;
      width: 78px;
      height: 40px;
      font-size: 13px;
      font-weight: 600;
      color: #000;
    }

    .basic-big-btn:hover {
      background-color: #B7B7B7;
    }

    .diary-list {
      width: 100%;
      max-width: 1128px;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    .diary-list th,
    .diary-item td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }

    .diary-list th {
      background-color: #f8f8f8;
      font-weight: bold;
    }

    .diary-list .diary-item {
      cursor: pointer;
      height: 63px;
    }

    .diary-list .diary-item:hover {
      background-color: #f0f0f0;
      text-decoration: underline;
    }

    .diary-list .diary-title-row {
      display: flex;
      align-items: center;
      height: 63px;

    }

    .diary-list .diary-title {
      flex-grow: 1;
    }

    .diary-list .top-diary {
      color: #dc3545;
      font-weight: bold;
      margin-right: 10px;
    }

    .diary-list .diary-content.date {
      text-align: left;
      font-size: 13px;
    }

    /* íì´ì§ë¤ì´ì & ìì±íê¸° ë²í¼ ì»¨íì´ë */
    .diary-footer {
      position: relative;
      display: flex;
      text-align: center;

      align-items: center;
      margin-top: 20px;
    }

    /* íì´ì§ë¤ì´ì ì¤ì ì ë ¬ */
    .pagination {
      display: flex;
      align-items: center;
      gap: 10px;
      margin: 0 auto;
      /* ì¤ì ì ë ¬ */
    }

    .pagination button {
      border: none;
      background: transparent;
      cursor: pointer;
      font-size: 14px;
      color: #333;
    }

    .pagination button.active {
      background: #a6c8ff;
      border-radius: 50%;
      width: 28px;
      height: 28px;
      color: #000;
      font-weight: bold;
    }
    
#calendar {
    margin-left: 45px; /* 왼쪽에서 40px 밀기 */
}
  </style>

</head>
<body>
<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>

    <!-- ✅ 중헤더 바로 밑에 텍스트 -->
	<div id="section-title">
		<div>
			<span>나만의 캘린더</span>
		</div>
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
					    <a href="/ieum/pInfo"><li><button type="button">나의 기본 정보</button></li></a>
					    <li><button type="button">예약 내역</button></li>
					    <a href="/ieum/myPage/diagnosisHistory"><li><button type="button">진단 이력</button></li></a>
					    <a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
					    <a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
					    <a href="/ieum/myPage/diary?page=1"><li><button type="button">다이어리</button></li></a>
						<a href="/ieum/hosFavorite"><li><button type="button">즐겨찾는 병원</button></li></a>
					</ul>
                </div>
            </div>
        </div>
        <!-- 오른쪽: 콘텐츠 (캘린더 + 진단 + 커뮤니티 세로 정렬) -->
    <div class="right-content">
	<%-- <c:import url="/common/calender/calender.jsp" charEncoding="UTF-8"/> --%>
	<div id="calendar"></div>
    <!-- 최근 진단 이력 -->
    <div class="container-three">
    
        <div id="diagnosis1">
            <div id="recent">최근 진단 이력</div>
            <button id="btn1">
                <img id="Heart1" src="${pageContext.request.contextPath}/img/버튼.png" alt="좋아요" width="15" height="15"/>
            </button>
        </div>
        
        <div id="diagnosis-box">
            <div id="box1">
                <div class="box-item">진단 일시</div>
                <div class="box-item">진단 명</div>
                <div class="box-item">결과요약</div>
                <div class="box-item">상세보기</div>
            </div>
            <div id="box2">
                <div class="box-item">2025-09-18</div>
                <div class="box-item">우울증</div>
                <div class="box-item">중(약 복용)</div>
                <div class="box-item">
                    <button id="btn2">진단 결과 보기</button>
                </div>
            </div>
            <div id="doc-comment">우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 
                                    어려움을 주는 질병입니다
            </div>
            <div id="upload">
                <div>수원시 보건소</div>
                <div>업로드 날짜</div>
            </div>
        </div>
		
		
        <div id="community-box">
            <div id="diagnosis2">
                <div id="recent">최근 커뮤니티</div>
                <button id="btn3">
                    <img id="Heart1" src="${pageContext.request.contextPath}/img/버튼.png" alt="좋아요" width="15" height="15"/>
                </button>
            </div>
            <c:if test="${not empty myComList}">
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
            </div>
            </c:if>
        </div>
	</div>
    </div>
    </div>
	<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>


