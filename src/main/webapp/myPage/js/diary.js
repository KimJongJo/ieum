// 페이지네이션 클릭 이벤트
$(".pagination button").on("click", function() {
	const pageNum = $(this).text();
	if ($.isNumeric(pageNum)) { // 숫자 버튼 클릭 시
		$(".pagination button").removeClass("active");
		$(this).addClass("active");
	}
});
function goDetail(dNo) {
	console.log("dNo", dNo);
	const form = document.createElement("form");
	form.method = "POST";
	form.action = "/ieum/myPage/diary";

	const input = document.createElement("input");
	input.type = "hidden";
	input.name = "dNo";
	input.value = dNo;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
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

function cancelWrite() {
	$("#writeConfirmModal").hide();
}
function confirmWrite() {
	$("#writeConfirmModal").hide();
	const date = $("#clickedDt").val();
	// 작성 페이지 이동
	location.href = `/ieum/myPage/diary/write?date=${date}`;
}
function renderList() {
	const sort = $('.notice-select').val();
	const keyword = $("#searchInput").val().trim()
	const urlParams = new URLSearchParams(window.location.search);
	const page = urlParams.get('page') || 1; // 없으면 기본값 1
	$.ajax({
		url: "/ieum/myPage/diary",
		type: "GET",
		async: false,
		data: { keyword: keyword, page: page, sort: sort },
		dataType: "json",
		headers: { 'X-Requested-With': 'XMLHttpRequest' },
		success: function(data) {
			const tbody = $("#diaryListBody");
			const noDataDiv = $("#noSearchList");
			const diaryTable = $("#diaryList");
			const pagination   = $("#pagination");
			 tbody.empty(); // 기존 목록 제거

			if (data.diaryList.length === 0) {
				diaryTable.hide();
				noDataDiv.css('display', 'flex');
				pagination.css('display', 'none');
			} else {
				diaryTable.show();
				noDataDiv.hide();
				pagination.show();
				data.diaryList.forEach(function(diary) {
					let createdDate = '';
					if (diary.dCreated) {
						const dateObj = new Date(diary.dCreated);
						const year = dateObj.getFullYear();
						const month = String(dateObj.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작
						const day = String(dateObj.getDate()).padStart(2, '0');
						createdDate = `${year}-${month}-${day}`;
					}
					const html = `
                    <tr class="diary-item" onclick="goDetail(${diary.dNo})">
                        <td class="diary-title-row">
                            <span class="diary-title">${diary.title}</span>
                        </td>
                        <td><span class="diary-txt">${diary.content}</span></td>
                        <td><span class="diary-date">${createdDate}</span></td>
                        <td class="emoji"><i class="fa-regular fa-face-${diary.mood}"></i></td>
                    </tr>
                `;
					tbody.append(html);
				});
			}
		},
		error: function(xhr, status, error) {
			console.error("검색 실패:", error);
			alert("검색 중 오류가 발생했습니다.");
		}
	});
}
function searchDiary() {
	renderList();
}


function sortDiary(selectElement) {
	renderList();
}

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
		validRange: {
			end: todayFormatDt   // 유효한 범위의 끝 날짜
		},
		// 다이어리 데이터 가져오기
		events: function(fetchInfo, successCallback, failureCallback) {
			// fetchInfo.start, fetchInfo.end -> FullCalendar가 보내는 시작/끝 날짜
			const start = fetchInfo.startStr; // "2025-09-01"
			const end = fetchInfo.endStr;     // "2025-09-30"

			$.ajax({
				url: '/ieum/myPage/diary/event',
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
