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

	const resDataUpdate = JSON.parse(localStorage.getItem("resData"));

	if (resDataUpdate != null) {
		$("#nav2").addClass("active");
		$("#tab2").addClass("active");
		$("#tab1").removeClass("active");
		$("#nav1").removeClass("active");

		console.log("왜");

		const dataStr = localStorage.getItem("resData");
		if (!dataStr) return; // 이전 데이터 없으면 그냥 종료

		console.log("안되잖아");

		const data = JSON.parse(dataStr);
		const mNo = data.mNo;
		console.log(">>>>", mNo)
		const rDate = data.rDate;
		const rTime = data.rTime;

		//의사 선택
		$(".docter-box").each(function() {
			if ($(".dall").data("mno") == mNo) {
				$(this).addClass("active");
				selectedMno = mNo;
			}
		});

		showCalendar();

		//날짜 선택
		$("#tab3").each(function() {
			if ($(".select-date").data("rdate") == rDate) {
				$(this).addClass("active");
				selectedDate = rDate;
			}
		});

		$("#selectedDate").val(rDate);
		selectedMno = mNo;
		selectedDate = rDate;
		sendDateToServer(selectedMno, selectedDate);

		//시간 선택
		$("#tab3").each(function() {
			if ($(".select-date").data("rtime") == rTime) {
				$(".tb1").addClass("active");
			}
		});

		//모든 데이터 반영 후 삭제 (일회성)
		localStorage.removeItem("resData");

	}


	//기본 초기화
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
	
	function checkUserType() {
		let userType = $('.navr').data('label');
      if(userType != "USER"){
         alert("사용자 이외 계정은 예약 권한이 불가능합니다.");
         return;
      }
		
	}

	//하단 버튼 (예약하기)
	$(document).on('click', '#resbtn', function() {
		if (resLogin(uNo)) {
			checkUserType();
		}	
		activeReservation();
	});

	// 오른쪽 탭 (예약하기)
	navr.click(function() {
		if (resLogin(uNo)) {
			checkUserType();
		}		
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

	}

	//의사 선택
	function selectDoc() {

		//시간탭 숨김
		$("#tab3").hide();
		$("#rescont").hide();
		$("#resAnd").hide();

		$(document).off("click", ".dall").on("click", ".dall", function() {
			$(".dall").removeClass("active");
			$(this).addClass("active");
			$("#tab3").slideDown(500);
			showCalendar();

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
			resetTimeSelection();

		});
	}


	//의사 선택 + 날짜 선택 보내기
	function sendDateToServer(mNo, rDate, callback) {
		$.post("/ieum/hospital/detail", {
			mNo: mNo,
			rDate: rDate,
			action: "getResDate"
		})
			.done(function(result) {
				showTime(result, rDate);
				if (callback) callback();

			})
			.fail(function(err) {
				console.error("예약 정보 불러오기 실패:", err);

			});
	}

	function showTime(resList, rDateStr) {
		const now = new Date();
		const currentHours = now.getHours();
		const currentMinutes = now.getMinutes();

		const today = new Date();
		const rDate = new Date(rDateStr);

		// 오늘 날짜인지 비교
		const isToday =
			rDate.getFullYear() === today.getFullYear() &&
			rDate.getMonth() === today.getMonth() &&
			rDate.getDate() === today.getDate();

		$(".tb1").each(function() {
			const btn = $(this);
			const btnTime = btn.val(); // 예: "10:00"

			// 예약된 시간 여부
			const isRes = resList.some(res => res.rTime === btnTime);

			// 오늘 날짜일 때만 과거 시간 비교
			let isPast = false;
			if (isToday) {
				const [btnHours, btnMinutes] = btnTime.split(":").map(Number);
				isPast =
					btnHours < currentHours ||
					(btnHours === currentHours && btnMinutes < (currentMinutes + 20));
			}

			// 비활성화 조건: 예약되었거나 (오늘 & 지난시간)
			if (isRes || isPast) {
				btn.prop("disabled", true).addClass("reserved");
			} else {
				btn.prop("disabled", false).removeClass("reserved");
			}
		});

		// 시간 선택 로직 실행
		selectTime();
	}



	//시간 선택
	function selectTime() {
		$(".tb1").on("click", function() {

			//content창
			$("#rescont").slideDown(500);
			$("#resAnd").delay(500).show();

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
	function doReservation(e) {

		if (!selectedMno || !selectedTime) {
			alert("상담사와 시간을 모두 선택해주세요!");
			e.preventDefault();
			return;
		}

		// textarea 값 복사
		$("#resContent").val($("#rc").val());

		// form submit
		$("#resform").submit();
	}

	$("#resAnd").off("click").on("click", function(e) {
		doReservation(e);
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

	// 상세 페이지 즐겨찾기
	$(document).on("click", ".fav-btn", function(e) {
		const btn = $(this);
		const wrapper = btn.closest(".share");
		const hNo = wrapper.data("hno");

		toggleFavorite(btn, hNo); // wrapper 생략 가능
	});

	//로그인 모달
	function resLogin(uNo) {
		let res = true;
		if (!uNo || uNo === 0) {
			//예약 로그인 모달
			res = false;
			$("#modalResNeedLogin").show();			
		}
		

		//모달 닫기
		$("#xBtn, #modalClose").off("click").on("click", function() {
			$("#modalResNeedLogin").hide();
			location.reload();
		});

		//로그인하러가기
		$(document).off("click", "#modalGoLogin").on("click", "#modalGoLogin", function(e) {
			e.preventDefault();
			const currentUrl = window.location.href;
			// 로그인 페이지로 이동, redirect 파라미터로 현재 페이지 전달
			window.location.href = "/ieum/login?redirect=" + encodeURIComponent(currentUrl);
		});
		return res;
	}

	//url 버튼
	$("#shareBtn").on("click", function() {
		const currentUrl = window.location.href; // 현재 페이지 URL

		// 클립보드에 복사
		navigator.clipboard.writeText(currentUrl)
			.then(() => {
				alert("URL이 복사되었습니다!");
			})
			.catch(err => {
				console.error("복사 실패:", err);
			});
	});



});








