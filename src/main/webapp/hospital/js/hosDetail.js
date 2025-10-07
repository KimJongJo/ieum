let calendar;
let selectedDate;
let selectedMno;
let selectedTime;

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

	// 왼쪽 탭 (상세정보)
	navl.click(function() {
		navl.addClass("active");
		navr.removeClass("active");
		tab1.addClass("active");
		tab2.removeClass("active");

	});

	//하단 버튼 (예약하기)
	$(document).on('click', '#resbtn', function() {
		activeReservation();
	});

	// 오른쪽 탭 (예약하기)
	navr.click(function() {
		navr.addClass("active");
		navl.removeClass("active");
		tab2.addClass("active");
		tab1.removeClass("active");

		activeReservation();

	});


	// 예약하기 탭
	function activeReservation() {
		//스크롤 이동
		$('html, body').animate({
			scrollTop: $('.nav-box').offset().top
		}, 'slow');

		//오른쪽 탭 (예약하기)	
		navr.addClass("active");
		navl.removeClass("active");
		tab2.addClass("active");
		tab1.removeClass("active");

		selectDoc();
		showCalendar();

	}

	//의사 선택
	function selectDoc() {
		$(document).off("click", ".dall").on("click", ".dall", function() {
			$(".dall").removeClass("active");
			$(this).addClass("active");

			resetTimeSelection();

			// 선택된 의사 번호 저장
			selectedMno = Number($(this).data("mno"));
			$("#selectedMno").val(selectedMno);

			// 오늘 날짜 선택시 값
			if (!selectedDate) {
				const today = new Date();
				selectedDate = today.getFullYear() + "-" + String(today.getMonth() + 1).padStart(2, '0') + "-" + String(today.getDate()).padStart(2, '0');
				$("#selectedDate").val(selectedDate);

				//요일 정보
				const days = ['일', '월', '화', '수', '목', '금', '토'];
				const day = days[today.getDay()];
				const selectedDay = `(${day})`;
				$("#selectedDays").val(selectedDay);

			}
			sendDateToServer(selectedMno, selectedDate);

		});
	}


	//의사 선택 + 날짜 선택 보내기
	function sendDateToServer(mNo, rDate) {
		$.post("/ieum/hospital/detail", {
			mNo: mNo,
			rDate: rDate,
			action: "getResDate"
		})
			.done(function(result) {
				showTime(result);

			})
			.fail(function(err) {
				console.error("예약 정보 불러오기 실패:", err);

			});
	}

	//시간 버튼 노출
	function showTime(resList) {
		$(".tb1").each(function() {
			const btn = $(this);
			const btnTime = btn.val();

			// 예약 리스트 중 같은 시간이 있으면 disable
			const isRes = resList.some(res => res.rTime === btnTime)

			if (isRes) {
				btn.prop("disabled", true).addClass("reserved");
			} else {
				btn.prop("disabled", false).removeClass("reserved");
			}

		});

		selectTime();

	}

	//시간 선택
	function selectTime() {
		$(".tb1").on("click", function() {
			$(".tb1").removeClass("active");
			$(this).addClass("active");

			selectedTime = $(this).val();
			$("#selectedTime").val(selectedTime);
		});
	}


	//시간 선택 초기화
	function resetTimeSelection() {
		selectedTime = null;
		$("#selectedTime").val("");
		$(".tb1").removeClass("active");
	}

	//예약
	function doReservation() {

		if (!selectedMno || !selectedTime) {
			alert("의사와 시간을 모두 선택해주세요");
			e.preventDefault();
			return;
		}
		
		// textarea 값 복사
		$("#resContent").val($("#rc").val());

		// form submit
        $("#resform").submit();
	}

	$("#resAnd").off("click").on("click", function() {
		doReservation();
	});


	//캘린더 + 날짜 선택
	function showCalendar() {
		//calender
		const today = new Date();
		const startOfThisMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		// 다다음 달 마지막 날
		const endOfNext2Month = new Date(today.getFullYear(), today.getMonth() + 2 + 1, 0);
		// 타임존 보정: 하루를 더해서 문제 예방
		endOfNext2Month.setHours(23, 59, 59, 999);

		if (!calendar) {
			calendar = new FullCalendar.Calendar(document.getElementById('fc'), {
				//기본 스타일 변경
				headerToolbar: {
					start: '',
					center: 'prev,title,next',
					end: ''
				},
				showNonCurrentDates: false,

				// 이동 가능 범위 제한 (현재달부터 두달 뒤 까지만)
				validRange: {
					start: startOfThisMonth,   // 이번 달 시작
					end: endOfNext2Month       // 다다음 달 마지막 날
				},

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

				//선택한 날짜 파란배경
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

					resetTimeSelection();

					//선택한 날짜 정보 전송
					selectedDate = info.dateStr;

					//요일 정보
					const days = ['일', '월', '화', '수', '목', '금', '토'];
					const today = new Date(selectedDate);
					const day = days[today.getDay()];
					const selectedDay = `(${day})`;

					if (selectedMno) {
						sendDateToServer(selectedMno, selectedDate);
					}

					$("#selectedDate").val(selectedDate);
					$("#selectedDays").val(selectedDay);

				},

				//날짜 선택
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

				//"오늘" 문구 추가
				dayCellContent: function(arg) {
					const date = arg.date;
					const today = new Date();

					// 날짜 텍스트
					let html = `<div class="fc-day-number">${date.getDate()}</div>`;

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

		} else {
			calendar.updateSize(); // 이미 렌더링 됐으면 크기 재계산
		}
	}



});






