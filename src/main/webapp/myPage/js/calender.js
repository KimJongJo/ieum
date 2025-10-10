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


/* 최근 진단 이력 모달 */
//동적 위임으로 버튼 클릭 시 모달 열기
$(document).on("click", "#btn2", function() {
	
	$.ajax({
		url:"/ieum/myPage/diagnosisHistory",
		type:"POST",
		data:{diaNo:$(this).val()},
		dataType:"json",
		success:function(res){
			if(res.success){
				var object = res.object;
				// 비우기
				$("#uNm").text("");
				$("#gender").text("");
				$("#birthDate").text("");
				// 진단/진료상세
				$("#diaName").text("");
				$("#sym").text("");
				$("#summary").text("");
				$("#treatment").text("");
				$("#pre").text("");
				// 의사정보
				$("#docImg").attr("src", "");
				$("#mNm").text("");
				$("#rDate").text("");
				$("#major").text("");
				$("#hNm").text("");
				// 의사의말
				$("#docComment").text("");
				
				
				// 채우기
				// 환자 정보
				$("#uNm").text(object.uNm);
				$("#gender").text(object.gender);
				$("#birthDate").text(object.birthDate);
				// 진단/진료상세
				$("#diaName").text(object.diagnosisName);
				$("#sym").text(object.sympotoms);
				$("#summary").text(object.testSummary);
				$("#treatment").text(object.treatment);
				$("#pre").text(object.prescription);
				// 의사정보
				$("#docImg").attr("src", "/ieum/" + object.docFilePath + "/" + object.docFileName);
				$("#mNm").text(object.mNm);
				$("#rDate").text(object.rDate);
				$("#major").text(object.major);
				$("#hNm").text(object.hNm);
				// 의사의말
				$("#docComment").text(object.doctorComment);
				
				
			}else{
				console.log(res.message);
			}
		},
		error:function(err){
			console.log(err);
		}
	})
	 $('#modal-div').css('display', 'flex');
	
    openModal();
});
//모달 확인 버튼 클릭 시 모달 닫기
$(document).on("click", "#check", function() {
    $("#modal-div").hide(); // 모달 숨김
});




/* 캘린더 부분 */
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

$(document).ready(function() {
    $('.hide-if-user').hide();
});



/* 새로고침 */

window.addEventListener("pageshow", function(event) {
    if (event.persisted || window.performance.getEntriesByType("navigation")[0].type === "back_forward") {
        window.location.reload();
    }
});