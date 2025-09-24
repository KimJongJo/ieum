// 페이지네이션 클릭 이벤트
$(".pagination button").on("click", function() {
	const pageNum = $(this).text();

	if ($.isNumeric(pageNum)) { // 숫자 버튼 클릭 시
		$(".pagination button").removeClass("active");
		$(this).addClass("active");
	}
});
// 마우스 클릭 이벤트 리스너 추가
$(document).ready(function() {
	const popup = $('.detail-popup');
	const fc = $('.fc');
	const closeButton = $('#close-btn');
	$(document).on('click', function(event) {
		const header = $(event.target).closest('.fc-header-toolbar').length > 0;
		// console.log($(event.target).closest('.fc-header-toolbar').length);
		// 팝업 내부를 클릭했거나 닫기 버튼을 클릭했을 때는 팝업을 띄우지 않음
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


	// 닫기 버튼 클릭 이벤트 리스너 추가
	closeButton.on('click', function() {
		// 팝업 숨기기
		popup.css("display", "none");
	});
});
var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
	customButtons: {
		write: {
			text: "작성",
			click: function() {
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