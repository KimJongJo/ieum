<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ê±´ê°ì´ì - ë¤ì´ì´ë¦¬ ë©ì¸</title>
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css" rel="stylesheet">
  <!-- jquery -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- FullCalendar ì¤í¬ë¦½í¸ (Global build) -->
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
  <!-- fontawesome -->
  <script src="https://kit.fontawesome.com/8d48045bdd.js" crossorigin="anonymous"></script>
  <script>
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
  </style>
</head>

<body>

  <div class="diary-container">
    <div id="calendar"></div>
    
  	<!-- 팝업 -->
    <div class="detail-popup">
      <div id="close-btn">
        <i class="fa-solid fa-x"></i>
      </div>
      <div class="title">
        <span>9월 6일 기록</span>
        <div class="happy-icon emoji"><i class="fa-regular fa-face-smile"></i></div>
        <div style="display: none;" class="soso-icon emoji"><i class="fa-regular fa-face-meh"></i></div>
        <div style="display: none;" class="sad-icon emoji"><i class="fa-regular fa-face-frown"></i></div>
      </div>
      <div class="content">
        <div class="sub-title">일시<span>2025.09.06</span></div>
        <div class="sub-title">내용<span>9월 6일 오전 10시경 상담을 받았다. 이번 상담은 두번째 상담이라 그런지 지난번보다 편안했다9월 6일 오전 10시경 상담을 받았다. 이번
            상담은 두번째 상담이라 그런지 지난번보다 편안했다</span></div>
      </div>
      <div class="button-wrapper">
        <a class="btn-link" href="">
          <div class="basic-big-btn">수정</div>
        </a>
        <a class="btn-link" href="">
          <div class="basic-big-btn">삭제</div>
        </a>
        <a class="btn-link" href="">
          <div class="primary-big-btn">진단이력 바로가기</div>
        </a>
      </div>

    </div>

  </div>
  <script>
	//페이지네이션 클릭 이벤트	
    $(".pagination button").on("click", function () {
      const pageNum = $(this).text();

      if ($.isNumeric(pageNum)) { // 숫자 버튼 클릭 시
        $(".pagination button").removeClass("active");
        $(this).addClass("active");
      }
    });
    // 마우스 클릭 이벤트 리스너 추가
    $(document).ready(function () {
      const popup = $('.detail-popup');
      const fc = $('.fc');
      const closeButton = $('#close-btn');
      $(document).on('click', function (event) {
        const header = $(event.target).closest('.fc-header-toolbar').length > 0;
     	// console.log($(event.target).closest('.fc-header-toolbar').length);
        // 팝업 내부를 클릭했거나 닫기 버튼을 클릭했을 때는 팝업을 띄우지 않음
        if (popup.has(event.target).length > 0
          || $(event.target).is(closeButton)
          || fc.has(event.target).length == 0 || header) {
          popup.css("display", "none");
          return;
        }

    	 // 커서 위치 가져오기
        const x = event.clientX;
        const y = event.clientY;

     	// 팝업의 위치 설정 및 보이기
        popup.css({
          'display': 'flex',
          'left': x + 'px',
          'top': y + 'px'
        });
      });


      // 닫기 버튼 클릭 이벤트 리스너 추가
      closeButton.on('click', function () {
    	// 팝업 숨기기
        popup.css("display", "none");
      });
    });
    var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
      customButtons: {
        write: {
          text: "작성",
          click: function () {
            alert("일정 등록 하세요!");
          },
        },
      },
      headerToolbar:
       {
        left: 'today',
        center: 'prev,title,next',
        right: 'write'
      },
      initialView: 'dayGridMonth'
    });
    calendar.render();



  </script>
</body>

</html>