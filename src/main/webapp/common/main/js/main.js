function formSubmit(url, paramName, paramValue) {
	const form = document.createElement("form");
	form.method = "POST";
	form.action = url;

	const input = document.createElement("input");
	input.type = "hidden";
	input.name = paramName;
	input.value = paramValue;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
}
function searchKeyword() {
	const keyword = $("#searchInput").val();
	location.href = `/ieum/search?keyword=${keyword}`;
}
function goHosDetail(hNo) {
	formSubmit("/ieum/hospital/detail", "hNo", hNo);
}

function goNoticeDetail(nNo) {
	formSubmit("/ieum/notice", "nNo", nNo);
}
// 지도
function success({ coords, timestamp }) {
	const latitude = coords.latitude;   // 위도
	const longitude = coords.longitude; // 경도
	//	console.log(`사용자 현위치: 위도:${latitude}, 경도:${longitude}, 위치반환시간:${new Date(timestamp).toLocaleString()}`);


	const mapContainer = document.getElementById('map');
	// 사용자 현위치를 중심으로 설정
	const mapOption = {
		center: new kakao.maps.LatLng(latitude, longitude),
		level: 5
	};
	// 지도 생성
	const map = new kakao.maps.Map(mapContainer, mapOption);
	// 사용자 현위치에 마커 표시
	const marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(latitude, longitude),
		map: map
	});

	// 병원 정보팝업
	//	const infowindow = new kakao.maps.InfoWindow({
	//		content: `
	//        <div class="map-popup">
	//					<div class="map-hospital-info">
	//						<div class="title">${mapInfo.hNm}</div>
	//						<div class="tel">${mapInfo.hTel}</div>
	//						<div class="map-text address">${mapInfo.hAddress}</div>
	//						<div class="transfer">${mapInfo.transferInfo}</div>
	//						<div>
	//							<div class="map-text">진료안내</div>
	//							<div class="map-text">월요일~금요일 : 오전9시~오후6시</div>
	//							<div class="map-text">점심시간 : 12시~오후1시</div>
	//							<div class="map-text red">${mapInfo.holidayInfo}</div>
	//						</div>
	//					</div>
	//				</div>
	//        `
	//	});
	//	infowindow.open(map, marker);
	mapContainer.style.display = "block";
	map.relayout();
	// 현재 URL 가져오기
	const url = new URL(window.location.href);
	if (!url.searchParams.has("lat") && !url.searchParams.has("lon")) {
		url.searchParams.set("lat", latitude);
		url.searchParams.set("lon", longitude);
		window.location.href = url;
	}
}

function error(err) {
	console.log("위치 정보를 가져올 수 없습니다. 위치 접근을 허용해주세요.");
}

function getUserLocation() {
	navigator.geolocation.getCurrentPosition(success, error);
}

$(document).ready(function() {
	// 키워드 검색
	$("#searchBtn").on("click", function() {
		searchKeyword();
	})
	$("#searchInput").on("keypress", function(e) {
		if (e.which === 13) {
			e.preventDefault();
			searchKeyword();
		}
	});
	// 사용자 현위치 조회
	getUserLocation();
	// 추천병원카드 스크롤
	const hospitalList = $(".hospital-list");
	const leftBtn = $(".hospital-btn-left");
	const rightBtn = $(".hospital-btn-right");

	const scrollStep = 218; // 카드 + 간격 너비
	leftBtn.on("click", function() {
		hospitalList.animate(
			{ scrollLeft: hospitalList.scrollLeft() - scrollStep },
			400
		);
	});

	rightBtn.on("click", function() {
		hospitalList.animate(
			{ scrollLeft: hospitalList.scrollLeft() + scrollStep },
			400
		);
	});
	// 캘린더
	var calendar = new FullCalendar.Calendar(document.getElementById('fc'), {
		selectable: true,
		headerToolbar: false,
		initialView: 'dayGridMonth',
		// 데이터 가져오기
		events: function(fetchInfo, successCallback, failureCallback) {
			// fetchInfo.start, fetchInfo.end -> FullCalendar가 보내는 시작/끝 날짜
			const start = fetchInfo.startStr; // "2025-09-01"
			const end = fetchInfo.endStr;     // "2025-09-30"
			// 1. 다이어리 이벤트 가져오기
			$.ajax({
				url: '/ieum/myPage/diary/event',
				type: 'GET',
				data: { start: start, end: end },
				success: function(res) {
					successCallback(res);
				},
				error: function(e) {
					console.log("캘린더 - 다이어리 조회 오류", e);
					failureCallback(e);
				}
			});
			// 2. 예약 이벤트 가져오기
			$.ajax({
				url: '/ieum/myPage/reservation/event',
				type: 'GET',
				data: { start: start, end: end },
				success: function(res) {
					successCallback(res);
				},
				error: function(e) {
					console.log("캘린더 - 예약내역 조회 오류", e);
					failureCallback(e);
				}
			});
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
		dateClick: function(info) {
			const clickedDate = info.date;
			const today = new Date();
			if (clickedDate <= today) {
				location.href = "/ieum/myPage/diary?page=1"
			}
			else if (clickedDate > today) {
				location.href = "/ieum/myPage/reservation/list"
			}
			//			
		}
	});
	calendar.render();
});