// 페이지네이션 클릭 이벤트
$(".pagination button").on("click", function() {
	const pageNum = $(this).text();
	if ($.isNumeric(pageNum)) { // 숫자 버튼 클릭 시
		$(".pagination button").removeClass("active");
		$(this).addClass("active");
	}
});
$(document).ready(function() {
	// 삭제 버튼 클릭
	$("#delBtn").click(function() {
		$("#confirmModal").show();
	})
})
//// 마우스 클릭 이벤트 리스너 추가
$(document).ready(function() {
	// 상세팝업
	const popup = $('.detail-popup');
	const closeButton = $('#close-btn');
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
		// diary 데이터 가져오기
		events: {
			url: '/ieum/myPage/diary',
			method: 'GET',
			failure: function() {
				console.log('diary 데이터를 불러오지 못했습니다.');
			}
		},
		dateClick: function(info) {
			console.log('Clicked on: ' + info.dateStr);
			info.dayEl.style.backgroundColor = '#F7FAFF';
			const clickedDate = info.dateStr;
			// 클릭한 날짜 데이터 존재 유무 확인
			$.ajax({
				url: '/ieum/myPage/diary/check',
				type: 'post',
				data: { date: clickedDate },
				success: function(res) {
					console.log("res", res);
					if (res.exists) {
						popup.css({
							'display': 'flex',
							'left': info.jsEvent.pageX + 'px',
							'top': info.jsEvent.pageY + 'px'
						});
						$('#popupTitle').text(res.diary.title);
						$('#popupContent').text(res.diary.content);
					} else {
						// 작성 페이지 이동
						const contextPath = document.location.pathname.split('/');
						location.href = `${contextPath[0]}/${contextPath[1]}/myPage/diary/write?date=${clickedDate}`;
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
function goDetail(no) {
	$("#dNoInput").val(no);
	$("#diaryForm").submit();
}
function goUpdate() {
	$("#hiddenForm").submit();
}

function cancelDel() {
	$("#delConfirmModal").hide();
}
function confirmDel() {
	$("#delConfirmModal").hide();
	$("#hiddenForm").submit();
}

