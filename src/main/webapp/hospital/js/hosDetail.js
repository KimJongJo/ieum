let calendar;

//tab
const navl = $(".navl");
const navr = $(".navr");

const tab1 = $("#tab1");
const tab2 = $("#tab2");

// 초기 상태 설정
$(document).ready(() => {
	$("#navl").addClass("active");
	$("#tab1").addClass("active");
	$("#tab2").removeClass("active");

	// 왼쪽 버튼 클릭
	navl.click(function() {
		navl.addClass("active");
		navr.removeClass("active");
		tab1.addClass("active");
		tab2.removeClass("active");
	});

	// 오른쪽 버튼 클릭
	navr.click(function() {
		navr.addClass("active");
		navl.removeClass("active");
		$('html, nav-box').animate({ scrollTop: 0 }, 'slow');
		tab2.addClass("active");
		tab1.removeClass("active");

		//calender
		const today = new Date();


		const startOfThisMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		// 다다음 달 마지막 날
		const endOfNext2Month = new Date(today.getFullYear(), today.getMonth() + 2 + 1, 0);
		// 타임존 보정: 하루를 더해서 문제 예방
		endOfNext2Month.setHours(23, 59, 59, 999);

		if (!calendar) {
			calendar = new FullCalendar.Calendar(document.getElementById('fc'), {
				headerToolbar: {
					start: '',
					center: 'prev,title,next',
					end: ''
				},

				showNonCurrentDates: false,

				// 이동 가능 범위 제한
				validRange: {
					start: startOfThisMonth,   // 이번 달 시작
					end: endOfNext2Month       // 다다음 달 마지막 날
				},

				titleFormat: function(arg) {
					// 현재 뷰의 날짜 정보
					const year = arg.date.year;
					const month = arg.date.month + 1; // 0부터 시작하므로 +1
					return year + ' ' + month + '월';
				},

				dayHeaderContent: function(arg) {
					// 요일 표시 (일~토)
					const day = arg.date.getDay();
					const days = ['일', '월', '화', '수', '목', '금', '토'];
					return days[day];
				},

				dayCellDidMount: function(info) {
					const cellDate = info.date;
					const now = new Date();

					// 오늘 이전 날짜 → 비활성화 스타일
					if (cellDate < new Date(now.getFullYear(), now.getMonth(), now.getDate())) {
						info.el.classList.add("fc-day-disabled");
					}
				},

				dateClick: function(info) {
					// 클릭 불가 날짜면 무시
					if (info.dayEl.classList.contains("fc-day-disabled")) return;

					// 이전 선택 날짜 스타일 제거
					if (selectedDateEl) {
						selectedDateEl.classList.remove('fc-today-clicked');
					}

					// 클릭한 날짜 스타일 추가
					selectedDateEl = info.dayEl;
					selectedDateEl.classList.add('fc-today-clicked');
				},

				dayCellDidMount: function(info) {
					const today = new Date();
					const cellDate = info.date;

					// 오늘 이전 날짜 비활성화
					if (cellDate < new Date(today.getFullYear(), today.getMonth(), today.getDate())) {
						info.el.classList.add("fc-day-disabled");
					} else {
						info.el.classList.remove("fc-day-disabled");
					}

					// 오늘 날짜 기본 선택
					if (
						cellDate.getFullYear() === today.getFullYear() &&
						cellDate.getMonth() === today.getMonth() &&
						cellDate.getDate() === today.getDate()
					) {
						info.el.classList.add("fc-today-clicked");
						selectedDateEl = info.el;
					}

					if (info.isOther) {
						// 마우스 이벤트 막기
						info.el.style.pointerEvents = "none";

					}
				},
				dayCellContent: function(arg) {
					const date = arg.date;
					const today = new Date();

					// 날짜 텍스트
					let html = `<div class="fc-day-number">${date.getDate()}</div>`;

					// 오늘이면 'today' 문구 추가
					if (
						date.getFullYear() === today.getFullYear() &&
						date.getMonth() === today.getMonth() &&
						date.getDate() === today.getDate()
					) {
						html += `<div class="fc-today-label">오늘</div>`;
					}

					return { html: html };
				}

			});
			calendar.render();
			const now = new Date(); // 현재 시각
			const buttons = document.querySelectorAll(".tb1");

			buttons.forEach((btn) => {
				const targetTime = new Date(btn.dataset.datetime);

				// 현재시간보다 이전이면 비활성화
				if (targetTime < now) {
					btn.disabled = true;
					btn.style.opacity = "0.5";
				}
			});
		} else {
			calendar.updateSize(); // 이미 렌더링 됐으면 크기 재계산
		}
	});

	$('.blue').click(function() {
		$('html, body').animate({ scrollTop: 0 }, 'slow');
	});

});
